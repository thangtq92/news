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
        Task<bool> UpdatePost(PostsDto postDto);
        Task<bool> DeletePost(string postId);
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
            postDto.Id = Convert.ToInt32(postId);

            await addTagAndCategories(postDto);
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
            var catIds = new List<int>();
            foreach (var cat in cats)
            {
                catIds.Add(cat.CategoryId);
            }
            postDto.categoryIds = catIds;
            // get tags
            var tags = await _postInTagRepository.GetList(sqlQuery);
            var tagIds = new List<int>();
            foreach (var tag in tags)
            {
                tagIds.Add(tag.TagId);
            }
            postDto.tagIds = tagIds;
            return postDto;
        }
        public async Task<bool> UpdatePost(PostsDto postDto)
        {
            // update post
            var inputEntity = _mapper.Map<Posts>(postDto);
            var result = await _postRepository.Update(inputEntity);

            // delete tag and categories
            await deleteTagAndCategories(postDto.Id.ToString());
            // re insert tag and categories
            await addTagAndCategories(postDto);
            return result;
        }
        public async Task<bool> DeletePost(string postId)
        {
            var result = await _postRepository.Delete(postId);
            await deleteTagAndCategories(postId);
            return result;
        }
        async Task<string> deleteTagAndCategories(string postId)
        {
            string sqlDelete = $"PostId = {postId}";
            await _postInCategoryRepository.Deletes(sqlDelete);
            var result = await _postInTagRepository.Deletes(sqlDelete);
            return result;
        }
        async Task<string> addTagAndCategories(PostsDto postDto)
        {
            var postId = postDto.Id;
            // add cats to postcat
            var postCatDtos = new List<PostInCategoriesDto>();
            var postTagDtos = new List<PostInTagsDto>();
            // add categories
            var catIds = postDto.categoryIds;
            foreach (var catId in catIds)
            {
                postCatDtos.Add(new PostInCategoriesDto()
                {
                    PostId = postId,
                    CategoryId = catId,
                });
            }
            // add tags
            var tagIds = postDto.tagIds;
            foreach (var tagId in tagIds)
            {
                postTagDtos.Add(new PostInTagsDto()
                {
                    PostId = postId,
                    TagId = tagId,
                });
            }
            var postCatInputs = _mapper.Map<List<PostInCategories>>(postCatDtos);
            var postTagInputs = _mapper.Map<List<PostInTags>>(postTagDtos);

            var resultAddPostCat = await _postInCategoryRepository.AddBulk(postCatInputs);
            var resultAddPosTag = await _postInTagRepository.AddBulk(postTagInputs);
            return resultAddPostCat;
        }
    }
}