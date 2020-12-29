using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
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
        ITagRepository _tagRepository;
        IPostInCategoryRepository _postInCategoryRepository;
        IPostInTagRepository _postInTagRepository;
        public PostService(
            IPostRepository postRepository,
            ITagRepository tagRepository,
            IPostInCategoryRepository postInCategoryRepository,
            IPostInTagRepository postInTagRepository,
            IMapper mapper
        ) : base(postRepository)
        {
            _postRepository = postRepository;
            _tagRepository = tagRepository;
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
            var postCats = await _postInCategoryRepository.GetList(sqlQuery);
            var catIds = postCats.Select(pc => pc.CategoryId).ToList();
            postDto.categoryIds = catIds;
            // get tags
            var tags = await _tagRepository.GetByPostId(Convert.ToInt32(postId));
            var tagNames = tags.Select(t => t.Name).ToList();
            postDto.tagNames = tagNames;
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
            var resultAddPostCat = "Fail";
            if(catIds.Count > 0)
            {
                foreach (var catId in catIds)
                {
                    postCatDtos.Add(new PostInCategoriesDto()
                    {
                        PostId = postId,
                        CategoryId = catId,
                    });
                }
                var postCatInputs = _mapper.Map<List<PostInCategories>>(postCatDtos);
                resultAddPostCat = await _postInCategoryRepository.AddBulk(postCatInputs);
            }
            // add tags
            var tagIds = await getTagIdFromNames(postDto);
            var resultAddPostTag = "Fail";
            if(tagIds.Count > 0)
            {
                foreach (var tagId in tagIds)
                {
                    postTagDtos.Add(new PostInTagsDto()
                    {
                        PostId = postId,
                        TagId = tagId,
                    });
                }
                var postTagInputs = _mapper.Map<List<PostInTags>>(postTagDtos);
                resultAddPostTag = await _postInTagRepository.AddBulk(postTagInputs);
            }
            return resultAddPostCat;
        }
        async Task<List<int>> getTagIdFromNames(PostsDto postDto)
        {
            var tagNames = postDto.tagNames;

            // get tag already
            string sqlGetTag = $"Name IN ('{string.Join("','", tagNames)}')";
            var alreadyTags = await _tagRepository.GetList(sqlGetTag);
            var alreadyTagNames = alreadyTags.Select(t => t.Name).ToList();

            // get new tag
            var newTagsNames = tagNames.Except(alreadyTagNames).ToList();

            var newTagIds = new List<int>();
            if (newTagsNames.Count > 0)
            {
                var tagDtos = new List<TagsDto>();
                foreach(var nt in newTagsNames)
                {
                    tagDtos.Add(new TagsDto()
                    {
                        Name = nt
                    });
                }
                var inputTags = _mapper.Map<List<Tags>>(tagDtos);
                var tagAdds = await _tagRepository.AddBulk(inputTags);
                newTagIds = tagAdds.Split(",").Select(t => Convert.ToInt32(t)).ToList();
            }

            // join 2 list id tag 
            var alreadyTagIds = alreadyTags.Select(t => t.Id).ToList();
            var result = alreadyTagIds.Concat(newTagIds).ToList();
            return result;
        }
    }
}