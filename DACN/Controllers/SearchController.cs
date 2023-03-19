using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACN.Models;
using PagedList;

namespace DACN.Controllers
{
    public class SearchController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public JsonResult GetSearchValue(string search)
        {
            List<TimKiem> allsearch = data.SANPHAMs.Where(p => p.TenSP.Contains(search)).Select(p => new TimKiem
            {
                id = p.IdSP,
                name = p.TenSP

            }).ToList();
            return new JsonResult { Data = allsearch, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        // GET: Search
        [HttpPost]
        public ActionResult getSearch(FormCollection collection, int? page)
        {

            int pageSize = 9;
            int pageNum = (page ?? 1);
            string sTukhoa = collection["txtTimkiem"].ToString();
            var lstSanPham = (from sp in data.SANPHAMs
                              where sp.TenSP.Contains(sTukhoa) && sp.SLTon > 0
                              select sp).ToList();

            if (lstSanPham != null && lstSanPham.Count() <= 0)
            {
                ViewBag.Thongbao = "Không tìm thấy sản phẩm nào!";
            }
            return View(lstSanPham.OrderBy(m => m.TenSP).ToPagedList(pageNum, pageSize));
        }
        // GET: Search
        public ActionResult Index()
        {
            return View();
        }
    }
}