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
    public class AdvertisementsController : ControllerBase
    {
        private IAdvertisementService _advertisementService;
		IMapper _mapper;

		public AdvertisementsController(IAdvertisementService advertisementService, IMapper mapper)
        {
            _advertisementService = advertisementService;
			_mapper = mapper;
		}
       
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var advertisements = await _advertisementService.GetAll();
            return Ok(advertisements);
        }

		[HttpGet("{id}")]
		public async Task<CustomApiResponse> Get(string id)
		{
			var result = _mapper.Map<AdvertisementsDto>(await _advertisementService.Get(id));
			return new CustomApiResponse(result);
		}

		[HttpPost]
		public async Task<CustomApiResponse> Post([FromBody] AdvertisementsDto entity)
		{
			var inputEntity = _mapper.Map<Advertisements>(entity);
			//if (await _advertisementService.IsExisted(entity.Name))
			//{
			//	return new CustomApiResponse("AdvertisementName đã tồn tại", true);
			//}
			var result = await _advertisementService.Add(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPost]
		[Route("AddBulk")]
		public async Task<CustomApiResponse> Post([FromBody] List<AdvertisementsDto> entityList)
		{
			var inputEntity = _mapper.Map<List<Advertisements>>(entityList);
			var result = await _advertisementService.AddBulk(inputEntity);
			return new CustomApiResponse(result);
		}

		[HttpPut()]
		public async Task<CustomApiResponse> Put([FromBody] AdvertisementsDto entity)
		{
			var inputEntity = _mapper.Map<Advertisements>(entity);
			var result = await _advertisementService.Update(inputEntity);
			return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
		}
		
		[HttpDelete("{id}")]
		public async Task<CustomApiResponse> Delete(string id)
		{
			var result = await _advertisementService.Delete(id);
			return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
		}
	
		[HttpDelete("Deletes/{ids}")]
		public async Task<CustomApiResponse> Deletes(string ids)
		{
			var result = await _advertisementService.Deletes(ids);
			return new CustomApiResponse(result);
		}

		[HttpGet("Paging")]
		public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
		{
			var result = await _advertisementService.Paging(page, size);
			var resultData = _mapper.Map<List<Advertisements>>(result.Item1);
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
