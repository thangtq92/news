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
    public class PostInCategoriesController : ControllerBase
    {
        private IPostInCategoryService _postInCategoryService;
		IMapper _mapper;

		public PostInCategoriesController(IPostInCategoryService postInCategoryService, IMapper mapper)
        {
            _postInCategoryService = postInCategoryService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var postInCategorys = await _postInCategoryService.GetAll();
            return Ok(postInCategorys);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<PostInCategoriesDto>(await _postInCategoryService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] PostInCategoriesDto entity)
		{
			var inputEntity = _mapper.Map<PostInCategories>(entity);
			//if (await _postInCategoryService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("PostInCategoryName đã tồn tại", true);
			//}
			var result = await _postInCategoryService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<PostInCategoriesDto> entityList)
		{
			var inputEntity = _mapper.Map<List<PostInCategories>>(entityList);
			var result = await _postInCategoryService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] PostInCategoriesDto entity)
		{
			var inputEntity = _mapper.Map<PostInCategories>(entity);
			var result = await _postInCategoryService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _postInCategoryService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _postInCategoryService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _postInCategoryService.Paging(page, size);
			var resultData = _mapper.Map<List<PostInCategories>>(result.Item1);
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
