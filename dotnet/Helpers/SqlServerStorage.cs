﻿using Microsoft.Extensions.Options;
using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApi.Helpers.SqlServerDB
{
    public class SqlServerStorageConfig
    {
        public string DefaultConnection { get; set; }

        public string ConnectionString
        {
            get { return DefaultConnection; }
        }
    }
    public class SqlServerStorage : IDisposable
    {
        private SqlServerStorageConfig _config;
        private SqlConnection _sqlConnection;

        public IDbConnection iDbConnection
        {
            get
            {
    //            if(_sqlConnection == null)
				//{
                    var _sqlConnection = new SqlConnection(_config.ConnectionString);
                    try
					{
                        _sqlConnection.Open();
                    } finally
					{
                        _sqlConnection.Close();
                    }
                //}
                return _sqlConnection;
            }
            set { }
        }

        public SqlServerStorage(IOptions<SqlServerStorageConfig> options)
        {
            if (options == null)
            {
                throw new ArgumentNullException(nameof(options));
            }
            _config = options.Value;
        }

        /// <summary>
        /// Finalizes an instance of the <see cref="SqlServerStorage"/> class.
        /// </summary>
        public void Dispose()
        {
            _config = null;
            iDbConnection = null;
        }
    }
}
