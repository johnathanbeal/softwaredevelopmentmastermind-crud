﻿using GoalsApplicationMark1.Models;
using System;
using System.Collections.Generic;
using Npgsql;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Data;
using Dapper;


namespace GoalsApplicationMark1.Repository
{
    public class GoalRepository : IRepository<Goal>
    {
        private string connectionString;

        public GoalRepository(IConfiguration configuration)
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
        public void Add(Goal goal)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("INSERT INTO goals (goalName, description, ranking, deliverabledate, isspecific, ismeasureable, isachieveable, isrelevant, istimebound) VALUES (@goalName, @description, @ranking, @deliverabledate, @isspecific, @ismeasureable, @isachieveable, @isrelevant, @istimebound)", goal);
            }
        }

        public IEnumerable<Goal> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Goal>("SELECT * FROM goals");
            }
        }

        public Goal FindByID(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Goal>("DELETE FROM goals WHERE Id=@Id", new { Id = id }).FirstOrDefault();
            }
        }

        public void Remove(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("DELETE FROM goals where Id=@Id", new { Id = id });
            }
        }

        public void Update(Goal goal)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query("UPDATE goals SET goal = @GoalName, description = @Description, ranking = @Ranking, deliverabledate = @Deliverabledate, isspecific = @Isspecific, ismeasureable = @Ismeasureable, isachieveable = @Isachieveable, isrelevant = @Isrelevant, istimebound = @Istimebound", goal);
            }
        }
    }
}
 