INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [phone], [psw], [gender], [email],  [maLoaiTK]) VALUES (N'HV0001', N'Nguyen', N'Huy Long', CAST(N'2003-04-19' AS Date), N'HV001', N'0378829921', N'abcd1234', N'Male', N'OalSkad1904@gmail.com',  N'LTK0001')
INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [phone], [psw], [gender], [email],  [maLoaiTK]) VALUES (N'HV0002', N'Tran', N'Thu', CAST(N'2003-05-12' AS Date), N'HV002', N'02918432718', N'abcd1234', N'Female', N'JDwQ@gmail.com',  N'LTK0001')
INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [phone], [psw], [gender], [email],  [maLoaiTK]) VALUES (N'HV0003', N'Nhat', N'Tan', CAST(N'2003-02-04' AS Date), N'Bob', N'1312312', N'1234', N'male', N'Bob@gmail.com',  N'HOCVIEN')
INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [phone], [psw], [gender], [email],  [maLoaiTK]) VALUES (N'HV0004', N'Nguyen', N'Huy Long', CAST(N'2003-06-29' AS Date), N'Oalskad', N'0375578399', N'Pugre11111', N'Male', N'garihoj456@cutefier.com',  N'HOCVIEN')
INSERT [dbo].[hocVien] ([maHV], [Ho], [Ten], [dob], [username], [phone], [psw], [gender], [email],  [maLoaiTK]) VALUES (N'HV0005', N'Nguyen', N'Huy Long', CAST(N'2003-10-30' AS Date), N'Oalskad1', N'0375578399', N'Pugre11111', N'Male', N'huylong2113@gmail.com',  N'HOCVIEN')
GO
INSERT [dbo].[Trainer] ([maTrainer], [Ho],[Ten], [dob], [phone], [email], [salary], [username], [psw], [soNgayNghi], [status], [trainerType], [maLoaiTK]) VALUES (N'TR0001', N'Nguyen',' Van Thanh', CAST(N'1993-02-19' AS Date), N'033375572', N'Thanh@gmai.com', CAST(10000000.00 AS Decimal(18, 2)), N'trainer1', N'abcd1234', 0, 0, N'BASIC', N'TRAINER')
INSERT [dbo].[Trainer] ([maTrainer], [Ho],[Ten], [dob], [phone], [email], [salary], [username], [psw], [soNgayNghi], [status], [trainerType], [maLoaiTK]) VALUES (N'TR0002', N'Tran','Van Quy', CAST(N'1990-03-19' AS Date), N'090623007', N'QuyBuu@gmail.com', CAST(10000000.00 AS Decimal(18, 2)), N'trainer2', N'abcd1234', 0, 0, N'BASIC', N'TRAINER')
GO
INSERT [dbo].[admin] ([maAdmin], [username], [psw]) VALUES (N'AD001', N'admin', N'1234')
GO
INSERT [dbo].[room] ([maRoom], [status]) VALUES (N'RO0003', 1)
INSERT [dbo].[room] ([maRoom], [status]) VALUES (N'RO0002', 1)
GO
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL001', CAST(N'05:00:00' AS Time), CAST(N'06:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL002', CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL003', CAST(N'09:00:00' AS Time), CAST(N'10:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL004', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL005', CAST(N'15:00:00' AS Time), CAST(N'16:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL006', CAST(N'17:00:00' AS Time), CAST(N'18:30:00' AS Time))
INSERT [dbo].[slot] ([maSlot], [timeStart], [timeEnd]) VALUES (N'SL007', CAST(N'19:00:00' AS Time), CAST(N'20:30:00' AS Time))
GO
INSERT [dbo].[loaiLopHoc] ([maLoaiLopHoc], [tenLoaiLopHoc], [hocPhi]) VALUES (N'TYPE0001', N'Yoga Basic', CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[loaiLopHoc] ([maLoaiLopHoc], [tenLoaiLopHoc], [hocPhi]) VALUES (N'TYPE0002', N'Hatha Yoga', CAST(12000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[lopHoc] ([maLopHoc], [soLuongHV], [soLuongHvHienTai], [soBuoi],  [maLoaiLopHoc],  [maRoom], [ngay]) VALUES (N'LOP0001', 20, 1, 10,  N'TYPE0001',  N'RO0001', N'2')
INSERT [dbo].[lopHoc] ([maLopHoc], [soLuongHV], [soLuongHvHienTai], [soBuoi],  [maLoaiLopHoc],  [maRoom], [ngay]) VALUES (N'LOP0002', 20, 1, 10,  N'TYPE0001', N'RO0001', N'4')
GO
INSERT [dbo].[hoaDon] ([mahoaDon], [maHV], [maLopHoc], [giaTien], [ngayThanhToan]) VALUES (N'RE0001', N'HV0001', N'LOP0001', 10000000.0000, CAST(N'2023-05-31' AS Date))
GO
INSERT [dbo].[hopDongGiaoVien] ([maHopDong], [maTrainer], [mucLuong]) VALUES (N'HD0001', N'TR0001', CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[hopDongGiaoVien] ([maHopDong], [maTrainer], [mucLuong]) VALUES (N'HD0002', N'TR0002', CAST(10000000.00 AS Decimal(10, 2)))
GO

--CLASSES
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG001', 'Surya Kriya', 'https://sundariyogacenter.com/admin/sanpham/Surya-Kriya-Inside_4018_anh1.jpg')
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG002', 'Angamardana', 'https://sundariyogacenter.com/admin/sanpham/Angamardana-Ben-Trong_4021_anh1.jpg')
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG003', 'Yogasanas', 'https://sundariyogacenter.com/admin/sanpham/Yogasanas-Ben-Trong_4016_anh1.jpg')
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG004', 'Bhuta Shuddhi', 'https://sundariyogacenter.com/admin/sanpham/Bhuta-Shuddhi-Ben-Trong_4020_anh1.jpg')
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG005', 'Surya Shakti', 'https://sundariyogacenter.com/admin/sanpham/Surya-Shakti-Ben-Trong_4026_anh1.jpg')
INSERT INTO dbo.lopHocImg (maAnh, tenAnh, URLAnh)
VALUES('YG006', 'Khóa Thiền Định', 'https://sundariyogacenter.com/admin/sanpham/Thien-Dinh-Ben-Trong_4013_anh1.jpg')