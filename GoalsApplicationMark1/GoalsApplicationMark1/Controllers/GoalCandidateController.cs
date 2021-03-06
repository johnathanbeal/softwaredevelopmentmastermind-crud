﻿using GoalsApplicationMark1.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GoalsApplicationMark1.Models;
using GoalsApplicationMark1.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace GoalsApplicationMark1.Controllers
{
    public class GoalCandidateController : Controller
    {
        private readonly GoalCandidatesRepository goalCandidatesRepository;

        public GoalCandidateController(IConfiguration configuration)
        {
            goalCandidatesRepository = new GoalCandidatesRepository(configuration);
        }

        public IActionResult Index()
        {
            return View(goalCandidatesRepository.FindAll());
        }

        public IActionResult Create()
        {
            return View();
        }

        // POST : GoalCandidate/Create
        [HttpPost]
        public IActionResult Create(GoalCandidates goalCandidate)
        {
            if (ModelState.IsValid)
            {
                goalCandidatesRepository.Add(goalCandidate);
                return RedirectToAction("Index");
            }
            return View(goalCandidate);
        }

        // GET: /Goal/Edit/1
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            GoalCandidates obj = goalCandidatesRepository.FindByID(id.Value);
            if (obj == null)
            {
                return NotFound();
            }
            return View(obj);
        }

        // POST: /Goal/Edit
        [HttpPost]
        public IActionResult Edit(GoalCandidates obj)
        {
            if(ModelState.IsValid)
            {
                goalCandidatesRepository.Update(obj);
                return RedirectToAction("Index");
            }
            return View(obj);
        }

        // GET:/Goal/Delete/1
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            goalCandidatesRepository.Remove(id.Value);
            return RedirectToAction("Index");
        }
    }
}
