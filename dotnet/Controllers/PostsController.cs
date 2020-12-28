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
    //[Authorize]
    [ApiController]
    [Route("[controller]")]
    public class PostsController : ControllerBase
    {
        private IPostService _postService;
        IMapper _mapper;

        public PostsController(IPostService postService, IMapper mapper)
        {
            _postService = postService;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var posts = await _postService.GetAll();
            return Ok(posts);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetPost(string id)
        {
            var result = await _postService.GetPost(id);
            return Ok(result);
        }

        [HttpPost]
        public async Task<CustomApiResponse> Post([FromBody] PostsDto entity)
        {
            //var inputEntity = _mapper.Map<Posts>(entity);
            //if (await _postService.IsExisted(entity.Name))
            //{
            //	return new CustomApiResponse("PostName đã tồn tại", true);
            //}
            var result = await _postService.AddPost(entity);
            return new CustomApiResponse(result);
        }

        [HttpPost]
        [Route("AddBulk")]
        public async Task<CustomApiResponse> Post([FromBody] List<PostsDto> entityList)
        {
            var inputEntity = _mapper.Map<List<Posts>>(entityList);
            var result = await _postService.AddBulk(inputEntity);
            return new CustomApiResponse(result);
        }

        [HttpPut()]
        public async Task<CustomApiResponse> Put([FromBody] PostsDto entity)
        {
            //var inputEntity = _mapper.Map<Posts>(entity);
            //var result = await _postService.Update(inputEntity);
            var result = await _postService.UpdatePost(entity);
            return new CustomApiResponse(entity.Id, result ? "Succeeded" : "Failed", !result);
        }

        [HttpDelete("{id}")]
        public async Task<CustomApiResponse> DeletePost(string id)
        {
            var result = await _postService.DeletePost(id);
            return new CustomApiResponse(id, result ? "Succeeded" : "Failed", !result);
        }

        [HttpDelete("Deletes/{ids}")]
        public async Task<CustomApiResponse> Deletes(string ids)
        {
            var result = await _postService.Deletes(ids);
            return new CustomApiResponse(result);
        }

        [HttpGet("Paging")]
        public async Task<CustomApiResponse> Paging(int page = 1, int size = 50)
        {
            var result = await _postService.Paging(page, size);
            var resultData = _mapper.Map<List<Posts>>(result.Item1);
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
