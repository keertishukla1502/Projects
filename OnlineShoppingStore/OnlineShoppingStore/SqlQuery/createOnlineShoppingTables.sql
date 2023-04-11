

CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[CategoryName] [varchar](500) unique,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
)



CREATE TABLE [dbo].[Tbl_SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[CategoryId] [int] NULL,
	[SubCategoryName] [varchar](500) unique,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	foreign key(CategoryId) references Tbl_Category([CategoryId])
)

CREATE TABLE [dbo].[Tbl_Brand](
	[BrandId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[BrandName] [varchar](500) unique,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
)




CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[ProductName] [varchar](500) unique,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Description] [datetime] NULL,
	[ProductImage] [varchar](max) NULL,
	[IsFeatured] [bit] NULL,
	[Quantity] [int] NULL,
	foreign key(CategoryId) references Tbl_Category([CategoryId])
) 



ALTER TABLE [dbo].[Tbl_Product]
ADD [ProductImage2] [varchar](max) NULL,
 [ProductImage3] [varchar](max) NULL,
 [BrandId] [int] NULL,
 [SubCategoryId] [int] NULL,
 foreign key(BrandId) references Tbl_Brand([BrandId]),
 foreign key(SubCategoryId) references Tbl_SubCategory([SubCategoryId])



CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[CartStatus] [varchar](500) NULL,

)


CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[FristName] [varchar](200) NULL,
	[LastName] [varchar](200) unique,
	[EmailId] [varchar](200) unique,
	[Password] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
)

CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[MemberId] [int] NULL,
	[Adress] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [int] NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
	foreign key(MemberId) references Tbl_Members(MemberId)
)

CREATE TABLE [dbo].[Tbl_Roles](
	[RoleId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[RoleName] [varchar](200) unique,
)



CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	foreign key(ProductId) references Tbl_Product(ProductId)

)






CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleID] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[memberId] [int] NULL,
	[RoleId] [int] NULL,
)

 





CREATE TABLE [dbo].[Tbl_SlideImage](
	[SlideId] [int] IDENTITY(1,1) PRIMARY Key NOT NULL,
	[SlideTitle] [varchar](500) NULL,
	[SlideImage] [varchar](max) NULL,
)  

