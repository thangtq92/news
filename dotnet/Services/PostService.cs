using AutoMapper;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
    public interface IPostService : IBaseService<Posts>
    {
        Task<string> AddPost(PostsDto postDto);
        Task<PostsDto> GetPost(string postId);
    }

    public class PostService : BaseService<Posts>, IPostService
    {
        IMapper _mapper;
        IPostRepository _postRepository;
        IPostInCategoryRepository _postInCategoryRepository;
        IPostInTagRepository _postInTagRepository;
        public PostService(
            IPostRepository postRepository,
            IPostInCategoryRepository postInCategoryRepository,
            IPostInTagRepository postInTagRepository,
            IMapper mapper
        ) : base(postRepository)
        {
            _postRepository = postRepository;
            _postInCategoryRepository = postInCategoryRepository;
            _postInTagRepository = postInTagRepository;
            _mapper = mapper;
        }
        public async Task<string> AddPost(PostsDto postDto)
        {
            // add post to get post id
            var postInput = _mapper.Map<Posts>(postDto);
            var postId = await _postRepository.Add(postInput);

            // add cats to postcat
            var postCatDtos = new List<PostInCategoriesDto>();
            var postTagDtos = new List<PostInTagsDto>();
            // add categories
            var catIds = postDto.categoryIds;
            foreach (var catId in catIds)
            {
                postCatDtos.Add(new PostInCategoriesDto()
                {
                    PostId = Convert.ToInt32(postId),
                    CategoryId = Convert.ToInt32(catId),
                });
            }
            // add tags
            var tagIds = postDto.tagIds;
            foreach (var tagId in tagIds)
            {
                postTagDtos.Add(new PostInTagsDto()
                {
                    PostId = Convert.ToInt32(postId),
                    TagId = Convert.ToInt32(tagId),
                });
            }
            var postCatInputs = _mapper.Map<List<PostInCategories>>(postCatDtos);
            var postTagInputs = _mapper.Map<List<PostInTags>>(postTagDtos);

            var resultAddPostCat = await _postInCategoryRepository.AddBulk(postCatInputs);
            var resultAddPosTag = await _postInTagRepository.AddBulk(postTagInputs);
            return postId;
        }
        public async Task<PostsDto> GetPost(string postId)
        {
            //get Post
            var post = await _postRepository.Get(postId);
            var postDto = _mapper.Map<PostsDto>(post);

            // get categories
            string sqlQuery = $"PostId = {postId}";
            var cats = await _postInCategoryRepository.GetList(sqlQuery);
            var catIds = new List<string>();
            foreach(var cat in cats)
            {
               catIds.Add(cat.CategoryId.ToString());
            }
            postDto.categoryIds = catIds;
            return postDto;
        }
    }
}