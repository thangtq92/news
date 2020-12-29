using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using WebApi.Helpers.Extension;
using WebApi.Helpers.SqlServerDB;
using static System.Data.CommandType;

namespace WebApi.Repository
{
	public class EntityBase
	{
		public long Id { get; set; }
	}
	public interface IBaseRepository<TEntity>
	{
		Task<IList<TEntity>> GetAll();


		Task<TEntity> Get(string id);


		Task<string> Add(TEntity entity);



		Task<string> AddBulk(IList<TEntity> entityList);


		Task<bool> Update(TEntity entity);


		Task<bool> Updates(string sSet, string sWhere);


		Task<bool> Delete(string id);

		Task<string> Deletes(string sWhere);

		Task<(List<TEntity>, long)> Paging(int currentPage, int pageSize);

		Task<List<TEntity>> GetList(string sWhere, string sOrder = "", int fromRow = 0, int toRow = 0);

	}

	public class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class
	{
		private readonly IDbConnection cnn = null;

		public BaseRepository(SqlServerStorage clientDB)
		{
			cnn = clientDB.iDbConnection;
		}

		public async Task<IList<TEntity>> GetAll()
		{
			try
			{
				var result = await cnn.QueryAsync<TEntity>(typeof(TEntity).Name + "_GetAll", commandType: StoredProcedure);
				return result.ToList();

			}
			catch (Exception ex)
			{
				return new List<TEntity>();
			}

		}

		public async Task<TEntity> Get(string id)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@Id", id, DbType.String);
			var result = await cnn.QueryAsync<TEntity>(typeof(TEntity).Name + "_GetById", parameters, commandType: StoredProcedure);
			return result.FirstOrDefault();
		}

		public async Task<string> Add(TEntity entity)
		{
			try
			{
				DynamicParameters parameters = new DynamicParameters();
				parameters.AddDynamicParams(entity);
				parameters.Add("Id", direction: ParameterDirection.ReturnValue);
				parameters.RemoveUnused = true;
				var result = await cnn.ExecuteScalarAsync(typeof(TEntity).Name + "_Insert", param: parameters, commandType: CommandType.StoredProcedure);
				return (string)result.ToString();
			}
			catch (Exception ex)
			{
				return ex.Message;
			}

		}


		public async Task<string> AddBulk(IList<TEntity> entityList)
		{
			try
			{
				DynamicParameters parameters = new DynamicParameters();
				parameters.Add("@XMLDOC", ExtensionXml<TEntity>.ToXml(entityList), DbType.String);
				var result = await cnn.QueryAsync<EntityBase>(typeof(TEntity).Name + "_Inserts", param: parameters, commandType: StoredProcedure);
				return result != null ? string.Join(',', result.Select(i => i.Id).ToList()) : string.Empty;
			}
			catch (Exception ex)
			{
				return ex.Message;
			}

		}

		public async Task<bool> Update(TEntity entity)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.AddDynamicParams(entity);
			var result = await cnn.ExecuteAsync(typeof(TEntity).Name + "_Update", param: parameters, commandType: StoredProcedure);
			return result > 0;
		}

		/// <summary>
		/// Recommendation: Not recommended for API. This code is not safe, maybe SQL Inject
		/// </summary>
		/// <param name="sSet"></param>
		/// <param name="sWhere"></param>
		/// <returns></returns>
		public async Task<bool> Updates(string sSet, string sWhere)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@sSet", sSet);
			parameters.Add("@sWhere", sWhere);
			var result = await cnn.ExecuteScalarAsync(typeof(TEntity).Name + "_Updates", param: parameters, commandType: StoredProcedure);
			return (int)result > 0;
		}

		public async Task<bool> Delete(string id)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@Id", id);
			var result = await cnn.ExecuteAsync(typeof(TEntity).Name + "_Delete", param: parameters, commandType: StoredProcedure);
			return result > 0;
		}

		public async Task<string> Deletes(string sWhere)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@sWhere", sWhere);
			var result = await cnn.QueryAsync<EntityBase>(typeof(TEntity).Name + "_Deletes", param: parameters, commandType: StoredProcedure);
			return result != null ? string.Join(',', result.Select(i => i.Id).ToString()) : string.Empty;
		}

		public async Task<(List<TEntity>, long)> Paging(int currentPage, int pageSize)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@currentPage", currentPage);
			parameters.Add("@rowsInpage", pageSize);
			parameters.Add("@totalRows", pageSize, DbType.Int64, ParameterDirection.Output);

			var result = await cnn.QueryAsync<TEntity>(typeof(TEntity).Name + "_Paging", parameters, commandType: StoredProcedure);
			long totalRows = parameters.Get<long>("@totalRows");

			return (result.ToList(), totalRows);
		}

		public async Task<List<TEntity>> GetList(string sWhere, string sOrder, int fromRow, int toRow)
		{

			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@sWhere", sWhere);
			parameters.Add("@sOrder", sOrder);
			parameters.Add("@fromRow", fromRow);
			parameters.Add("@toRow", toRow);
			var result = await cnn.QueryAsync<TEntity>(typeof(TEntity).Name + "_List", parameters, commandType: StoredProcedure);
			return result.ToList();
		}
		public void Dispose()
		{
			if (cnn != null)
			{
				cnn.Dispose();
			}
		}
	}
}
