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
    public class PostInTagsController : ControllerBase
    {
        private IPostInTagService _postInTagService;
		IMapper _mapper;

		public PostInTagsController(IPostInTagService postInTagService, IMapper mapper)
        {
            _postInTagService = postInTagService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var postInTags = await _postInTagService.GetAll();
            return Ok(postInTags);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<PostInTagsDto>(await _postInTagService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] PostInTagsDto entity)
		{
			var inputEntity = _mapper.Map<PostInTags>(entity);
			//if (await _postInTagService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("PostInTagName đã tồn tại", true);
			//}
			var result = await _postInTagService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<PostInTagsDto> entityList)
		{
			var inputEntity = _mapper.Map<List<PostInTags>>(entityList);
			var result = await _postInTagService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] PostInTagsDto entity)
		{
			var inputEntity = _mapper.Map<PostInTags>(entity);
			var result = await _postInTagService.Update(inputEntity);
			return new CustomApiResponse(entity.PostId, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _postInTagService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _postInTagService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _postInTagService.Paging(page, size);
			var resultData = _mapper.Map<List<PostInTags>>(result.Item1);
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
