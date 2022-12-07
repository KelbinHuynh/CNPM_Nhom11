-----------------------------------------------------------------------------------------------------------------
-- AUTH: GIDEON
-- DATE: 27TH OCT 2022
---------------------------------
-- DESCRIPTION: 
-----------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------


USE PROJECT
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

EXEC INS_LECTURER N'Đoàn Văn D', 1, N'1', N'Giảng Viên', N'd-dv', N'123456789'
EXEC INS_LECTURER N'Trần Thị E', 0, N'0', N'Giảng Viên', N'e-tt', N'123456789'
EXEC INS_LECTURER N'Trường Công F', 1, N'2', N'Giảng Viên', N'f-tc', N'123456789'
GO

EXEC INS_STUDENT N'Nguyễn Văn G', 1,'10/01/2000',N'0', N'g-nv', N'123456789'
EXEC INS_STUDENT N'Phạm Thị H', 0,'18/04/2001',N'1', N'h-pt', N'123456789'
EXEC INS_STUDENT N'Trịnh Thị I', 0,'06/07/2001',N'2', N'i-tt', N'123456789'
GO

EXEC INS_PROJECT N'Máy phát nhạc MP3 trên nền kit nhúng', N'Hệ thống nhúng, lập trình', '12-01-2022', 1
EXEC INS_PROJECT N'Hệ thống giám sát cửa gara dùng kit nhúng Raspberry Pi', N'Hệ thống nhúng, lập trình', '12-01-2022', 1
EXEC INS_PROJECT N'Hệ thống giám sát nhà dùng Raspberry Pi B+', N'Hệ thống nhúng, lập trình', '12-01-2022', 1
GO

EXEC INS_PRJ_MAJ '0','2'
EXEC INS_PRJ_MAJ '1','2'
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


SELECT 
FORMAT(DATEOFBIRTH, 'dd/MMM/yyyy')
FROM STUDENT
GO
