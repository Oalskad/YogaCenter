USE [YogaCenter]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[maAdmin] [nvarchar](10) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[psw] [nvarchar](75) NOT NULL,
	[maLoaiTK] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caHoc]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caHoc](
	[maCaHoc] [nvarchar](10) NOT NULL,
	[maNgay] [nvarchar](10) NOT NULL,
	[maTiet] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maCaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhGia]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhGia](
	[maDanhGia] [nvarchar](10) NOT NULL,
	[maHV] [nvarchar](10) NOT NULL,
	[maGV] [nvarchar](10) NOT NULL,
	[noiDung] [nvarchar](255) NOT NULL,
	[grade] [decimal](3, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diemDanh]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diemDanh](
	[maDiemDanh] [nvarchar](10) NOT NULL,
	[maHV] [nvarchar](10) NOT NULL,
	[maLopHoc] [nvarchar](10) NOT NULL,
	[maCaHoc] [nvarchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDiemDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Don]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Don](
	[maDon] [nvarchar](10) NOT NULL,
	[maHV] [nvarchar](10) NULL,
	[maGV] [nvarchar](10) NULL,
	[maLopHoc] [nvarchar](10) NULL,
	[maAdmin] [nvarchar](10) NULL,
	[noiDung] [nvarchar](255) NOT NULL,
	[ngayGui] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giangVien]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giangVien](
	[maGV] [nvarchar](10) NOT NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](25) NOT NULL,
	[salary] [decimal](10, 2) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[psw] [nvarchar](75) NOT NULL,
	[soNgayNghi] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[maLoaiTK] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__giangVie__7A3E2D752DBE7D83] PRIMARY KEY CLUSTERED 
(
	[maGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoaDon]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoaDon](
	[mahoaDon] [nvarchar](10) NOT NULL,
	[maHV] [nvarchar](10) NOT NULL,
	[maLopHoc] [nvarchar](10) NOT NULL,
	[giaTien] [money] NOT NULL,
	[ngayThanhToan] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mahoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocVien]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocVien](
	[maHV] [nvarchar](10) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](25) NOT NULL,
	[dob] [date] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[psw] [nvarchar](75) NOT NULL,
	[maLopHoc] [nvarchar](10) NULL,
	[maLoaiTK] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__hocVien__7A3E14942E7F50D3] PRIMARY KEY CLUSTERED 
(
	[maHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaiLopHoc]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaiLopHoc](
	[maLoaiLopHoc] [nvarchar](10) NOT NULL,
	[tenLoaiLopHoc] [nvarchar](25) NOT NULL,
	[hocPhi] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoaiLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaiTaiKhoan]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaiTaiKhoan](
	[maLoaiTK] [nvarchar](10) NOT NULL,
	[tenLoaiTK] [nvarchar](20) NOT NULL,
	[vaitro] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lopHoc]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lopHoc](
	[maLopHoc] [nvarchar](10) NOT NULL,
	[soLuongHV] [int] NOT NULL,
	[soLuongHVHienTai] [int] NULL,
	[soBuoi] [int] NOT NULL,
	[maGV] [nvarchar](10) NOT NULL,
	[maLoaiLopHoc] [nvarchar](10) NOT NULL,
	[maTKB] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__lopHoc__D99E2544C1E36953] PRIMARY KEY CLUSTERED 
