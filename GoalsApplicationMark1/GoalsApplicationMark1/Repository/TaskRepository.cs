﻿using GoalsApplicationMark1.Models;
using Npgsql;
using Dapper;
using Microsoft.Extensions.Configuration;
using System.Data;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GoalsApplicationMark1.Repository
{
    public class TaskRepository : IRepository<Tasks>
    {
        private string connectionString;
        public TaskRepository(IConfiguration configuration)
        {
            connectionString = configuration.GetValue<string>("DBInfo:ConnectionString");
        }

        internal IDbConnection Connection
        {
            get
            {
                return new NpgsqlConnection(connectionString);
            }
        }
        public void Add(Tasks task)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("INSERT INTO tasks (task, description, rank, deadline, category, subcategory) VALUES (@task, @description, @rank, @deadline, @category, @subcategory)", task);
            }
        }
        
        public IEnumerable<Tasks> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Tasks>("SELECT * FROM tasks");
            }
        }

        public Tasks FindByID(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Tasks>("SELECT * tasks WHERE Id=@Id", new { Id = id }).FirstOrDefault();
            }
        }

        public void Remove(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("DELETE From tasks where Id=@id", new { Id = id });
            }
        }

        public void Update(Tasks task)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query("UPDATE tasks SET task = task = @Task, description = @Description, rank = @Rank, deadline = @Deadline, category = @Category, subcategory = @Subcategory", task);
            }
        }
    }
}
