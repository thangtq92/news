using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IBaseService<TEntity>
	{
		Task<IList<TEntity>> GetAll();
		Task<TEntity> Get(string id);
		Task<string> Add(TEntity entity);
		Task<string> AddBulk(IList<TEntity> entity);
		Task<bool> Update(TEntity entity);
		Task<bool> Updates(string sSet, string sWhere);
		Task<bool> Delete(string id);
		Task<string> Deletes(string ids);

		Task<(List<TEntity>, long)> Paging(int currentPage, int pageSize);

		
	}
	public class BaseService<TEntity> : IBaseService<TEntity> where TEntity : class
	{
		readonly IBaseRepository<TEntity> _baseCategoryRepository = null;
		public BaseService(IBaseRepository<TEntity> baseCategoryRepository)
		{
			_baseCategoryRepository = baseCategoryRepository;
		}
		public async Task<string> Add(TEntity entity)
		{
			return await _baseCategoryRepository.Add(entity);
		}
		public async Task<string> AddBulk(IList<TEntity> entity)
		{
			return await _baseCategoryRepository.AddBulk(entity);
		}
		public async Task<IList<TEntity>> GetAll()
		{
			var dataList = await _baseCategoryRepository.GetAll();
			return dataList;
		}

		public async Task<TEntity> Get(string id)
		{
			return await _baseCategoryRepository.Get(id);
		}

		public async Task<bool> Update(TEntity entity)
		{
			return await _baseCategoryRepository.Update(entity);
		}
		public async Task<bool> Updates(string sSet, string sWhere)
		{
			return await _baseCategoryRepository.Updates(sSet, sWhere);
		}

		public async Task<bool> Delete(string id)
		{
			return await _baseCategoryRepository.Delete(id);
		}

		public async Task<string> Deletes(string ids)
		{
			ids = ids.TrimEnd(',');
			if (!string.IsNullOrWhiteSpace(ids))
			{
				Regex pattern = new Regex("[,]|[',']{2}");
				ids = pattern.Replace(ids, "','");
			}
			return await _baseCategoryRepository.Deletes(string.Format("Id IN ('{0}')", ids));
		}

		public async Task<(List<TEntity>, long)> Paging( int currentPage, int pageSize)
		{
			var dataList = await _baseCategoryRepository.Paging(currentPage, pageSize);
			return dataList;
		}

	}
}
