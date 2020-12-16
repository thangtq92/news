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
  // [Authorize]
  [ApiController]
  [Route("[controller]")]
  public class CategoriesController : ControllerBase
  {
    private ICategoryService _categoryService;
    IMapper _mapper;

    public CategoriesController(ICategoryService categoryService, IMapper mapper)
    {
      _categoryService = categoryService;
      _mapper = mapper;
    }

    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
      var categorys = await _categoryService.GetAll();
      return Ok(categorys);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> Get(string id)
    {
      var result = await _categoryService.Get(id);
      return Ok(result);
    }

    [HttpPost]
    public async Task<CustomApiResponse> Post([FromBody] CategoriesDto entity)
    {
      var inputEntity = _mapper.Map<Categories>(entity);
      //if (await _categoryService.IsExisted(entity.Name))
      //{
      //	return new CustomApiResponse("CategoryName đã tồn tại", true);
      //}
      var result = await _categoryService.Add(inputEntity);
      return new CustomApiResponse(result);
    }

    [HttpPost]
    [Route("AddBulk")]
    public async Task<CustomApiResponse> Post([FromBody] List<CategoriesDto> entityList)
    {
      var inputEntity = _mapper.Map<List<Categories>>(entityList);
      var result = await _categoryService.AddBulk(inputEntity);
      return new CustomApiResponse(result);
    }

    [HttpPut()]
    public async Task<CustomApiResponse> Put([FromBody] CategoriesDto entity)
    {
      var inputEntity = _mapper.Map<Categories>(entity);
      var result = await _categoryService.Update(inputEntity);
      return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
    }

    [HttpDelete("{id}")]
    public async Task<CustomApiResponse> Delete(string id)
    {
      var result = await _categoryService.Delete(id);
      return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
    }

    [HttpDelete("Deletes/{ids}")]
    public async Task<CustomApiResponse> Deletes(string ids)
    {
      var result = await _categoryService.Deletes(ids);
      return new CustomApiResponse(result);
    }

    [HttpGet("Paging")]
    public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
    {
      var result = await _categoryService.Paging(page, size);
      var resultData = _mapper.Map<List<Categories>>(result.Item1);
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
