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
    public class PageStaticsController : ControllerBase
    {
        private IPageStaticService _pageStaticService;
		IMapper _mapper;

		public PageStaticsController(IPageStaticService pageStaticService, IMapper mapper)
        {
            _pageStaticService = pageStaticService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var pageStatics = await _pageStaticService.GetAll();
            return Ok(pageStatics);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<PageStaticsDto>(await _pageStaticService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] PageStaticsDto entity)
		{
			var inputEntity = _mapper.Map<PageStatics>(entity);
			//if (await _pageStaticService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("PageStaticName đã tồn tại", true);
			//}
			var result = await _pageStaticService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<PageStaticsDto> entityList)
		{
			var inputEntity = _mapper.Map<List<PageStatics>>(entityList);
			var result = await _pageStaticService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] PageStaticsDto entity)
		{
			var inputEntity = _mapper.Map<PageStatics>(entity);
			var result = await _pageStaticService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _pageStaticService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _pageStaticService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _pageStaticService.Paging(page, size);
			var resultData = _mapper.Map<List<PageStatics>>(result.Item1);
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
