using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACN.Models;
using PagedList;
namespace DACN.Controllers
{
    public class ProductController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public ActionResult Price1(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP < 5000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Price2(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP >= 5000000 && tt.GiaSP <= 10000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Price3(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP >= 10000000 && tt.GiaSP <= 20000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Price4(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP >= 20000000 && tt.GiaSP <= 30000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Price5(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP > 30000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
    }
}