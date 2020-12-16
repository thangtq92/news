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
    public class PostRelationsController : ControllerBase
    {
        private IPostRelationService _postRelationService;
		IMapper _mapper;

		public PostRelationsController(IPostRelationService postRelationService, IMapper mapper)
        {
            _postRelationService = postRelationService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var postRelations = await _postRelationService.GetAll();
            return Ok(postRelations);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<PostRelationsDto>(await _postRelationService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] PostRelationsDto entity)
		{
			var inputEntity = _mapper.Map<PostRelations>(entity);
			//if (await _postRelationService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("PostRelationName đã tồn tại", true);
			//}
			var result = await _postRelationService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<PostRelationsDto> entityList)
		{
			var inputEntity = _mapper.Map<List<PostRelations>>(entityList);
			var result = await _postRelationService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] PostRelationsDto entity)
		{
			var inputEntity = _mapper.Map<PostRelations>(entity);
			var result = await _postRelationService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _postRelationService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _postRelationService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _postRelationService.Paging(page, size);
			var resultData = _mapper.Map<List<PostRelations>>(result.Item1);
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
