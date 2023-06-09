USE [DBDACN]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[MaBanner] [int] NOT NULL,
	[HinhBanner] [varchar](250) NULL,
	[IdTK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](250) NULL,
	[NgayDang] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[IdTK] [int] NOT NULL,
	[IdSP] [int] NOT NULL,
 CONSTRAINT [PK__BINHLUAN__272475AFA0D53353] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDONHANG]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDONHANG](
	[MaDH] [int] NOT NULL,
	[IdSP] [int] NOT NULL,
	[SLMua] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK__CTDONHAN__4C528749BB145913] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[IdSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[MaDG] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](250) NULL,
	[SoSao] [float] NULL,
	[NgayDG] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[MaDH] [int] NOT NULL,
 CONSTRAINT [PK__DANHGIA__272586600AD93CF5] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [date] NULL,
	[NgayGiaoHang] [date] NULL,
	[DiaChiGiaoHang] [nvarchar](50) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[TrangThai] [bit] NULL,
	[IdTK] [int] NOT NULL,
 CONSTRAINT [PK__DONHANG__27258661E0310F67] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIENHE]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIENHE](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](250) NULL,
	[EmailLH] [varchar](50) NULL,
	[YeuCau] [nvarchar](200) NULL,
	[NgayLH] [datetime] NULL,
 CONSTRAINT [PK__LIENHE__2725C77F7C03E424] PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NSX]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX](
	[MaNSX] [int] NOT NULL,
	[TenNSX] [nvarchar](20) NULL,
	[Logo] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[IdSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[GiaSP] [decimal](18, 0) NULL,
	[ManHinh] [nvarchar](50) NULL,
	[ViXuLy] [nvarchar](50) NULL,
	[RAM] [int] NULL,
	[HinhSP] [varchar](250) NULL,
	[SLTon] [int] NULL,
	[MoTaSP] [nvarchar](max) NULL,
	[BoNho] [nvarchar](10) NULL,
	[TrangThai] [bit] NULL,
	[MaNSX] [int] NOT NULL,
 CONSTRAINT [PK__SANPHAM__B77012877F558BA1] PRIMARY KEY CLUSTERED 
(
	[IdSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[IdTK] [int] IDENTITY(1,1) NOT NULL,
	[TenDN] [varchar](50) NULL,
	[MatKhau] [varchar](130) NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SDT] [varchar](10) NULL,
	[TrangThai] [bit] NULL,
	[QuyenDN] [bit] NULL,
 CONSTRAINT [PK__TAIKHOAN__B7701ABDB85561B7] PRIMARY KEY CLUSTERED 
(
	[IdTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 10/12/2022 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MaTT] [int] NOT NULL,
	[TieuDe] [nvarchar](250) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[HinhTT] [varchar](250) NULL,
	[NgayDang] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[Truycap] [nvarchar](max) NULL,
 CONSTRAINT [PK__TINTUC__272500792FB786A7] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (22, 26, 1, CAST(1500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (23, 26, 1, CAST(1500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (23, 33, 1, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (24, 29, 1, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (25, 7, 1, CAST(24000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (26, 1, 2, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (27, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (28, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (29, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (30, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (31, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (32, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (33, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (34, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (35, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (36, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (37, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (38, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (39, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (40, 1, 2, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (41, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (42, 1, 1, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (43, 26, 1, CAST(1500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (44, 30, 1, CAST(15000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([MaDH], [IdSP], [SLMua], [Gia]) VALUES (45, 6, 1, CAST(24000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (22, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-16' AS Date), N'Huế', CAST(1500000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (23, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), N'Hà Nội', CAST(5500000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (24, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'TP.HCM', CAST(12000000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (25, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), N'Lào', CAST(24000000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (26, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-27' AS Date), N'ViệtNam', CAST(20000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (27, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-21' AS Date), N'Thái Lan', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (28, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), N'Mỹ', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (29, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-12' AS Date), N'Trung Quốc', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (30, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), N'Tiền Giang', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (31, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-22' AS Date), N'An Giang', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (32, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Mỹ Tho', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (33, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Hồ Chí Minh', CAST(10000 AS Decimal(18, 0)), 0, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (34, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Đà Nẵng', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (35, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Quảng Nam', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (36, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Quảng Bình', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (37, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Thanh Hóa', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (38, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Quảng Trị', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (39, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-10' AS Date), N'Đồng Nai', CAST(10000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (40, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'Sapa', CAST(20000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (41, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-14' AS Date), N'Lào Cai', CAST(10000 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (42, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-12' AS Date), N'Sapa', CAST(10000 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (43, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-20' AS Date), N'HCM', CAST(1500000 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (44, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-15' AS Date), N'Ninh Bình', CAST(15000000 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[DONHANG] ([MaDH], [NgayDatHang], [NgayGiaoHang], [DiaChiGiaoHang], [TongTien], [TrangThai], [IdTK]) VALUES (45, CAST(N'2022-12-10' AS Date), CAST(N'2022-12-13' AS Date), N'Quy Nhơn', CAST(24000000 AS Decimal(18, 0)), 0, 2)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LIENHE] ON 

INSERT [dbo].[LIENHE] ([MaLH], [HoTen], [EmailLH], [YeuCau], [NgayLH]) VALUES (2, N'Trần Lê', N'abc@gmail.com', N'Điện thoại Iphone 13 còn hàng không', CAST(N'2022-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[LIENHE] ([MaLH], [HoTen], [EmailLH], [YeuCau], [NgayLH]) VALUES (3, N'Lê Nhân', N'nhan@gmail.com', N'Mẫu mới về chưa shop', CAST(N'2022-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[LIENHE] ([MaLH], [HoTen], [EmailLH], [YeuCau], [NgayLH]) VALUES (4, N'Nguyễn Thanh', N'nguyen@gmail.com', N'Sản phẩm có khuyến mãi không ', CAST(N'2022-09-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[LIENHE] OFF
GO
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (1, N'Apple', N'/Content/product/brand_logo/logoApple.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (2, N'Samsung', N'/Content/product/brand_logo/logoSamsung.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (3, N'Xiaomi', N'/Content/product/brand_logo/logoXiaomi.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (4, N'Oppo', N'/Content/product/brand_logo/logoOppo.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (5, N'Vivo', N'/Content/product/brand_logo/logoVivo.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (6, N'Nokia', N'/Content/product/brand_logo/logoNokia.png')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [Logo]) VALUES (7, N'Gaming', N'/Content/product/brand_logo/logoROG.png')
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (1, N'Iphone 14 Pro Max', CAST(2000000 AS Decimal(18, 0)), N'Amoled', N'Apple A16', 8, N'/Content/product/Ip14PM_1.png', 100, N'Ðây là mô tả sản phẩm', N'512 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (2, N'Iphone 14', CAST(37490000 AS Decimal(18, 0)), N'Amoled', N'Apple A15', 8, N'/Content/product/Ip14_1.png', 0, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (3, N'Iphone 13 Pro Max', CAST(22000000 AS Decimal(18, 0)), N'Amoled', N'Apple A15', 8, N'/Content/product/Ip14_1.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (4, N'Iphone 14 Pro', CAST(32000000 AS Decimal(18, 0)), N'Amoled', N'Apple A15', 8, N'/Content/product/Ip14_1.png', 99, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (5, N'Samsung S22', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/galaxys22ultra.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (6, N'Samsung S22 Ultra', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/galaxys22ultra.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (7, N'Xiaomi 12T Pro', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (8, N'Xiaomi 11 Lite', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (9, N'Vivo 1', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (10, N'Vivo 2', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (11, N'Oppo phone 1', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (12, N'Oppo phone 2', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (13, N'ROG phone 6', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 7)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (14, N'Nokia Phone', CAST(24000000 AS Decimal(18, 0)), N'Amoled', N'SnapDragon 880', 8, N'/Content/product/xiaomi12TPro.png', 100, N'Ðây là mô tả sản phẩm', N'128 GB', 1, 6)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (21, N'Iphone 13 pro', CAST(18000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XD', N'Apple A15 ', 8, N'/Content/product/Ip13-1.jpg                           ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2021 chắc chắn không thể thiếu cái tên iPhone 13 Pro. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 13 Pro hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'128 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (22, N'Iphone 12 mini', CAST(16000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XDR', N'Apple A14 Bionic', 8, N'/Content/product/Ip12 mini-1.jpg                      ', 100, N'Điện thoại iPhone 12 mini 64 GB tuy là phiên bản thấp nhất trong bộ 4 iPhone 12 series, nhưng vẫn sở hữu những ưu điểm vượt trội về kích thước nhỏ gọn, tiện lợi, hiệu năng đỉnh cao, tính năng sạc nhanh cùng bộ camera chất lượng cao.', N'64 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (23, N'Iphone 11 pro MAX', CAST(14000000 AS Decimal(18, 0)), N'OLED6.5"Super Retina XDR', N'Apple A13 Bionic', 8, N'/Content/product/Ip11 pro MAX-1.jpg                   ', 100, N'Trong năm 2019 thì chiếc smartphone được nhiều người mong muốn sở hữu trên tay và sử dụng nhất không ai khác chính là iPhone 11 Pro Max 64GB tới từ nhà Apple.', N'64 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (24, N'Iphone X', CAST(2500000 AS Decimal(18, 0)), N'OLED5.8"Super Retina', N'Apple A11 Bionic', 8, N'/Content/product/IpX-1.jpg                            ', 100, N'iPhone X 64 GB là cụm từ được rất nhiều người mong chờ muốn biết và tìm kiếm trên Google bởi đây là chiếc điện thoại mà Apple kỉ niệm 10 năm iPhone đầu tiên được bán ra.', N'64 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (25, N'Samsung Galaxy M51', CAST(6300000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'Snapdragon 730', 8, N'/Content/product/SS Galaxy M51-1.jpg                  ', 100, N'AGalaxy M51 thuộc thế hệ Galaxy M đến từ Samsung và được nằm trong phân khúc giá tầm trung. Máy được nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (26, N'Samsung Galaxy AO3s', CAST(1500000 AS Decimal(18, 0)), N'PLS LCD6.5"HD+'', N''MediaTek MT6765', N'MediaTek MT6765', 8, N'/Content/product/SS Galaxy AO3s-1.jpg                 ', 90, N'Nhằm đem đến cho người dùng thêm sự lựa chọn trong phân khúc, Samsung đã cho ra mắt thêm một chiếc điện thoại giá rẻ với tên gọi Galaxy A03s. So với người tiền nhiệm Galaxy A02s, thiết bị sẽ có một số nâng cấp mới, đây hứa hẹn sẽ là sản phẩm đáng để bạn trải nghiệm.', N'64 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (27, N'Samsung Galaxy Z 3', CAST(22000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2XChính 7.6 & Phụ 6.2"Full HD+', N'Snapdragon 888', 8, N'/Content/product/SS Galaxy Z Fold3 5G-1.jpg           ', 100, N'Galaxy Z Fold3 5G, chiếc điện thoại được nâng cấp toàn diện về nhiều mặt, đặc biệt đây là điện thoại màn hình gập đầu tiên trên thế giới có camera ẩn (08/2021). Sản phẩm sẽ là một “cú hit” của Samsung góp phần mang đến những trải nghiệm mới cho người dùng.', N'256 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (28, N'Samsung Galaxy M53', CAST(3000000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'MediaTek Dimensity 900 5G', 8, N'/Content/product/SS Galaxy M53-1.jpg                  ', 100, N'Có lẽ 2022 là một năm bùng nổ của nhà Samsung, khi hãng liên tục trình làng nhiều sản phẩm có cấu hình mạnh mẽ cùng một mức giá bán hợp lý trên thị trường smartphone tầm trung và giá rẻ, tiêu biểu trong số đó có Samsung Galaxy M53 được xem là cái tên được cộng đồng người dùng tích cực quan tâm và săn đón kể cả khi chưa ra mắt.', N'256 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (29, N'Xiaomi 11T Pro 5G', CAST(12000000 AS Decimal(18, 0)), N'AMOLED6.67"Full HD+', N'Snapdragon 888', 8, N'/Content/product/X11T pro-1.jpeg                      ', 100, N'Xiaomi 11T Pro 5G 8GB sử dụng con chip Snapdragon 888 mạnh mẽ, camera chính 108 MP, hỗ trợ sạc nhanh 120 W, màn hình rộng với tốc độ làm tươi lên đến 120 Hz, tận hưởng trải nghiệm tuyệt vời trong từng khoảnh khắc.', N'256 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (30, N'Xiaomi 12', CAST(15000000 AS Decimal(18, 0)), N'AMOLED6.28"Full HD+', N'Snapdragon 8 Gen 1 8 nhân', 8, N'/Content/product/X12-1.jpg                            ', 99, N'Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc điện thoại flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.', N'256 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (31, N'Xiaomi Redmi 10 ', CAST(1200000 AS Decimal(18, 0)), N'AMOLED6.67"Full HD+', N'Snapdragon 732G', 8, N'/Content/product/X10 pro-1.jpg                        ', 100, N'Kế thừa và nâng cấp từ thế hệ trước, Xiaomi đã cho ra mắt điện thoại Xiaomi Redmi Note 10 Pro (8GB/128GB) sở hữu một thiết kế cao cấp, sang trọng bên cạnh cấu hình vô cùng mạnh mẽ, hứa hẹn mang đến sự cạnh tranh lớn trong phân khúc smartphone tầm trung.', N'128 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (32, N'Xiaomi Redmi 9A', CAST(1700000 AS Decimal(18, 0)), N'IPS LCD6.53"HD+', N'MediaTek Helio G25', 8, N'/Content/product/X9A-1.jpg                            ', 100, N'Điện thoại Redmi 9A là chiếc smartphone đến từ Xiaomi hướng tới nhóm khách hàng đang tìm kiếm cho mình một sản phẩm với cấu hình tốt giá thành phải chăng, cũng như được trang bị đầy đủ các tính năng ấn tượng.', N'32 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (33, N'OPPO A16', CAST(4000000 AS Decimal(18, 0)), N'IPS LCD6.52"HD+', N' MediaTek Helio G35', 8, N'/Content/product/OP A16-1.jpg                         ', 100, N'OPPO A16 - sản phẩm giá rẻ đến từ nhà OPPO, đây là một chiếc điện thoại cân bằng ở mọi khía cạnh trong tầm giá, máy có thiết kế đẹp mắt, sử dụng CPU gaming đến từ MediaTek cùng viên pin siêu trâu.', N'32 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (34, N'OPPO A95', CAST(5500000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N'Snapdragon 662', 8, N'/Content/product/OP A95-1.jpg                         ', 100, N'Bên cạnh phiên bản 5G, OPPO còn bổ sung phiên bản OPPO A95 4G với giá thành phải chăng tập trung vào thiết kế năng động, sạc nhanh và hiệu năng đa nhiệm ấn tượng sẽ giúp cho cuộc sống của bạn thêm phần hấp dẫn, ngập tràn niềm vui.', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (35, N'OPPO Reno5 5G', CAST(8500000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N' Snapdragon 765G', 8, N'/Content/product/OP Reno5-1.jpg                       ', 100, N'OPPO đã trình làng OPPO Reno5 5G phiên bản kết nối 5G internet siêu nhanh ra thị trường. Chiếc điện thoại với hàng loạt các tính năng nổi bật cùng vẻ ngoài thời thượng giúp tôn lên vẻ sang trọng cho người sở hữu.', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (36, N'OPPO Find X5 Pro', CAST(15000000 AS Decimal(18, 0)), N'AMOLED6.7"Quad HD+ (2K+)', N'Snapdragon 8 Gen 1 8 nhân', 8, N'/Content/product/OP Find X5-1.jpg                     ', 100, N'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022, khi máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ', N'256 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (37, N'Iphone 14 mini', CAST(21000000 AS Decimal(18, 0)), N'Super Retina XDR OLED', N'Apple A14 Bionic (5 nm)', 8, N'/Content/product/Ip14 mini-1.jpg                      ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2022 chắc chắn không thể thiếu cái tên iPhone 14. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 14  hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'256 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (38, N'Iphone 4', CAST(1000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD3.5"DVGA', N'IMG PowerVR SGX535', 8, N'/Content/product/Ip4-4.jpg                            ', 100, N'Kể từ khi ra đời, iPhone dù thế hệ nào luôn được coi là tiêu chuẩn khi nói smartphone và là tiêu chuẩn để các hãng điện thoại khác cải thiện các sản phẩm của mình. Nếu như iPhone ra đời đã tạo nên định nghĩa của việc trải nghiệm smartphone thì iPhone 4 ra đời đã tạo nên định nghĩa mới cho đẳng cấp trong thiết kế của smartphone.', N'8 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (39, N'Iphone 6', CAST(5000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A8 2 nhân', 8, N'/Content/product/Ip6-1.jpg                            ', 100, N'iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot".', N'32 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (40, N'Iphone 7', CAST(7000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A10 Fusion', 8, N'/Content/product/Ip7-1.jpg                            ', 100, N'iPhone 7 là chiếc smartphone có thiết kế kim loại nguyên khối cuối cùng của Apple, nhưng đồng thời lại sở hữu “hàng tá” tính năng mới xuất hiện lần đầu như: nút home cảm ứng lực, khả năng kháng bụi nước, âm thanh stereo 2 kênh. Và đặc biệt, hiệu năng từ con chip A10 Fusion vẫn tỏ ra rất ổn định ở thời điểm hiện tại.', N'128 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (41, N'Iphone 8', CAST(8000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A11 Bionic', 8, N'/Content/product/Ip8-1.jpg                            ', 100, N'iPhone 8 64GB nổi bật với điểm nhấn mặt lưng kính và mặt trước giữ nguyên thiết kế như iPhone 7, cùng với đó là hàng loạt công nghệ đáng mong đợi như sạc nhanh, không dây hay hỗ trợ thực tế ảo AR.', N'64 GB', 1, 1)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (42, N'Samsung Galaxy A33 ', CAST(7000000 AS Decimal(18, 0)), N'Super AMOLED6.4"Full HD+', N'Exynos 1280 8 nhân', 8, N'/Content/product/SS Galaxy A33-1.jpg                  ', 100, N'Samsung Galaxy A33 5G 6GB ra mắt vào ngày 17/03, được xem là bản cập nhật khá lớn so với thế hệ tiền nhiệm Galaxy A32 về thiết kế đến thông số kỹ thuật bên trong, nhằm mang đến vẻ ngoài đẹp mắt cũng như cạnh tranh trực tiếp ở phần hiệu năng đối với các đối thủ cùng phân khúc giá.', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (43, N'Samsung Galaxy 20', CAST(15000000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'Exynos 990', 8, N'/Content/product/SS Galaxy 20-1.jpg                   ', 100, N'Tháng 8/2020, smartphone Galaxy Note 20 chính thức được lên kệ, với thiết kế camera trước nốt ruồi quen thuộc, cụm camera hình chữ nhật mới lạ cùng với vi xử lý Exynos 990 cao cấp của chính điện thoại Samsung chắc hẳn sẽ mang lại một trải nghiệm thú vị cùng hiệu năng mạnh mẽ.', N'256 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (44, N'Samsung Galaxy Z 3', CAST(21000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2XChính 6.7" & Phụ 1.9"Full HD+', N'Snapdragon 888', 8, N'/Content/product/SS Galaxy Z Flip3-2.jpg              ', 100, N'Trong sự kiện Galaxy Unpacked hồi 11/8, Samsung đã chính thức trình làng mẫu điện thoại màn hình gập thế hệ mới mang tên Galaxy Z Flip3 5G 128GB. Đây là một siêu phẩm với màn hình gập dạng vỏ sò cùng nhiều điểm cải tiến và thông số ấn tượng, sản phẩm chắc chắn sẽ thu hút được rất nhiều sự quan tâm của người dùng, đặc biệt là phái nữ.', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (45, N'Samsung Galaxy S22 ', CAST(17000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2X6.1"Full HD+', N'Snapdragon 8 Gen 1 8 nhân', 8, N'/Content/product/SS Galaxy S22-1.jpg                  ', 100, N'Samsung Galaxy S22 ra mắt với diện mạo vô cùng tinh tế và trẻ trung, mang trong mình thiết kế phẳng theo xu hướng thịnh hành, màn hình 120 Hz mượt mà, cụm camera AI 50 MP và bộ xử lý đến từ Qualcomm.', N'128 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (46, N'Samsung Galaxy S9', CAST(5500000 AS Decimal(18, 0)), N'Super AMOLED5.8"Quad HD+ (2K+)', N'Exynos 9810', 8, N'/Content/product/SS Galaxy S9-1.jpg                   ', 100, N'Siêu phẩm Samsung Galaxy S9 chính thức ra mắt mang theo hàng loạt cải tiến, tính năng cao cấp như camera thay đổi khẩu độ, quay phim siêu chậm 960 fps, AR Emoji... nhanh chóng gây sốt làng công nghệ.', N'64 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (47, N'Samsung Galaxy J7 ', CAST(7000000 AS Decimal(18, 0)), N'PLS TFT LCD5.5"Full HD', N'Exynos 7870', 8, N'/Content/product/SS Galaxy J7-1.jpg                   ', 100, N'Galaxy J7 Prime xứng đáng là cái tên hàng đầu trong danh sách chọn smartphone phổ thông của giới trẻ khi nhận được nhiều đánh giá tích cực về thiết kế, thời lượng pin lâu dài và camera chụp hình chất lượng tốt.', N'32 GB', 1, 2)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (48, N'OPPO Reno7', CAST(10000000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N'Snapdragon 695 5G 8 nhân', 8, N'/Content/product/OP Reno7 Z-1.jpg                     ', 100, N'OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (49, N'OPPO A76', CAST(6000000 AS Decimal(18, 0)), N'IPS LCD6.56"HD+', N'Snapdragon 680 8 nhân', 8, N'/Content/product/OP A76-1.jpg                         ', 100, N'OPPO A76 4G ra mắt với thiết kế trẻ trung, hiệu năng ổn định, màn hình 90 Hz mượt mà cùng viên pin trâu cho thời gian sử dụng lâu dài phù hợp cho mọi đối tượng người dùng.', N'128 GB', 1, 4)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (50, N'Xiaomi Redmi 9C', CAST(3000000 AS Decimal(18, 0)), N'IPS LCD6.53"HD+', N'MediaTek Helio G35', 8, N'/Content/product/X Redmi 9C-1.jpg                     ', 100, N'Điện thoại Xiaomi Redmi 9C (3GB/64GB), smartphone nổi bật trong phân khúc điện thoại giá rẻ với thiết kế tinh tế sang trọng, hiệu năng mạnh mẽ Helio G35 mới, viên pin dung lượng khủng, cùng bộ 3 AI camera bắt trọn mọi khoảnh khắc.', N'64 GB', 1, 3)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (51, N'Vivo Y55', CAST(5000000 AS Decimal(18, 0)), N'AMOLED6.44"Full HD+', N'Snapdragon 680 8 nhân', 8, N'/Content/product/V Y55-1.jpg                          ', 100, N'Vivo Y55 là một cái tên sáng giá dành cho những ai đang muốn chọn mua một chiếc điện thoại phục vụ việc chơi game nhờ cấu hình ổn định trên mức giá phải chăng, kèm với đó là khả năng chụp ảnh sắc nét hỗ trợ bạn trong các công việc nhiếp ảnh cực kỳ dễ dàng.', N'128 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (52, N'Vivo V21 5G', CAST(6000000 AS Decimal(18, 0)), N'AMOLED6.44"Full HD+', N'MediaTek Dimensity 800U 5G', 8, N'/Content/product/V V21-1.jpg                          ', 100, N'Chụp selfie bùng nổ trong đêm, thiết kế mới hiện đại đón đầu xu hướng, cùng với đó là tốc độ kết nối mạng 5G hàng đầu, tất cả những tính năng ấn tượng này đều có trong Vivo V21 5G mẫu điện thoại cận cao cấp đến từ Vivo.', N'128 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (53, N'Vivo X80', CAST(15000000 AS Decimal(18, 0)), N'AMOLED 6.78" Full HD+', N'MediaTek Dimensity 9000 8 nhân', 8, N'/Content/product/V X80-1.jpg                          ', 100, N'Là một chiếc flagship hàng đầu trong ngành của Vivo dành cho năm 2022, Vivo X80 mang những thông số ấn tượng như màn hình AMOLED 120 Hz chất lượng, chạy vi xử lý Dimensity 9000 cao cấp đến từ MediaTek và khả năng chụp ảnh sắc nét nhờ cảm biến máy ảnh Sony.', N'256 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (54, N'Vivo Y01', CAST(2000000 AS Decimal(18, 0)), N'IPS LCD6.51"HD+', N'MediaTek Helio P35', 8, N'/Content/product/V Y01-1.jpg                          ', 100, N'Vivo Y01 được trình làng với một bộ thông số kỹ thuật ấn tượng trong tầm giá, sở hữu những ưu điểm như: Màn hình kích thước lớn, hiệu năng ổn định và thời gian sử dụng lâu dài, được xem là thiết bị phù hợp với những bạn học sinh - sinh viên cho các công việc học tập hay giải trí nhẹ nhàng sau những phút giây căng thẳng.', N'32 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (55, N'Vivo Y53s', CAST(3000000 AS Decimal(18, 0)), N'IPS LCD6.58"Full HD+', N'MediaTek Helio G80', 8, N'/Content/product/V Y53-1.jpg                          ', 100, N'Vivo mang đến niềm vui cho mọi người tin dùng khi hãng chính thức tung ra chiếc điện thoại Vivo Y53s với những tính năng tiên tiến đi cùng hiệu năng mạnh mẽ. Đặc biệt, smartphone lại còn sở hữu mức giá hấp dẫn trong phân khúc tầm trung đầy hứa hẹn.', N'128 GB', 1, 5)
INSERT [dbo].[SANPHAM] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [RAM], [HinhSP], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (56, N'Iphone 14 Pro', CAST(20000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XD', N'Apple A16', 8, N'/Content/product/Ip14 mini-1.jpg                      ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2023 chắc chắn không thể thiếu cái tên iPhone 14 Pro. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 14 Pro hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'128 GB', 1, 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (1, N'admin', N'jVy5OARaKZs=', N'Admin', N'testuser@gmail.com', N'0123456789', 1, 0)
INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (2, N'phuoc', N'jVy5OARaKZs=', N'Phước', N'aaa@gmail.com', N'0123456789', 1, 1)
INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (3, N'demo', N'jVy5OARaKZs=', N'Demo', N'aaa@gmail.com', N'0123456789', 1, 1)
INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (4, N'sai', N'jVy5OARaKZs=', N'Test', N'aaa@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (5, N'admin1', N'jVy5OARaKZs=', N'admin1', N'abcd@gmail.com', N'0123456789', 1, 0)
INSERT [dbo].[TAIKHOAN] ([IdTK], [TenDN], [MatKhau], [TenNguoiDung], [Email], [SDT], [TrangThai], [QuyenDN]) VALUES (6, N'thanh', N'jVy5OARaKZs=', N'Thanh', N'a@gmail.com', N'0123456789', 0, 1)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
GO
INSERT [dbo].[TINTUC] ([MaTT], [TieuDe], [NoiDung], [HinhTT], [NgayDang], [NgayCapNhat], [Truycap]) VALUES (1, N'Galaxy S23 chưa ra mắt, Galaxy S24 đã được tiết lộ có công nghệ khủng này', N'Thời gian qua, chúng ta đã được nhìn thấy khá nhiều thông tin rò rỉ về dòng Galaxy S23 của Samsung. Các điện thoại này dự kiến sẽ ra mắt vào đầu năm sau với khá nhiều cải tiến so với thế hệ trước.', N'/Content/product/tt1.jpeg  ', CAST(N'2022-11-19T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), N'https://cellphones.com.vn/sforum/galaxy-s23-chua-ra-mat-galaxy-s24-da-duoc-tiet-lo-co-cong-nghe-khung-nay')
INSERT [dbo].[TINTUC] ([MaTT], [TieuDe], [NoiDung], [HinhTT], [NgayDang], [NgayCapNhat], [Truycap]) VALUES (2, N'Tất tần tật thông tin chúng ta đã biết về Xiaomi 13 series: Thiết kế, cấu hình, giá bán và ngày ra mắt', N'Xiaomi đang chuẩn bị ra mắt các mẫu smartphone cao cấp mới của mình, thuộc dòng Xiaomi 13. Như tên gọi cho thấy, đây là loạt điện thoại kế nhiệm của Xiaomi 12 series, vốn được cả người dùng lẫn giới công nghệ đánh giá cao.', N'/Content/product/tt2.jpg    ', CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2022-11-20T00:00:00.000' AS DateTime), N'https://cellphones.com.vn/sforum/tat-tan-tat-thong-tin-chung-ta-da-biet-ve-xiaomi-13-series-thiet-ke-cau-hinh-gia-ban-va-ngay-ra-mat')
INSERT [dbo].[TINTUC] ([MaTT], [TieuDe], [NoiDung], [HinhTT], [NgayDang], [NgayCapNhat], [Truycap]) VALUES (3, N'“iPhone 14” là từ khóa được tìm kiếm nhiều thứ 8 toàn cầu trên Google vào năm 2022', N'Theo thông tin được chia sẻ từ trang Macrumors, “iPhone 14” là từ khóa được tìm kiếm nhiều thứ 8 trên toàn thế giới từ Google vào năm 2022.', N'/Content/product/tt3.jpeg    ', CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), N'https://cellphones.com.vn/sforum/iphone-14-la-tu-khoa-duoc-tim-kiem-nhieu-thu-8-toan-cau-tren-google-vao-nam-2022')
INSERT [dbo].[TINTUC] ([MaTT], [TieuDe], [NoiDung], [HinhTT], [NgayDang], [NgayCapNhat], [Truycap]) VALUES (4, N'Đây là bảng thông số kỹ thuật chi tiết của OPPO Find N2 Flip', N'Find N2 Flip dự kiến sẽ là mẫu điện thoại màn hình gập dọc đầu tiên của OPPO. Smartphone này được cho là sẽ xuất hiện cùng với Find N2 vào ngày 15/12 tới.', N'/Content/product/tt4.jpeg    ', CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), N'https://cellphones.com.vn/sforum/day-la-bang-thong-so-ky-thuat-chi-tiet-cua-oppo-find-n2-flip')
INSERT [dbo].[TINTUC] ([MaTT], [TieuDe], [NoiDung], [HinhTT], [NgayDang], [NgayCapNhat], [Truycap]) VALUES (5, N'Vivo Y35 5G ra mắt với chip Dimensity 700, pin 5000 mAh', N'Vivo hôm nay vừa âm thầm ra mắt một chiếc điện thoại giá rẻ mới của hãng, có tên gọi là Vivo Y35 5G.', N'/Content/product/tt5.jpeg    ', CAST(N'2022-11-23T00:00:00.000' AS DateTime), CAST(N'2022-11-23T00:00:00.000' AS DateTime), N'https://cellphones.com.vn/sforum/vivo-y35-5g-ra-mat-voi-chip-dimensity-700-pin-5000-mah')
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK__Banner__IdTK__37A5467C] FOREIGN KEY([IdTK])
REFERENCES [dbo].[TAIKHOAN] ([IdTK])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK__Banner__IdTK__37A5467C]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK__BINHLUAN__IdSP__38996AB5] FOREIGN KEY([IdSP])
REFERENCES [dbo].[SANPHAM] ([IdSP])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK__BINHLUAN__IdSP__38996AB5]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK__BINHLUAN__IdTK__398D8EEE] FOREIGN KEY([IdTK])
REFERENCES [dbo].[TAIKHOAN] ([IdTK])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK__BINHLUAN__IdTK__398D8EEE]
GO
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK__CTDONHANG__IdSP__3A81B327] FOREIGN KEY([IdSP])
REFERENCES [dbo].[SANPHAM] ([IdSP])
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK__CTDONHANG__IdSP__3A81B327]
GO
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK__CTDONHANG__MaDH__3B75D760] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DONHANG] ([MaDH])
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK__CTDONHANG__MaDH__3B75D760]
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK__DANHGIA__MaDH__3C69FB99] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DONHANG] ([MaDH])
GO
ALTER TABLE [dbo].[DANHGIA] CHECK CONSTRAINT [FK__DANHGIA__MaDH__3C69FB99]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_TAIKHOAN] FOREIGN KEY([IdTK])
REFERENCES [dbo].[TAIKHOAN] ([IdTK])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK__SANPHAM__MaNSX__3E52440B] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NSX] ([MaNSX])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK__SANPHAM__MaNSX__3E52440B]
GO
