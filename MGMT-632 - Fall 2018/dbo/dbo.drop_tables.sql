ALTER PROCEDURE [dbo].[drop_tables]
AS

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'crossSells')
DROP TABLE [dbo].[crossSells];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'upSells') 
DROP TABLE [dbo].[upSells];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'orderItems') 
DROP TABLE [dbo].[orderItems];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'shippingMethods') 
DROP TABLE [dbo].[shippingMethods];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'orders') 
DROP TABLE [dbo].[orders];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'product') 
DROP TABLE [dbo].[product];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'category') 
DROP TABLE [dbo].[category];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'department') 
DROP TABLE [dbo].[department];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'paymentInfo') 
DROP TABLE [dbo].[paymentInfo];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'shippingAddress') 
DROP TABLE [dbo].[shippingAddress];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'customer') 
DROP TABLE [dbo].[customer];
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'visitors') 
DROP TABLE [dbo].[visitors];
SELECT * FROM SYS.tables WHERE name IN ('visitors','customer','paymentInfo', 'shippingMethods', 'category','department','shippingAddress','orders','orderItems','product','upSells','crossSells');
RETURN 0