(
	[maLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ngay]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ngay](
	[maNgay] [nvarchar](10) NOT NULL,
	[date] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNgay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thoiKhoaBieu]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thoiKhoaBieu](
	[maTKB] [nvarchar](10) NOT NULL,
	[maCaHoc] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maTKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiet]    Script Date: 5/14/2023 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiet](
	[maTiet] [nvarchar](10) NOT NULL,
	[timeStart] [time](7) NOT NULL,
	[timeEnd] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[caHoc] ([maCaHoc], [maNgay], [maTiet]) VALUES (N'CA001', N'001', N'T001')
INSERT [dbo].[caHoc] ([maCaHoc], [maNgay], [maTiet]) VALUES (N'CA002', N'001', N'T002')
GO
INSERT [dbo].[giangVien] ([maGV], [Ho], [Ten], [dob], [phone], [email], [salary], [username], [psw], [soNgayNghi], [status], [maLoaiTK]) VALUES (N'GV001', N'Tran', N'Minh', CAST(N'1994-04-19' AS Date), N'09087768', N'Minh@gmail.com', CAST(10000000.00 AS Decimal(10, 2)), N'gv001', N'123456', 0, 0, N'LTK002')
GO
INSERT [dbo].[hoaDon] ([mahoaDon], [maHV], [maLopHoc], [giaTien], [ngayThanhToan]) VALUES (N'HD001', N'HV001', N'LH001', 1500000.0000, CAST(N'2023-05-14' AS Date))
GO
INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [psw], [maLopHoc], [maLoaiTK]) VALUES (N'HV001', N'NGUYEN', N'LONG', CAST(N'2003-04-19' AS Date), N'sa', N'123456', NULL, N'LTK003')
GO
INSERT [dbo].[loaiLopHoc] ([maLoaiLopHoc], [tenLoaiLopHoc], [hocPhi]) VALUES (N'LLH001', N'YOGABEGINNER', CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[loaiLopHoc] ([maLoaiLopHoc], [tenLoaiLopHoc], [hocPhi]) VALUES (N'LLH002', N'GYM', CAST(1500000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[loaiTaiKhoan] ([maLoaiTK], [tenLoaiTK], [vaitro]) VALUES (N'LTK001', N'ADMIN', N'0')
INSERT [dbo].[loaiTaiKhoan] ([maLoaiTK], [tenLoaiTK], [vaitro]) VALUES (N'LTK002', N'GIANGVIEN', N'1')
INSERT [dbo].[loaiTaiKhoan] ([maLoaiTK], [tenLoaiTK], [vaitro]) VALUES (N'LTK003', N'HOCVIEN', N'2')
GO
INSERT [dbo].[lopHoc] ([maLopHoc], [soLuongHV], [soLuongHVHienTai], [soBuoi], [maGV], [maLoaiLopHoc], [maTKB]) VALUES (N'LH001', 35, 0, 20, N'GV001', N'LLH001', N'TKB001')
GO
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'001', N'MONDAY')
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'002', N'TUESDAY')
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'003', N'WEDNESDAY')
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'004', N'THURSDAY')
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'005', N'FRIDAY')
INSERT [dbo].[ngay] ([maNgay], [date]) VALUES (N'007', N'SUNDAY')
GO
INSERT [dbo].[thoiKhoaBieu] ([maTKB], [maCaHoc]) VALUES (N'TKB001', N'CA001')
INSERT [dbo].[thoiKhoaBieu] ([maTKB], [maCaHoc]) VALUES (N'TKB002', N'CA002')
GO
INSERT [dbo].[tiet] ([maTiet], [timeStart], [timeEnd]) VALUES (N'T001', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[tiet] ([maTiet], [timeStart], [timeEnd]) VALUES (N'T002', CAST(N'09:15:00' AS Time), CAST(N'10:45:00' AS Time))
GO
ALTER TABLE [dbo].[diemDanh] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Don] ADD  DEFAULT (getdate()) FOR [ngayGui]
GO
ALTER TABLE [dbo].[hoaDon] ADD  DEFAULT (getdate()) FOR [ngayThanhToan]
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD  CONSTRAINT [fk_loaiTK_admin] FOREIGN KEY([maLoaiTK])
REFERENCES [dbo].[loaiTaiKhoan] ([maLoaiTK])
GO
ALTER TABLE [dbo].[admin] CHECK CONSTRAINT [fk_loaiTK_admin]
GO
ALTER TABLE [dbo].[caHoc]  WITH CHECK ADD  CONSTRAINT [fk_ngay_CH] FOREIGN KEY([maNgay])
REFERENCES [dbo].[ngay] ([maNgay])
GO
ALTER TABLE [dbo].[caHoc] CHECK CONSTRAINT [fk_ngay_CH]
GO
ALTER TABLE [dbo].[caHoc]  WITH CHECK ADD  CONSTRAINT [fk_tiet_CH] FOREIGN KEY([maTiet])
REFERENCES [dbo].[tiet] ([maTiet])
GO
ALTER TABLE [dbo].[caHoc] CHECK CONSTRAINT [fk_tiet_CH]
GO
ALTER TABLE [dbo].[danhGia]  WITH CHECK ADD  CONSTRAINT [fk_maGV_danhGia] FOREIGN KEY([maGV])
REFERENCES [dbo].[giangVien] ([maGV])
GO
ALTER TABLE [dbo].[danhGia] CHECK CONSTRAINT [fk_maGV_danhGia]
GO
ALTER TABLE [dbo].[danhGia]  WITH CHECK ADD  CONSTRAINT [fk_maHV_danhGia] FOREIGN KEY([maHV])
REFERENCES [dbo].[hocVien] ([maHV])
GO
ALTER TABLE [dbo].[danhGia] CHECK CONSTRAINT [fk_maHV_danhGia]
GO
ALTER TABLE [dbo].[diemDanh]  WITH CHECK ADD  CONSTRAINT [fk_maCaHoc_diemDanh] FOREIGN KEY([maCaHoc])
REFERENCES [dbo].[caHoc] ([maCaHoc])
GO
ALTER TABLE [dbo].[diemDanh] CHECK CONSTRAINT [fk_maCaHoc_diemDanh]
GO
ALTER TABLE [dbo].[diemDanh]  WITH CHECK ADD  CONSTRAINT [fk_maHV_diemDanh] FOREIGN KEY([maHV])
REFERENCES [dbo].[hocVien] ([maHV])
GO
ALTER TABLE [dbo].[diemDanh] CHECK CONSTRAINT [fk_maHV_diemDanh]
GO
ALTER TABLE [dbo].[diemDanh]  WITH CHECK ADD  CONSTRAINT [fk_maLop_diemDanh] FOREIGN KEY([maLopHoc])
REFERENCES [dbo].[lopHoc] ([maLopHoc])
GO
ALTER TABLE [dbo].[diemDanh] CHECK CONSTRAINT [fk_maLop_diemDanh]
GO
ALTER TABLE [dbo].[Don]  WITH CHECK ADD  CONSTRAINT [fk_admin_Don] FOREIGN KEY([maAdmin])
REFERENCES [dbo].[admin] ([maAdmin])
GO
ALTER TABLE [dbo].[Don] CHECK CONSTRAINT [fk_admin_Don]
GO
ALTER TABLE [dbo].[Don]  WITH CHECK ADD  CONSTRAINT [fk_maGV_Don] FOREIGN KEY([maGV])
REFERENCES [dbo].[giangVien] ([maGV])
GO
ALTER TABLE [dbo].[Don] CHECK CONSTRAINT [fk_maGV_Don]
GO
ALTER TABLE [dbo].[Don]  WITH CHECK ADD  CONSTRAINT [fk_maHV_Don] FOREIGN KEY([maHV])
REFERENCES [dbo].[hocVien] ([maHV])
GO
ALTER TABLE [dbo].[Don] CHECK CONSTRAINT [fk_maHV_Don]
GO
ALTER TABLE [dbo].[Don]  WITH CHECK ADD  CONSTRAINT [fk_maLop_Don] FOREIGN KEY([maLopHoc])
REFERENCES [dbo].[lopHoc] ([maLopHoc])
GO
ALTER TABLE [dbo].[Don] CHECK CONSTRAINT [fk_maLop_Don]
GO
ALTER TABLE [dbo].[giangVien]  WITH CHECK ADD  CONSTRAINT [fk_loaiTK_GV] FOREIGN KEY([maLoaiTK])
REFERENCES [dbo].[loaiTaiKhoan] ([maLoaiTK])
GO
ALTER TABLE [dbo].[giangVien] CHECK CONSTRAINT [fk_loaiTK_GV]
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD  CONSTRAINT [fk_maHV_hoaDon] FOREIGN KEY([maHV])
REFERENCES [dbo].[hocVien] ([maHV])
GO
ALTER TABLE [dbo].[hoaDon] CHECK CONSTRAINT [fk_maHV_hoaDon]
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD  CONSTRAINT [fk_maLop_hoaDon] FOREIGN KEY([maLopHoc])
REFERENCES [dbo].[lopHoc] ([maLopHoc])
GO
ALTER TABLE [dbo].[hoaDon] CHECK CONSTRAINT [fk_maLop_hoaDon]
GO
ALTER TABLE [dbo].[hocVien]  WITH CHECK ADD  CONSTRAINT [fk_loaiTK_HocVien] FOREIGN KEY([maLoaiTK])
REFERENCES [dbo].[loaiTaiKhoan] ([maLoaiTK])
GO
ALTER TABLE [dbo].[hocVien] CHECK CONSTRAINT [fk_loaiTK_HocVien]
GO
ALTER TABLE [dbo].[hocVien]  WITH CHECK ADD  CONSTRAINT [fk_maLop_HocVien] FOREIGN KEY([maLopHoc])
REFERENCES [dbo].[lopHoc] ([maLopHoc])
GO
ALTER TABLE [dbo].[hocVien] CHECK CONSTRAINT [fk_maLop_HocVien]
GO
ALTER TABLE [dbo].[lopHoc]  WITH CHECK ADD  CONSTRAINT [fk_loaiLopHoc_lopHoc] FOREIGN KEY([maLoaiLopHoc])
REFERENCES [dbo].[loaiLopHoc] ([maLoaiLopHoc])
GO
ALTER TABLE [dbo].[lopHoc] CHECK CONSTRAINT [fk_loaiLopHoc_lopHoc]
GO
ALTER TABLE [dbo].[lopHoc]  WITH CHECK ADD  CONSTRAINT [fk_maGV_lopHoc] FOREIGN KEY([maGV])
REFERENCES [dbo].[giangVien] ([maGV])
GO
ALTER TABLE [dbo].[lopHoc] CHECK CONSTRAINT [fk_maGV_lopHoc]
GO
ALTER TABLE [dbo].[lopHoc]  WITH CHECK ADD  CONSTRAINT [fk_maTKB_lopHoc] FOREIGN KEY([maTKB])
REFERENCES [dbo].[thoiKhoaBieu] ([maTKB])
GO
ALTER TABLE [dbo].[lopHoc] CHECK CONSTRAINT [fk_maTKB_lopHoc]
GO
ALTER TABLE [dbo].[thoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [fk_CH_TKB] FOREIGN KEY([maCaHoc])
REFERENCES [dbo].[caHoc] ([maCaHoc])
GO
ALTER TABLE [dbo].[thoiKhoaBieu] CHECK CONSTRAINT [fk_CH_TKB]
GO
