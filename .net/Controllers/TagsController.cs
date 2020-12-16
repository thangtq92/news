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
  public class TagsController : ControllerBase
  {
    private ITagService _tagService;
    IMapper _mapper;

    public TagsController(ITagService tagService, IMapper mapper)
    {
      _tagService = tagService;
      _mapper = mapper;
    }

    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
      var tags = await _tagService.GetAll();
      return Ok(tags);
    }

		[HttpGet("{id}")]
    public async Task<IActionResult> Get(string id)
    {
      var result = await _tagService.Get(id);
      return Ok(result);
    }

    [HttpPost]
    public async Task<CustomApiResponse> Post([FromBody] TagsDto entity)
    {
      var inputEntity = _mapper.Map<Tags>(entity);
      if (await _tagService.IsExisted(entity.Name))
      {
        return new CustomApiResponse("TagName đã tồn tại", true);
      }
      var result = await _tagService.Add(inputEntity);
      return new CustomApiResponse(result);
    }

    [HttpPost]
    [Route("AddBulk")]
    public async Task<CustomApiResponse> Post([FromBody] List<TagsDto> entityList)
    {
      var inputEntity = _mapper.Map<List<Tags>>(entityList);
      var result = await _tagService.AddBulk(inputEntity);
      return new CustomApiResponse(result);
    }

    [HttpPut()]
    public async Task<CustomApiResponse> Put([FromBody] TagsDto entity)
    {
      var inputEntity = _mapper.Map<Tags>(entity);
      var result = await _tagService.Update(inputEntity);
      return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
    }

    [HttpDelete("{id}")]
    public async Task<CustomApiResponse> Delete(string id)
    {
      var result = await _tagService.Delete(id);
      return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
    }

    [HttpDelete("Deletes/{ids}")]
    public async Task<CustomApiResponse> Deletes(string ids)
    {
      var result = await _tagService.Deletes(ids);
      return new CustomApiResponse(result);
    }

    [HttpGet("Paging")]
    public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
    {
      var result = await _tagService.Paging(page, size);
      var resultData = _mapper.Map<List<Tags>>(result.Item1);
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
