using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPostInTagService : IBaseService<PostInTags>
	{

	}

	public class PostInTagService : BaseService<PostInTags>, IPostInTagService
	{
		IPostInTagRepository _postInTagRepository;
		public PostInTagService(IPostInTagRepository postInTagRepository) : base(postInTagRepository)
		{
			_postInTagRepository = postInTagRepository;
		}
	}
}