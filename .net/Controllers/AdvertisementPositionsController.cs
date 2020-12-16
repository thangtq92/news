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
    public class AdvertisementPositionsController : ControllerBase
    {
        private IAdvertisementPositionService _advertisementPositionService;
		IMapper _mapper;

		public AdvertisementPositionsController(IAdvertisementPositionService advertisementPositionService, IMapper mapper)
        {
            _advertisementPositionService = advertisementPositionService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var advertisementPositions = await _advertisementPositionService.GetAll();
            return Ok(advertisementPositions);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<AdvertisementPositionsDto>(await _advertisementPositionService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] AdvertisementPositionsDto entity)
		{
			var inputEntity = _mapper.Map<AdvertisementPositions>(entity);
			//if (await _advertisementPositionService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("AdvertisementPositionName đã tồn tại", true);
			//}
			var result = await _advertisementPositionService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<AdvertisementPositionsDto> entityList)
		{
			var inputEntity = _mapper.Map<List<AdvertisementPositions>>(entityList);
			var result = await _advertisementPositionService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] AdvertisementPositionsDto entity)
		{
			var inputEntity = _mapper.Map<AdvertisementPositions>(entity);
			var result = await _advertisementPositionService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _advertisementPositionService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _advertisementPositionService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _advertisementPositionService.Paging(page, size);
			var resultData = _mapper.Map<List<AdvertisementPositions>>(result.Item1);
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
