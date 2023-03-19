using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACN.Models;
namespace DACN.Controllers
{
    public class UserController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        md5 MD5 = new md5();

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, TAIKHOAN us)
        {
            var TenDN = collection["TenDN"];
            var TenNguoiDung = collection["TenNguoiDung"];
            var MatKhau = MD5.encrypt(collection["MatKhau"]);
            var MatKhauXacNhan = collection["MatKhauXacNhan"];
            var SDT = collection["sdt"];
            var Email = collection["Email"];
            var TrangThai = Convert.ToBoolean(collection["TrangThai"]);
            var QuyenDN = Convert.ToBoolean(collection["QuyenDN"]);
            TAIKHOAN checktendn = data.TAIKHOANs.SingleOrDefault(n => n.TenDN == TenDN);
            if (String.IsNullOrEmpty(TenNguoiDung))
            {
                ViewData["Loi1"] = "Phải nhập tên người dùng!";
            }
            else if (String.IsNullOrEmpty(TenDN))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập!";
            }

            else if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(MatKhauXacNhan))
            {
                ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
            }

            else if (String.IsNullOrEmpty(Email))
            {
                ViewData["Loi4"] = "Phải nhập Email!";
            }
            else if (String.IsNullOrEmpty(SDT))
            {
                ViewData["Loi5"] = "Phải nhập số điện thoại!";
            }

            else
            {
                if (checktendn != null)
                {
                    ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
                }
                else
                {
                    if (!MatKhau.Equals(MD5.encrypt(MatKhauXacNhan)))
                    {
                        ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                    }
                    else
                    {
                        us.TenNguoiDung = TenNguoiDung;
                        us.TenDN = TenDN;
                        us.MatKhau = MatKhau;
                        us.SDT = SDT;
                        us.Email = Email;
                        us.TrangThai = true;
                        us.QuyenDN = true;
                        data.TAIKHOANs.InsertOnSubmit(us);
                        data.SubmitChanges();
                        return RedirectToAction("Login");
                    }
                }

            }
            return this.Register();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var TenDN = collection["TenDN"];
            var MatKhau = MD5.encrypt(collection["MatKhau"]);
            if (String.IsNullOrEmpty(TenDN))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
            }
            if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            TAIKHOAN us = data.TAIKHOANs.SingleOrDefault(n => n.TenDN == TenDN);
            if (us == null)
            {
                ViewBag.ThongBao = "Tên đăng nhập không đúng!";
               
            }
            else
            {

                if(us.TrangThai == false)
                {
                    ViewBag.ThongBao = "Tài khoản của bạn đã bị vô hiệu hóa";
                }
                else
                {
                    if (us.MatKhau == MatKhau)
                    {
                        if (us.QuyenDN == true)
                        {
                            ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                            Session["TaiKhoan"] = us;
                            Giohang.tk = us;
                            
                            return RedirectToAction("HomePage", "Pages");
                        }
                        else
                        {
                            ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                            Session["TaiKhoan"] = us;
                            return RedirectToAction("Dashboard", "Admin");
                        }
                    }
                    else
                    {
                        ViewBag.ThongBao = "Mật khẩu không đúng";
                    }
                }
                
            }

            return View();
        }
        [HttpGet]
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("HomePage", "Pages");
        }
        // GET: User
        [HttpGet]
        public ActionResult Edit(int id)
        {
            TAIKHOAN find = data.TAIKHOANs.FirstOrDefault(p => p.IdTK == id);
            return View(find);
        }

        [HttpPost]
        public ActionResult Edit(FormCollection collection, int id)
        {
            var s = data.TAIKHOANs.First(m => m.IdTK == id);

            var TenNguoiDung = collection["TenNguoiDung"];
            var MatKhau = MD5.encrypt(collection["MatKhau"]);    
            var email = collection["Email"];
            var sdt = collection["SDT"];

            if (String.IsNullOrEmpty(TenNguoiDung))
            {
                ViewData["Loi1"] = "Phải nhập tên người dùng!";
            }
            else if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi3"] = "Phải nhập Email!";
            }
            else if (String.IsNullOrEmpty(sdt))
            {
                ViewData["Loi4"] = "Phải nhập số điện thoại!";
            }

            else
            {
                s.TenNguoiDung = TenNguoiDung;
                s.MatKhau = MatKhau;
                s.Email = email;
                s.SDT = sdt;
                data.TAIKHOANs.DeleteOnSubmit(s);
                data.TAIKHOANs.InsertOnSubmit(s);
                data.SubmitChanges();
                return RedirectToAction("HomePage", "Pages");
            }
            return this.Edit(id);
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
    }
}