using DACN.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using OfficeOpenXml;

namespace DACN.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        MyDataDataContext db = new MyDataDataContext();
        md5 MD5 = new md5();
        // Dashboard

        public ActionResult Dashboard()
        {
            var listacc = db.SANPHAMs.Where(p => p.TrangThai == true).ToList();
            ViewBag.tongaccount = listacc.Count;

            var listacc1 = db.SANPHAMs.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            ViewBag.apple = listacc1.Count;

            var listacc2 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 2).ToList();
            ViewBag.samsung = listacc2.Count;

            var listacc3 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 3).ToList();
            ViewBag.xiaomi = listacc3.Count;

            var listacc4 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 4).ToList();
            ViewBag.oppo = listacc4.Count;

            var listacc5 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 5).ToList();
            ViewBag.vivo = listacc5.Count;

            var listacc6 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 6).ToList();
            ViewBag.nokia = listacc6.Count;

            var listacc7 = db.SANPHAMs.Where(p => p.TrangThai == true && p.MaNSX == 7).ToList();
            ViewBag.gaming = listacc7.Count;

            var listuser = db.TAIKHOANs.Where(p => p.TrangThai == true).ToList();
            ViewBag.tonguser = listuser.Count;

            var listtt = db.TINTUCs.ToList();
            ViewBag.tongtt = listtt.Count;

            var tongtien = db.DONHANGs.Sum(m => m.TongTien).Value;


            ViewBag.tongtien = tongtien;

            return View();
        }
        // End Dashboard

        // Product
        public ActionResult ListProduct()
        {
            var listSP = from tt in db.SANPHAMs where tt.TrangThai == true select tt;
            return View(listSP);
        }

        [HttpGet]
        public ActionResult CreateProduct()
        {

            return View(new SANPHAM());
        }

        [HttpPost]
        public ActionResult CreateProduct(FormCollection collection, SANPHAM s)
        {


            var E_tensp = collection["TenSP"];
            var E_gia = collection["GiaSP"];
            var E_manhinh = collection["ManHinh"];
            var E_vixuly = collection["ViXuLy"];
            var E_RAM = collection["RAM"];
            var E_hinh = collection["HinhSP"];
            var E_slton = collection["SLTon"];
            var E_mota = collection["MoTaSP"];
            var E_bonho = collection["BoNho"];
            var E_mansx = collection["MaNSX"];

            SANPHAM checktendn = db.SANPHAMs.SingleOrDefault(n => n.TenSP == E_tensp);


            if (checktendn != null)
            {
                ViewBag.thongbao = "Sản phẩm đã tồn tại";
            }
            else
            {
                s.TenSP = E_tensp.ToString();
                s.GiaSP = Convert.ToDecimal(E_gia);
                s.ManHinh = E_manhinh.ToString();
                s.ViXuLy = E_vixuly.ToString();
                s.RAM = Convert.ToInt32(E_RAM);
                s.HinhSP = E_hinh.ToString();
                s.SLTon = Convert.ToInt32(E_slton);
                s.MoTaSP = E_mota.ToString();
                s.BoNho = E_bonho.ToString();
                s.TrangThai = true;
                s.MaNSX = Convert.ToInt32(E_mansx);
                db.SANPHAMs.InsertOnSubmit(s);
                db.SubmitChanges();
                return RedirectToAction("ListProduct", "Admin");
            }
            //}
            return this.CreateProduct();
        }

        [HttpGet]
        public ActionResult EditProduct(int id)
        {
            SANPHAM find = db.SANPHAMs.FirstOrDefault(p => p.IdSP == id);

            return View(find);
        }
        [HttpPost]
        public ActionResult EditProduct(int id, FormCollection collection)
        {
            var s = db.SANPHAMs.First(m => m.IdSP == id);

            var E_tensp = collection["TenSP"];
            var E_gia = collection["GiaSP"];
            var E_manhinh = collection["ManHinh"];
            var E_vixuly = collection["ViXuLy"];
            var E_hinh = collection["HinhSP"];
            var E_RAM = collection["RAM"];
            var E_slton = collection["SLTon"];
            var E_mota = collection["MoTaSP"];
            var E_bonho = collection["BoNho"];
            var E_mansx = collection["MaNSX"];


            s.TenSP = E_tensp.ToString();
            s.GiaSP = Convert.ToDecimal(E_gia);
            s.ManHinh = E_manhinh.ToString();
            s.ViXuLy = E_vixuly.ToString();
            s.RAM = Convert.ToInt32(E_RAM);
            s.HinhSP = E_hinh.ToString();
            s.SLTon = Convert.ToInt32(E_slton);
            s.MoTaSP = E_mota.ToString();
            s.BoNho = E_bonho.ToString();
            s.TrangThai = true;
            s.MaNSX = Convert.ToInt32(E_mansx);
            UpdateModel(s);

            db.SubmitChanges();
            return RedirectToAction("ListProduct");
            //}
            //return this.EditProduct(id);
        }


        // End Product
        [HttpGet]
        public ActionResult DeleteProduct(int? id)
        {

            var delete = db.SANPHAMs.First(p => p.IdSP == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteProduct(int id, FormCollection collection)
        {
            try
            {
                var delete = db.SANPHAMs.Where(m => m.IdSP == id).First();
                delete.TrangThai = false;
                UpdateModel(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListProduct","Admin");
        }
        // User 
        public ActionResult ListUser()
        {
            var all_user = from tt in db.TAIKHOANs where tt.TrangThai == true select tt;
            return View(all_user);
        }

        public ActionResult DetailUser(int id)
        {
            var D_user = db.TAIKHOANs.Where(m => m.IdTK == id && m.TrangThai == true).First();

            string mk = MD5.decrypt(D_user.MatKhau);
            ViewBag.MK = mk;
            return View(D_user);
        }

        [HttpGet]
        public ActionResult CreateUser()
        {
            return View(new TAIKHOAN());
        }

        [HttpPost]
        public ActionResult CreateUser(FormCollection collection, TAIKHOAN us)
        {
            var TenDN = collection["TenDN"];
            var MatKhau = MD5.encrypt(collection["MatKhau"]);
            var TenND = collection["TenNguoiDung"];
            var SDT = collection["SDT"];
            var Email = collection["Email"];
            var TrangThai = Convert.ToBoolean(collection["TrangThai"]);
            var QuyenDN = Convert.ToBoolean(collection["QuyenDN"]);
            TAIKHOAN checktendn = db.TAIKHOANs.SingleOrDefault(n => n.TenDN == TenDN);
            if (checktendn != null)
            {
                ViewBag.thongbao = "Tên người dùng đã có";
            }
            else
            {
                us.TenDN = TenDN;
                us.MatKhau = MatKhau;
                us.TenNguoiDung = TenND;
                us.SDT = SDT;
                us.Email = Email;
                us.TrangThai = true;
                us.QuyenDN = QuyenDN;
                db.TAIKHOANs.InsertOnSubmit(us);
                db.SubmitChanges();
                return RedirectToAction("ListUser");
            }
            return this.CreateUser();
        }

        [HttpGet]
        public ActionResult EditUser(int id)
        {
            TAIKHOAN find = db.TAIKHOANs.FirstOrDefault(p => p.IdTK == id);

            return View(find);
        }
        [HttpPost]
        public ActionResult EditUser(int id, FormCollection collection)
        {
            var s = db.TAIKHOANs.First(m => m.IdTK == id);

            var tenND = collection["TenNguoiDung"];
            var matKhau = MD5.encrypt(collection["MatKhau"]);
            var email = collection["Email"];
            var sdt = collection["SDT"];

            //string test = MD5.encrypt(matKhau);


            if (String.IsNullOrEmpty(tenND))
            {
                ViewData["Loi1"] = "Phải nhập tên người dùng!";
            }
            else if (String.IsNullOrEmpty(matKhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi3"] = "Phải nhập gmail!";
            }
            else if (String.IsNullOrEmpty(sdt))
            {
                ViewData["Loi4"] = "Phải nhập số điện thoại!";
            }

            else
            {
                s.TenNguoiDung = tenND;
                s.MatKhau = matKhau;
                s.Email = email;
                s.SDT = sdt;
                db.TAIKHOANs.DeleteOnSubmit(s);
                db.TAIKHOANs.InsertOnSubmit(s);
                db.SubmitChanges();

              
                return RedirectToAction("ListUser", "Admin");
            }
            return this.EditUser(id);
        }
        [HttpGet]
        public ActionResult DeleteUser(int? id)
        {

            var delete = db.TAIKHOANs.First(p => p.IdTK == id);
            string mk = MD5.decrypt(delete.MatKhau);
            ViewBag.MK = mk;
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteUser(int id, FormCollection collection)
        {
            try
            {
                var delete = db.TAIKHOANs.Where(m => m.IdTK == id).First();
                delete.TrangThai = false;

                UpdateModel(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListUser", "Admin");
        }
        public ActionResult BanUser()
        {
            var all_user = from tt in db.TAIKHOANs where tt.TrangThai == false select tt;
            ViewBag.taikhoanban = all_user.Count();
            return View(all_user);
        }

        [HttpGet]
        public ActionResult RestoreUser(int? id)
        {

            var restore = db.TAIKHOANs.First(p => p.IdTK == id);
            string mk = MD5.decrypt(restore.MatKhau);
            ViewBag.MK = mk;
            return View(restore);
        }


        [HttpPost]
        public ActionResult RestoreUser(int id, FormCollection collection)
        {
            try
            {
                var restore = db.TAIKHOANs.Where(m => m.IdTK == id).First();
                restore.TrangThai = true;

                UpdateModel(restore);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("BanUser", "Admin");
        }
        // End User

        //Brand
        public ActionResult ListBrand()
        {
            var listNSX = from tt in db.NSXes select tt;
            return View(listNSX);
        }

        [HttpGet]
        public ActionResult EditBrand(int? id)
        {
            if (id == null)
                return HttpNotFound();
            NSX find = db.NSXes.FirstOrDefault(p => p.MaNSX == id);
            if (find == null)
                return HttpNotFound();
            return View(find);
        }

        // end Brand
        public ActionResult ListContact()
        {
            var all_user = from tt in db.LIENHEs select tt;
            return View(all_user);
        }
        [HttpGet]
        public ActionResult DeleteContact(int? id)
        {

            var delete = db.LIENHEs.First(p => p.MaLH == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteContact(int id, FormCollection collection)
        {
            try
            {
                var delete = db.LIENHEs.Where(m => m.MaLH == id).First();
                db.LIENHEs.DeleteOnSubmit(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListContact");
        }
        public ActionResult ListNews()
        {
            var listTT = from tt in db.TINTUCs select tt;
            return View(listTT);
        }
        [HttpGet]
        public ActionResult CreateNews()
        {
            return View(new TINTUC());
        }

        [HttpPost]
        public ActionResult CreateNews(FormCollection collection, TINTUC s)
        {

            var E_tieude = collection["TieuDe"];
            var E_noidung = collection["NoiDung"];
            var E_hinhanh = collection["HinhTT"];
            var E_TruyCap = collection["Truycap"];
            TINTUC checktendn = db.TINTUCs.SingleOrDefault(n => n.TieuDe == E_tieude);

            if (checktendn != null)
            {
                ViewBag.thongbao = "Bài viết đã có";
            }
            else
            {
                s.TieuDe = E_tieude.ToString();
                s.NoiDung = E_noidung.ToString();
                s.HinhTT = E_hinhanh.ToString();
                s.NgayCapNhat = DateTime.Today;
                s.NgayDang = DateTime.Today;
                s.Truycap = E_TruyCap.ToString();

                db.TINTUCs.InsertOnSubmit(s);
                db.SubmitChanges();
                return RedirectToAction("ListNews");
            }
            return this.CreateNews();
        }

        [HttpGet]
        public ActionResult DeleteNews(int? id)
        {

            var delete = db.TINTUCs.First(p => p.MaTT == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteNews(int id, FormCollection collection)
        {
            try
            {
                var delete = db.TINTUCs.Where(m => m.MaTT == id).First();
                db.TINTUCs.DeleteOnSubmit(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListNews");
        }

        public ActionResult ListCart()
        {
            
            var list = db.DONHANGs.Where(x => x.TrangThai == true).ToList();

            return View(list);
        }
        public ActionResult ListCartNone()
        {

            var list = db.DONHANGs.Where(x => x.TrangThai == false).ToList();

            return View(list);
        }

        public bool IsNumber(string pValue)
        {
            foreach (Char c in pValue)
            {
                if (!Char.IsDigit(c))
                    return false;
            }
            return true;
        }

        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }
            file.SaveAs(Server.MapPath("~/Content/product/" + file.FileName));
            return "/Content/product/" + file.FileName;
        }


        

        public void ExportExcel_EPPLUS()
        {

            var donhang = db.DONHANGs.Where(x=>x.TrangThai == true).ToList();

            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "Mã Đơn hàng";
            Sheet.Cells["B1"].Value = "Tên Người mua";
            Sheet.Cells["C1"].Value = "Tên Sản phẩm";
            Sheet.Cells["D1"].Value = "Ngày Đặt";
            Sheet.Cells["E1"].Value = "Ngày Nhận";
            Sheet.Cells["F1"].Value = "Số lượng";
            Sheet.Cells["G1"].Value = "Tổng tiền";

            //Sheet.Cells["E1"].Value = "Địa chỉ";
            int row = 2;// dòng bắt đầu ghi dữ liệu
            foreach (var item in donhang)
            {
                var ctdonhang = db.CTDONHANGs.First(s => s.MaDH == item.MaDH);
                
                Sheet.Cells[string.Format("A{0}", row)].Value = item.MaDH;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.TAIKHOAN.TenNguoiDung;
                Sheet.Cells[string.Format("C{0}", row)].Value = ctdonhang.SANPHAM.TenSP;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.NgayGiaoHang.ToString();
                Sheet.Cells[string.Format("E{0}", row)].Value = item.NgayDatHang.ToString();
                Sheet.Cells[string.Format("F{0}", row)].Value = ctdonhang.SLMua;
                Sheet.Cells[string.Format("G{0}", row)].Value = item.TongTien;
                row++;
            }
            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment; filename=" + "Báo cáo.xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }

        public void ExportExcel_EPPLUS_CartNone()
        {

            var donhang = db.DONHANGs.Where(x => x.TrangThai == false).ToList();

            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "Mã Đơn hàng";
            Sheet.Cells["B1"].Value = "Tên Người mua";
            Sheet.Cells["C1"].Value = "Tên Sản phẩm";
            Sheet.Cells["D1"].Value = "Ngày Đặt";
            Sheet.Cells["E1"].Value = "Ngày Nhận";
            Sheet.Cells["F1"].Value = "Số lượng";
            Sheet.Cells["G1"].Value = "Tổng tiền";
            Sheet.Cells["H1"].Value = "Tình trạng";

            //Sheet.Cells["E1"].Value = "Địa chỉ";
            int row = 2;// dòng bắt đầu ghi dữ liệu
            foreach (var item in donhang)
            {
                var ctdonhang = db.CTDONHANGs.First(s => s.MaDH == item.MaDH);

                Sheet.Cells[string.Format("A{0}", row)].Value = item.MaDH;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.TAIKHOAN.TenNguoiDung;
                Sheet.Cells[string.Format("C{0}", row)].Value = ctdonhang.SANPHAM.TenSP;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.NgayGiaoHang.ToString();
                Sheet.Cells[string.Format("E{0}", row)].Value = item.NgayDatHang.ToString();
                Sheet.Cells[string.Format("F{0}", row)].Value = ctdonhang.SLMua;
                Sheet.Cells[string.Format("G{0}", row)].Value = item.TongTien;
                Sheet.Cells[string.Format("H{0}", row)].Value = item.TrangThai;
                row++;
            }
            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment; filename=" + "Báo cáo none.xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }
        /*public ActionResult Report(FormCollection collection)
        {
            var ngay = collection["Ngay"];


        }*/
    }
}