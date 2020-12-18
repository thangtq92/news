using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface ITagService : IBaseService<Tags>
	{
		Task<bool> IsExisted(string name);

	}

	public class TagService : BaseService<Tags>, ITagService
	{
		ITagRepository _tagRepository;
		public TagService(ITagRepository tagRepository) : base(tagRepository)
		{
			_tagRepository = tagRepository;
		}
		public async Task<bool> IsExisted(string name)
		{
			string SQLQuery = $"Name = '{name}'";
			var tag = await _tagRepository.GetList(SQLQuery);
			return tag.Count() > 0;
		}
	}
}