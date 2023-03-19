using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DACN.Commons
{
    [Serializable]
    public class UserLogin
    {
        public int IdTK { set; get; }
        public string TenDN { set; get; }
        public string MatKhau { set; get; }
        public string TenNguoiDung { set; get; }
        public string Email { set; get; }
        public bool? QuyenDN { set; get; }

    }
}