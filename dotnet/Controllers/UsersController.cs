using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Models;
using WebApi.Services;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        private IUserService _userService;
		IMapper _mapper;

		public UsersController(IUserService userService, IMapper mapper)
        {
            _userService = userService;
			_mapper = mapper;
		}

        [HttpPost("authenticate")]
        public async Task<IActionResult> Authenticate(AuthenticateRequest model)
        {
            var response = await _userService.Authenticate(model);

            if (response == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(response);
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var users = await _userService.GetAll();
            return Ok(users);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<UsersDto>(await _userService.Get(id));
			return new CustomApiResponse(result);
		}


		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] UsersDto entity)
		{
			var inputEntity = _mapper.Map<Users>(entity);
			if (await _userService.IsExisted(entity.UserName))
			{
				return new CustomApiResponse("UserName đã tồn tại", true);
			}
			string hashPass = Security.HashSHA1(inputEntity.Password + inputEntity.UserName);
			inputEntity.Password = hashPass;
			var result = await _userService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<UsersDto> entityList)
		{
			var inputEntity = _mapper.Map<List<Users>>(entityList);
			var result = await _userService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] UsersDto entity)
		{
			var inputEntity = _mapper.Map<Users>(entity);
			var result = await _userService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		/// <summary>
		/// Returns the id have been deleted
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _userService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
		/// <summary>
		/// Returns the list of Ids have been deleted
		/// </summary>
		/// <param name="ids"></param>
		/// <returns></returns>
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _userService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _userService.Paging(page, size);
			var resultData = _mapper.Map<List<Users>>(result.Item1);
			var totalRows = result.Item2;
			return new CustomApiResponse(resultData,
			 new Pagination
			 {
				 CurrentPage = page,
				 PageSize = size,
				 TotalItemsCount = totalRows
			 });
		}
	}
}
