using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IMenuService : IBaseService<Menus>
	{

	}

	public class MenuService : BaseService<Menus>, IMenuService
	{
		IMenuRepository _menuRepository;
		public MenuService(IMenuRepository menuRepository) : base(menuRepository)
		{
			_menuRepository = menuRepository;
		}
	}
}