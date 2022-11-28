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

EXEC INS_ADMIN N'Nguyen Van A', N'admin', N'admin' 
EXEC INS_ADMIN N'Tran Van B', N'b-tv', N'admin' 
EXEC INS_ADMIN N'Nguyen Thi C', N'c-nt', N'admin' 
GO

EXEC INS_MAJOR N'Cong nghe thong tin'
EXEC INS_MAJOR N'He thong thong tin'
EXEC INS_MAJOR N'Mang may tinh'
GO

EXEC INS_LECTURER N'Doan Van D', 1, N'1', N'Giang vien', N'd-dv', N'123456789'
EXEC INS_LECTURER N'Tran Thi E', 0, N'0', N'Giang vien', N'e-tt', N'123456789'
EXEC INS_LECTURER N'Truong Cong F', 1, N'2', N'Giang vien', N'f-tc', N'123456789'
GO

EXEC INS_STUDENT N'Nguyen Van G', 1,'10/01/2000',N'0', N'g-nv', N'123456789'
EXEC INS_STUDENT N'Pham Thi H', 0,'18/04/2001',N'1', N'h-pt', N'123456789'
EXEC INS_STUDENT N'Trinh Thi I', 0,'06/07/2001',N'2', N'i-tt', N'123456789'
GO

SELECT 
FORMAT(DATEOFBIRTH, 'dd/MMM/yyyy')
FROM STUDENT
GO