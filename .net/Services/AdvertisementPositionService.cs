using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IAdvertisementPositionService : IBaseService<AdvertisementPositions>
	{

	}

	public class AdvertisementPositionService : BaseService<AdvertisementPositions>, IAdvertisementPositionService
	{
		IAdvertisementPositionRepository _advertisementPositionRepository;
		public AdvertisementPositionService(IAdvertisementPositionRepository advertisementPositionRepository) : base(advertisementPositionRepository)
		{
			_advertisementPositionRepository = advertisementPositionRepository;
		}
	}
}