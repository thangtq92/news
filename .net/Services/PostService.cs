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
    }

    public class PostService : BaseService<Posts>, IPostService
    {
        IMapper _mapper;
        IPostRepository _postRepository;
        IPostInCategoryRepository _postInCategoryRepository;
        public PostService(
            IPostRepository postRepository,
            IPostInCategoryRepository postInCategoryRepository,
            IMapper mapper
        ) : base(postRepository)
        {
            _postRepository = postRepository;
            _postInCategoryRepository = postInCategoryRepository;
            _mapper = mapper;
        }
        public async Task<string> AddPost(PostsDto postDto)
        {
            // add post to get post id
            var postInput = _mapper.Map<Posts>(postDto);
            var postId = await _postRepository.Add(postInput);

            // add cats to postcat
            var postCatDtos = new List<PostInCategoriesDto>();
            var catIds = postDto.categoryIds;
            foreach (var catId in catIds)
            {
                postCatDtos.Add(new PostInCategoriesDto()
                {
                    PostId = Convert.ToInt32(postId),
                    CategoryId = Convert.ToInt32(catId),
                });
            }
            var postCatInputs = _mapper.Map<List<PostInCategories>>(postCatDtos);
            var resultAddPostCat = await _postInCategoryRepository.AddBulk(postCatInputs);
            return postId;
        }
    }
}