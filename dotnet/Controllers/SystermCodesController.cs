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
    public class SystermCodesController : ControllerBase
    {
        private ISystermCodeService _systermCodeService;
		IMapper _mapper;

		public SystermCodesController(ISystermCodeService systermCodeService, IMapper mapper)
        {
            _systermCodeService = systermCodeService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var systermCodes = await _systermCodeService.GetAll();
            return Ok(systermCodes);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<SystermCodesDto>(await _systermCodeService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] SystermCodesDto entity)
		{
			var inputEntity = _mapper.Map<SystermCodes>(entity);
			//if (await _systermCodeService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("SystermCodeName đã tồn tại", true);
			//}
			var result = await _systermCodeService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<SystermCodesDto> entityList)
		{
			var inputEntity = _mapper.Map<List<SystermCodes>>(entityList);
			var result = await _systermCodeService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] SystermCodesDto entity)
		{
			var inputEntity = _mapper.Map<SystermCodes>(entity);
			var result = await _systermCodeService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _systermCodeService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _systermCodeService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _systermCodeService.Paging(page, size);
			var resultData = _mapper.Map<List<SystermCodes>>(result.Item1);
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
