﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AnyHire.Models;

namespace AnyHire.Controllers
{
    public class TransactionController : Controller
    {
        private AnyHireDbContext db = new AnyHireDbContext();

        // GET: /Transaction/
        public ActionResult Index()
        {
            var transactions = db.Transactions.Include(t => t.Account).Include(t => t.Appointment);
            return View(transactions.ToList());
        }

        // GET: /Transaction/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // GET: /Transaction/Create
        public ActionResult Create()
        {
            ViewBag.ServiceProviderId = new SelectList(db.Accounts, "Id", "Username");
            ViewBag.AppointmentId = new SelectList(db.Appointments, "Id", "Location");
            return View();
        }

        // POST: /Transaction/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,AppointmentId,ServiceProviderId,TotalAmount,ServiceProviderRevenue,CompanyRevenue")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.Transactions.Add(transaction);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ServiceProviderId = new SelectList(db.Accounts, "Id", "Username", transaction.ServiceProviderId);
            ViewBag.AppointmentId = new SelectList(db.Appointments, "Id", "Location", transaction.AppointmentId);
            return View(transaction);
        }

        // GET: /Transaction/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            ViewBag.ServiceProviderId = new SelectList(db.Accounts, "Id", "Username", transaction.ServiceProviderId);
            ViewBag.AppointmentId = new SelectList(db.Appointments, "Id", "Location", transaction.AppointmentId);
            return View(transaction);
        }

        // POST: /Transaction/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,AppointmentId,ServiceProviderId,TotalAmount,ServiceProviderRevenue,CompanyRevenue")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.Entry(transaction).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServiceProviderId = new SelectList(db.Accounts, "Id", "Username", transaction.ServiceProviderId);
            ViewBag.AppointmentId = new SelectList(db.Appointments, "Id", "Location", transaction.AppointmentId);
            return View(transaction);
        }

        // GET: /Transaction/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // POST: /Transaction/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Transaction transaction = db.Transactions.Find(id);
            db.Transactions.Remove(transaction);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
