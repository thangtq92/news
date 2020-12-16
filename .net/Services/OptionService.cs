using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IOptionService : IBaseService<Options>
	{

	}

	public class OptionService : BaseService<Options>, IOptionService
	{
		IOptionRepository _optionRepository;
		public OptionService(IOptionRepository optionRepository) : base(optionRepository)
		{
			_optionRepository = optionRepository;
		}
	}
}