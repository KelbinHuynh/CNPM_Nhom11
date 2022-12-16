-----------------------------------------------------------------------------------------------------------------
-- AUTH: GIDEON
-- DATE: 27TH OCT 2022
---------------------------------
-- DESCRIPTION: 
-----------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------


USE FINALPROJECT
GO

SET DATEFORMAT 'DMY'
GO

EXEC INS_ADMIN N'Nguyễn Văn A', N'admin', N'admin' 
EXEC INS_ADMIN N'Trần Văn B', N'b-tv', N'admin' 
EXEC INS_ADMIN N'Nguyễn Thị C', N'c-nt', N'admin' 
GO

EXEC INS_MAJOR N'Công nghệ phần mềm'
EXEC INS_MAJOR N'Hệ thống thông tin'
EXEC INS_MAJOR N'Mạng máy tính'
GO

EXEC INS_LECTURER N'Đoàn Văn D', 1, N'1', N'Giảng Viên', N'd-dv', N'123456'
EXEC INS_LECTURER N'Trần Thị E', 0, N'0', N'Giảng Viên', N'e-tt', N'123456'
EXEC INS_LECTURER N'Trường Công F', 1, N'2', N'Giảng Viên', N'f-tc', N'123456'
EXEC INS_LECTURER N'Nguyễn Công C', 1, N'2', N'Trưởng Khoa', N'c-nc', N'123456'
EXEC INS_LECTURER N'Trương Thị N', 0, N'0', N'Giảng Viên', N'n-tt', N'123456'
EXEC INS_LECTURER N'Nguyễn Thị H', 1, N'2', N'Giảng Viên', N'h-nt', N'123456'
EXEC INS_LECTURER N'Trần Văn T', 1, N'2', N'Giảng Viên', N't-tv', N'123456'
EXEC INS_LECTURER N'Nguyễn Hoàng V', 1, N'2', N'Giảng Viên', N'v-nh', N'123456'
GO

EXEC INS_STUDENT '20110147', N'Nguyễn Văn G', 1,'10/01/2000','0358913075', N'0', N'g-nv', N'123456'
EXEC INS_STUDENT '20110148', N'Phạm Thị H', 0,'18/04/2001','0358913075',N'1', N'h-pt', N'123456'
EXEC INS_STUDENT '20110149', N'Trịnh Thị I', 0,'06/07/2001','0358913075',N'2', N'i-tt', N'123456'
EXEC INS_STUDENT '20110150', N'Huỳnh Anh V', 1,'06/09/2002','0358913075',N'2', N'v-ha', N'123456'
EXEC INS_STUDENT '20110151', N'Huỳnh Tấn V', 1,'08/09/2002','0358913075',N'0', N'v-ht', N'123456'
EXEC INS_STUDENT '20110152', N'Huỳnh Tấn N', 0,'09/09/2002','0358913075',N'0', N'n-ht', N'123456'
EXEC INS_STUDENT '20110153', N'Nguyễn Tấn V', 1,'08/10/2002','0358913075',N'1', N'v-nt', N'123456'
GO

EXEC INS_PROJECT N'Máy phát nhạc MP3 trên nền kit nhúng', N'Hệ thống nhúng, lập trình', '12-01-2022', 1				
EXEC INS_PROJECT N'Hệ thống giám sát cửa gara dùng kit nhúng Raspberry Pi', N'Hệ thống nhúng, lập trình', '12-01-2022', 1
EXEC INS_PROJECT N'Hệ thống giám sát nhà dùng Raspberry Pi B+', N'Hệ thống nhúng, lập trình', '12-01-2022', 1
EXEC INS_PROJECT N'Xây dựng APP Quản lý và Điều khiển thiết bị IOT', N'Công nghệ phần mềm, lập trình', '12-01-2022', 1
EXEC INS_PROJECT N'Kiểm soát các truy cập Web trong mạng nội bộ', NULL, '12-01-2022', 1
EXEC INS_PROJECT N'Tìm hiểu .NET Core và phát triển ứng dụng web bán hàng', N'CNPM', '12-01-2022', 0
EXEC INS_PROJECT N'Xây dựng hệ thống IDS/IPS với mã nguồn mở Snort/snortsam', NULL, '12-01-2022', 0
EXEC INS_PROJECT N'Tìm hiểu Spring MVC và xây dựng Website Luyện thi Toeic', N'Lập trình', '12-01-2022', 0
EXEC INS_PROJECT N'Tìm hiểu về công nghệ CUDA', NULL, '12-01-2022', 0
EXEC INS_PROJECT N'Xây dựng ứng dụng IoT với Windows IoT Core', N'IoT', '12-01-2022', 0
GO

EXEC INS_PRJ_MAJ '0','0'
EXEC INS_PRJ_MAJ '1','0'
EXEC INS_PRJ_MAJ '2','2'
GO

EXEC INS_LEC_PRJ '0','0'
EXEC INS_LEC_PRJ '1', '0'
EXEC INS_LEC_PRJ '2', '1'
GO

EXEC INS_TEAM '0'
EXEC INS_TEAM '2'
GO

EXEC INS_STD_TEAM '0', '0'
EXEC INS_STD_TEAM '1', '0'
EXEC INS_STD_TEAM '2', '1'
GO

EXEC INS_TEAM_PRJ '0', '0'
EXEC INS_TEAM_PRJ '1', '1'
GO

EXEC INS_STD_MAJ '0', '0'
EXEC INS_STD_MAJ '1', '1'
EXEC INS_STD_MAJ '2', '2'
EXEC INS_STD_MAJ '3', '2'
GO

EXEC INS_LEC_MAJ '0','0'
EXEC INS_LEC_MAJ '1','2'
EXEC INS_LEC_MAJ '2','1'
GO

EXEC INS_TKB N'A205', '06/08/2022', '11:00:00'
EXEC INS_TKB N'A206', '09/08/2022', '11:00:00'
GO

EXEC INS_TKB_LEC '0', '0'
EXEC INS_TKB_LEC '0', '1'
EXEC INS_TKB_LEC '0', '2'
GO

EXEC INS_TEAM_TKB '0', '0'
EXEC INS_TEAM_TKB '0', '1'
GO

SELECT 
FORMAT(DATEOFBIRTH, 'dd/MMM/yyyy')
FROM STUDENT
GO