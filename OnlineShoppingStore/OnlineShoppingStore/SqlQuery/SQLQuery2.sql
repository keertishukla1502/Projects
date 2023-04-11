--[Atul].[spAspNetUserRolesById]  '7eb60a91-1602-45ba-a079-6edb94822c62'

alter  PROCEdure [Atul].[spAspNetUserRolesById] 
@id      varchar(100) ='0'
AS
BEGIN


 select RoleId from AspNetUserRoles where UserId = @id;


END
