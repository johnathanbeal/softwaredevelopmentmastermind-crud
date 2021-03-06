﻿using GoalsApplicationMark1.Models;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using Dapper;
using System.Linq;
using System.Threading.Tasks;

namespace GoalsApplicationMark1.Repository
{
    public class GoalCandidateRepository : IRepository<GoalCandidates>
    {
        private string connectionString;

        public GoalCandidateRepository(IConfiguration configuration)
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

        public void Add(GoalCandidates goalCandidate)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                //goalCandidate, description, importance, deliverableDate
                dbConnection.Execute("INSERT INTO goalCandidates (goalCandidate, description, importance, deliverableDate) VALUES (@goalCandidate, @description, @importance, @deliverableDate)", goalCandidate);
            }
        }

        public IEnumerable<GoalCandidates> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<GoalCandidates>("SELECT * FROM goalcandidates");
            }
        }

        public GoalCandidates FindByID(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<GoalCandidates>("DELETE FROM goalcandidates WHERE Id=@Id", new { Id = id}).FirstOrDefault();
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

        public void Update(GoalCandidates goalCandidate)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query("UPDATE goalcandidates SET goalCandidate = @GoalCandidate, description = @Description, importance = @Importance, deliverableDate = @DeliverableDate", goalCandidate);
            }
        }
    }
}
