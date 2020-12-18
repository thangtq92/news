using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers.Extension;
using WebApi.Helpers.SqlServerDB;
using static System.Data.CommandType;

namespace WebApi.Repository
{
    public interface IPostRepository : IBaseRepository<Posts>
    {
    }

    public class PostRepository : BaseRepository<Posts>, IPostRepository
    {
        private readonly IDbConnection cnn = null;
        public PostRepository(SqlServerStorage clientDB)
       : base(clientDB)
        {
            cnn = clientDB.iDbConnection;
        }
    }
}
