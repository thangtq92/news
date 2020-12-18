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
	[Authorize]
	[ApiController]
    [Route("[controller]")]
    public class MenusController : ControllerBase
    {
        private IMenuService _menuService;
		IMapper _mapper;

		public MenusController(IMenuService menuService, IMapper mapper)
        {
            _menuService = menuService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var menus = await _menuService.GetAll();
            return Ok(menus);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<MenusDto>(await _menuService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] MenusDto entity)
		{
			var inputEntity = _mapper.Map<Menus>(entity);
			//if (await _menuService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("MenuName đã tồn tại", true);
			//}
			var result = await _menuService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<MenusDto> entityList)
		{
			var inputEntity = _mapper.Map<List<Menus>>(entityList);
			var result = await _menuService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] MenusDto entity)
		{
			var inputEntity = _mapper.Map<Menus>(entity);
			var result = await _menuService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _menuService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _menuService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _menuService.Paging(page, size);
			var resultData = _mapper.Map<List<Menus>>(result.Item1);
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
