using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACN.Models;
using DACN.MoMo;
using Newtonsoft.Json.Linq;

namespace DACN.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        MyDataDataContext data = new MyDataDataContext();
        decimal? tong = 0;
        //TAIKHOAN tk = Session["TaiKhoan"] as TAIKHOAN;
        
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<Giohang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int id, string strURL)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.Find(n => n.idsp == id);
            if (sanpham == null)
            {
                sanpham = new Giohang(id);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.sl++;
                sanpham.thanhtien = sanpham.gia * sanpham.sl;
                return Redirect(strURL);
            }
        }
        public int TongSoLuong()
        {
            int tsl = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Sum(n => n.sl);
            }
            return tsl;
        }
        public int TongSoLuongSanPham()
        {
            int tsl = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;
        }
        public double TongTien()
        {
            double tt = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => Convert.ToDouble(n.thanhtien));
            }
            return tt;
        }
        public ActionResult Cart()
        {
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGiohang);
        }
        public ActionResult CartPartial()
        {

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return PartialView();
        }
        public ActionResult XoaGioHang(int id)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.idsp == id);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.idsp == id);
                return RedirectToAction("Cart");
            }
            return RedirectToAction("Cart");
        }
        public ActionResult CapnhatGioHang(int id, FormCollection collection)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.idsp == id);
            if (sanpham != null)
            {
                sanpham.sl = int.Parse(collection["txtSoLg"].ToString());
                sanpham.thanhtien = sanpham.gia * sanpham.sl;
            }
            return RedirectToAction("Cart");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Cart");
        }
        [HttpGet]
        public ActionResult Order()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("Login", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("HomePage", "Pages");
            }
            List<Giohang> lstGioHang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGioHang);
        }
      
        public ActionResult Order(FormCollection collection)
        {
            DONHANG dh = new DONHANG();
            TAIKHOAN tk = (TAIKHOAN)Session["TaiKhoan"];
            SANPHAM s = new SANPHAM();

            List<Giohang> gh = Laygiohang();

            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);
            var diachi = collection["DiaChi"];
            
            
            foreach (var item in gh)
            {
                tong = tong + item.thanhtien;
            }
            dh.IdTK = tk.IdTK;
            dh.NgayDatHang = DateTime.Now;
            dh.NgayGiaoHang = DateTime.Parse(ngaygiao);
            dh.DiaChiGiaoHang = diachi;
            dh.TongTien = tong;
            dh.TrangThai = false;

            data.DONHANGs.InsertOnSubmit(dh);
            data.SubmitChanges();
            int index = 0;
            DONHANG dhlast = new DONHANG();
            foreach (var item in data.DONHANGs)
            {
                index = index + 1;
                if (index == data.DONHANGs.Count())
                {
                    dhlast = item;
                }
            }
            foreach (var item in gh)
            {
                CTDONHANG ctdh = new CTDONHANG();
                ctdh.MaDH = dh.MaDH;
                ctdh.IdSP = item.idsp;
                ctdh.SLMua = item.sl;
                ctdh.Gia = (decimal)item.gia;
                s = data.SANPHAMs.Single(n => n.IdSP == item.idsp);
                s.SLTon -= ctdh.SLMua;
                data.SubmitChanges();
                data.CTDONHANGs.InsertOnSubmit(ctdh);

            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("PaymentMoMo", "Cart");

        }


        public ActionResult PaymentMoMo(FormCollection collection)
        {
            var lstGioHang = Laygiohang();
            foreach (var item in lstGioHang)
            {
                tong = tong + item.thanhtien;
            }
            
            DONHANG d = new DONHANG();
            d.IdTK = lstGioHang[0].iduser;            
            d.NgayDatHang = DateTime.Today;
            d.NgayGiaoHang = Convert.ToDateTime(collection["NgayGiao"]);
            d.TongTien = tong;
            d.DiaChiGiaoHang = collection["DiaChi"];
            d.TrangThai = false;
            data.DONHANGs.InsertOnSubmit(d);
            data.SubmitChanges();
            List<DONHANG> l = data.DONHANGs.ToList();
            foreach (var item in lstGioHang)
            {
                CTDONHANG ct = new CTDONHANG();
                ct.MaDH = data.DONHANGs.ToList().Last().MaDH;
                ct.IdSP = item.idsp;
                ct.SLMua = item.sl;
                ct.Gia = item.gia;
                data.CTDONHANGs.InsertOnSubmit(ct);
                data.SubmitChanges();
            }
            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMOKBOU20220616";
            string accessKey = "4YMVqU96ZIip1V5O";
            string serectkey = "JBV76vvQBZJ4SuVz3dtHtGNA1L6p4iT3";
            string orderInfo = "Thanh toán điện thoại";
            string returnUrl = "https://localhost:44393/Cart/ReturnUrl";
            string notifyurl = "https://057a-2402-800-63a9-f8b3-7dfb-1fd6-b31-69ce.ap.ngrok.io/SavePayment"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

            //string amount = "1000000";
            string amount = tong.ToString();
            string orderid = DateTime.Now.Ticks.ToString();
            string requestId = DateTime.Now.Ticks.ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);
            
            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            Session["Giohang"] = null;
            return Redirect(jmessage.GetValue("payUrl").ToString());
        }

        

        public ActionResult ReturnUrl()
        {
            string param = Request.QueryString.ToString().Substring(0, Request.QueryString.ToString().IndexOf("signature") - 1);
            param = Server.UrlDecode(param);
            MoMoSecurity crypto = new MoMoSecurity();
            string secretkey = "JBV76vvQBZJ4SuVz3dtHtGNA1L6p4iT3";
            string signature = crypto.signSHA256(param, secretkey);
            if (signature != Request["signature"].ToString())
            {
                ViewBag.message = "Thông tin request không hợp lệ";
            }
            if (!Request.QueryString["errorCode"].Equals("0"))
            {
               
                ViewBag.message = "Thanh toán lỗi";

            }
            else
            {
                ViewBag.message = "Thanh toán thành công";
                return RedirectToAction("OrderConfirmation", "Cart");
            }
            return RedirectToAction("HomePage","Pages");
        }


        [HttpPost]
        public JsonResult SavePayment()
        {
            string param = "";
                param =
                    "partner_code=" + Request["partner_code"] +
                    "&access_key=" + Request["access_key"] +
                    "&amount=" + Request["amount"] +
                    "&order_id=" + Request["order_id"] +
                    "&order_info=" + Request["order_info"] +
                    "&order_type=" + Request["order_type"] +
                    "&transaction_id=" + Request["transaction_id"] +
                    "&message=" + Request["message"] +
                    "&response_time=" + Request["response_time"] +
                    "&status_code=" + Request["status_code"];
                param = Server.UrlDecode(param);
                MoMoSecurity crypto = new MoMoSecurity();
                string serectkey = ConfigurationManager.AppSettings["serectkey"].ToString();
                string signature = crypto.signSHA256(param, serectkey);
                if (signature != Request["signature"].ToString())
                {

                }
                string status_code = Request["status_code"].ToString();
                if ((status_code != "0"))
                {

                }
                else
                {

                }
                return Json("", JsonRequestBehavior.AllowGet);
        }


        public ActionResult OrderConfirmation()
        {
            int index = 0;
            DONHANG dhlast = new DONHANG();
            foreach (var item in data.DONHANGs)
            {
                index = index + 1;
                if (index == data.DONHANGs.Count())
                {
                    dhlast = item;
                }
            }
            dhlast.TrangThai = true;
            data.DONHANGs.DeleteOnSubmit(dhlast);
            data.DONHANGs.InsertOnSubmit(dhlast);
            data.SubmitChanges();

            return View();
        }



        [HttpGet]
        public ActionResult Offline()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("Login", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("HomePage", "Pages");
            }
            List<Giohang> lstGioHang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGioHang);
        }
        public ActionResult Offline(FormCollection collection)
        {
            DONHANG dh = new DONHANG();
            TAIKHOAN tk = (TAIKHOAN)Session["TaiKhoan"];
            SANPHAM s = new SANPHAM();

            List<Giohang> gh = Laygiohang();

            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);
            var diachi = collection["DiaChi"];


            foreach (var item in gh)
            {
                tong = tong + item.thanhtien;
            }
            dh.IdTK = tk.IdTK;
            dh.NgayDatHang = DateTime.Now;
            dh.NgayGiaoHang = DateTime.Parse(ngaygiao);
            dh.DiaChiGiaoHang = diachi;
            dh.TongTien = tong;
            dh.TrangThai = true;

            data.DONHANGs.InsertOnSubmit(dh);
            data.SubmitChanges();
            int index = 0;
            DONHANG dhlast = new DONHANG();
            foreach (var item in data.DONHANGs)
            {
                index = index + 1;
                if (index == data.DONHANGs.Count())
                {
                    dhlast = item;
                }
            }
            foreach (var item in gh)
            {
                CTDONHANG ctdh = new CTDONHANG();
                ctdh.MaDH = dh.MaDH;
                ctdh.IdSP = item.idsp;
                ctdh.SLMua = item.sl;
                ctdh.Gia = (decimal)item.gia;
                s = data.SANPHAMs.Single(n => n.IdSP == item.idsp);
                s.SLTon -= ctdh.SLMua;
                data.SubmitChanges();
                data.CTDONHANGs.InsertOnSubmit(ctdh);

            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("OrderConfirmation", "Cart");
        }
        
    }
}