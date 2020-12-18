using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPostInCategoryService : IBaseService<PostInCategories>
	{

	}

	public class PostInCategoryService : BaseService<PostInCategories>, IPostInCategoryService
	{
		IPostInCategoryRepository _postInCategoryRepository;
		public PostInCategoryService(IPostInCategoryRepository postInCategoryRepository) : base(postInCategoryRepository)
		{
			_postInCategoryRepository = postInCategoryRepository;
		}
	}
}