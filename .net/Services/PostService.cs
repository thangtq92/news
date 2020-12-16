using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPostService : IBaseService<Posts>
	{

	}

	public class PostService : BaseService<Posts>, IPostService
	{
		IPostRepository _postRepository;
		public PostService(IPostRepository postRepository) : base(postRepository)
		{
			_postRepository = postRepository;
		}
	}
}