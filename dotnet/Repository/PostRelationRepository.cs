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
    public interface IPostRelationRepository : IBaseRepository<PostRelations>
    {
    }

    public class PostRelationRepository : BaseRepository<PostRelations>, IPostRelationRepository
    {
        private readonly IDbConnection cnn = null;
        public PostRelationRepository(SqlServerStorage clientDB)
       : base(clientDB)
        {
            cnn = clientDB.iDbConnection;
        }
    }
}
