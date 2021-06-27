CREATE OR ALTER PROCEDURE [dbo].[USP_ImageOperations] 
@Action varchar(50) ,@ImageId int=0,
@ImageName varchar(150)='',@ImageDiscription varchar(2000)='',@ImageOrder int=0,@ImageStatus int=0,@HomeImageStatus int=0
,@BannerImageStatus int=0,@ImagePath varchar(500)='',@ThumbnailImagePath varchar(500)='',@UploadType int=0,@UserId int=0
AS   
BEGIN  
	SET NOCOUNT ON;   
	DECLARE @Rowcount int 
	
	IF @Action='insert'
	BEGIN
		INSERT INTO mstrImages(ImageName,ImageDescription,ImageOrder,IsActive,IsHome,CreatedBy,CreatedDate) --IsBanner
		VALUES(@ImageName,@ImageDiscription,@ImageOrder,@ImageStatus,@HomeImageStatus,@UserId,GETDATE()); --@BannerImageStatus

		SELECT SCOPE_IDENTITY() AS ImageId;
	END
	ELSE IF @Action='read'
	BEGIN
		IF @ImageId=0
		BEGIN
			SELECT Id,ImageName,ISNULL(ImageDescription,'') AS ImageDescription,ImageOrder,ImagePath,
			ISNULL(ThumbnailImagePath,'') AS ThumbnailImagePath,IsActive,ISNULL(IsBanner,0) AS IsBanner,IsHome ,CreatedDate,CreatedBy
			FROM mstrImages ORDER BY ID DESC;
			
			WITH t1 AS (SELECT ISNULL(COUNT(*),0) AS ActiveBannerImgCount FROM mstrImages WHERE IsActive=1 and IsBanner=1),
			t2 as (SELECT ISNULL(COUNT(*),0) AS ActiveHomeImgCount FROM mstrImages WHERE IsActive=1 and IsHome=1)
			SELECT * FROM t1,t2;
		END
		ELSE
		BEGIN
			SELECT Id,ImageName,ImageDescription,ImageOrder,ImagePath,ThumbnailImagePath,IsActive,IsBanner,IsHome ,CreatedDate,CreatedBy
			FROM mstrImages WHERE ID=@ImageId;
		END
	END
	ELSE IF @Action='update'
	BEGIN
		IF @UploadType=1
		BEGIN
			UPDATE mstrImages SET ImagePath=LTRIM(RTRIM(@ImagePath)),ThumbnailImagePath=ISNULL(TRIM(RTRIM(@ThumbnailImagePath)),'') WHERE Id=@ImageId;
			SELECT  @ImageId as ImageId; 
		END
		ELSE
		BEGIN
			UPDATE mstrImages SET ImageName=@ImageName
			,ImageDescription=@ImageDiscription
			,ImageOrder=@ImageOrder
			,IsActive=@ImageStatus
			,IsHome=@HomeImageStatus
			,IsBanner=@BannerImageStatus
			,CreatedBy=@UserId
			,CreatedDate=GETDATE()
			WHERE Id=@ImageId;
			
			SELECT  @ImageId as ImageId; 
		END
	END
	ELSE IF @Action='search'
	BEGIN
		IF @ImageOrder>0
		BEGIN
			IF @ImageId=1
			 SELECT ISNULL(COUNT(ImageOrder),0) as result FROM mstrImages 
			 WHERE ImageOrder=@ImageOrder and IsHome=1;
		    /*ELSE
		     SELECT ISNULL(COUNT(ImageOrder),0) as result FROM mstrImages 
		     WHERE ImageOrder=@ImageOrder and IsBanner=1;*/
		END
		ELSE
		BEGIN
			SELECT ISNULL(ImagePath,'') AS result FROM mstrImages WHERE ID=@ImageId;
		END
	END
	ELSE IF @Action='delete'
	BEGIN
		DELETE FROM mstrImages WHERE Id=@ImageId;
		SELECT  @ImageId as ImageId; 
	END
END

GO
CREATE OR ALTER PROCEDURE [dbo].[usp_GetUserProfileDetails] 
	@Action		VARCHAR(15),
	@Name		VARCHAR(150)='',
	@Password	VARCHAR(150)='',	
	@UserId		INT=0,
	@EmailId	VARCHAR(150)=''
AS
BEGIN
	IF @Action='readProfile'
		BEGIN
			SELECT Name,UserName,EmailId FROM mstrUser WHERE Id=@UserId AND IsActive=1;
		END
	ELSE IF @Action='oldpwdcheck'
		SELECT COUNT(Id) AS Result FROM mstrUser WHERE Password=@Password;
	ELSE IF @Action='updateProfile'
		BEGIN
			IF @Name!= ''
				UPDATE mstrUser SET Name= @Name WHERE Id=@UserId AND IsActive=1;
			IF @Password!= ''
				UPDATE mstrUser SET Password= @Password WHERE Id=@UserId AND IsActive=1;
			SELECT 1 AS Result;
		END
	ELSE IF @Action='updateresetpwd'
		BEGIN
			UPDATE mstrUser SET [Password] = @Password WHERE EmailId=@EmailId AND IsActive=1;
			SELECT 1 AS Result;
		END
END

GO
CREATE OR ALTER PROCEDURE [dbo].[usp_GetUserDetails] 
	@Action		VARCHAR(15),
	@UserName	VARCHAR(150)='',
	@Password	VARCHAR(150)='',
	@EmailId	VARCHAR(150)='',
	@Name		VARCHAR(150)='',
	@UserId		INT=0
AS
BEGIN
	IF @Action='checkauth'
		BEGIN
			SELECT Id,Name FROM mstrUser WHERE UserName=@UserName AND [Password]=@Password AND IsActive=1;
		END
	ELSE IF @Action='insert'
		IF NOT EXISTS(SELECT EmailId FROM mstrUser WHERE EmailId=@UserName)
			IF NOT EXISTS(SELECT EmailId FROM mstrUser WHERE EmailId=@EmailId)
				BEGIN
					INSERT INTO mstrUser(Name,UserName,[Password],EmailId,IsActive,CreatedDate)
					VALUES(@Name,@UserName,@Password,@EmailId,1,GETDATE());
					IF @@ROWCOUNT>0
						SELECT 1 AS Result;
					ELSE
						SELECT 0 AS Result;
				END
			ELSE
				SELECT 2 AS Result;
		ELSE
			SELECT 3 AS Result;
	ELSE IF @Action='readProfile'
		BEGIN
			SELECT Name,UserName,EmailId FROM mstrUser WHERE Id=@UserId AND IsActive=1;
		END
	ELSE IF @Action='updateProfile'
		BEGIN
			IF @Name!= ''
				UPDATE mstrUser SET Name= @Name WHERE Id=@UserId AND IsActive=1;
			IF @Password!= ''
				UPDATE mstrUser SET Password= @Password WHERE Id=@UserId AND IsActive=1;
			SELECT 1 AS Result;
		END
END
