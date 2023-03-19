using DACN.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DACN.Controllers
{
    public class PagesController : Controller
    {
        // GET: Pages
        MyDataDataContext data = new MyDataDataContext();
        public ActionResult HomePage()
        {
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true
                              select tt;
            return View(all_account);
        }
        public ActionResult ProductDetail(int id)
        {          
            SANPHAM D_phone = data.SANPHAMs.Where(m => m.IdSP == id).First();
            return View(D_phone);
        }
       
        public ActionResult Apple(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 1
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }

        public ActionResult SamSung(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 2
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Xiaomi(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 3
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Oppo(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 4
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Vivo(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 5
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Other(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SANPHAMs
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 6 || tt.MaNSX == 7
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }

        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Contact([Bind(Include = "MaLH,HoTen,EmailLH,YeuCau,NgayLH")] LIENHE lienhe)
        {
            if (ModelState.IsValid)
            {
                lienhe.NgayLH = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                data.LIENHEs.InsertOnSubmit(lienhe);
                data.SubmitChanges();
                return RedirectToAction("Success", "Pages");
            }
            return View(lienhe);
        }
        public ActionResult Success()
        {
            return View();
        }
        public ActionResult Post()
        {
            var all_account = from tt in data.TINTUCs
                              select tt;
            return View(all_account);
        }
        public ActionResult HuongDanThanhToan()
        {
            return View();
        }
    }
}