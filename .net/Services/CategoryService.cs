using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface ICategoryService : IBaseService<Categories>
	{

	}

	public class CategoryService : BaseService<Categories>, ICategoryService
	{
		ICategoryRepository _categoryRepository;
		public CategoryService(ICategoryRepository categoryRepository) : base(categoryRepository)
		{
			_categoryRepository = categoryRepository;
		}
	}
}