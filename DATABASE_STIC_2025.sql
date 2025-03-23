CREATE DATABASE STIC2025
GO
USE STIC2025
GO
CREATE TABLE Branch(
BranchId int primary key identity(1,1),
Description varchar(100) not null,
Abreviate varchar(3) not null,
Status bit
)
GO
CREATE TABLE Role(
RoleId int primary key identity(1,1),
Description varchar(100) not null,
Abreviate varchar(3) not null,
Status bit
)

GO
CREATE TABLE Person(
PersonId int primary key identity(1,1),
BranchId int foreign key references Branch(BranchId) not null,
DocumentId int not null,
Names varchar(100) not null,
LastNames varchar(100) not null,
Email varchar(100) not null, 
Address varchar(200) not null,
DateOfBirth date,
Gender varchar(1),
Status bit
)
GO
CREATE TABLE [User](
UserId int primary key identity(1,1),
Username varchar(100) not null,
Password varchar(100) not null,
PersonId int foreign key references Person(PersonId),
RoleId int foreign key references Role(RoleId),
Status bit
)
GO
CREATE TABLE Module(
ModuleId int primary key identity(1,1),
Title varchar(50) not null,
ModuleIdFather int not null,
Route varchar(50) null,
Status bit)
GO
CREATE TABLE ModuleRole(
ModuleRoleId int primary key identity(1,1),
ModuleId int foreign key references Module(ModuleId),
RoleId int foreign key references Role(RoleId),
Status bit
)
GO
CREATE TABLE OperationModuleRole(
OperationModuleRoleId int primary key identity(1,1),
ModuleRoleId int foreign key references ModuleRole(ModuleRoleId),
[Create] bit,
[Update] bit,
[Read] bit,
[Delete] bit,
Status bit
)
GO
INSERT INTO Branch (Description,Abreviate,Status)
VALUES
('La Paz','LPZ',1),
('Cochabamba','CBB',1),
('Santa Cruz','SCZ',1),
('Pando','PND',1),
('Beni','BEN',1),
('Oruro','ORU',1),
('Potosi','PTS',1),
('Chuquisaca','CHU',1),
('Tarija','TRJ',1)
GO
INSERT INTO Role (Description,Abreviate,Status)
VALUES
('Administador','ADM',1),
('Gestor de cuentas','GDC',1),
('Reporter','RPT',1)
GO
INSERT INTO Person (BranchId,DocumentId, Names, LastNames,Email, Address, DateOfBirth,Gender,Status)
VALUES
  (1,0000000, 'ROOT','ROOT','root@root.com','ROOT',GETDATE(),'M', 1),
  (2,8351569, 'JOSE ISRAEL','ESCARCHA BORJA','escarchaisrael@gmail.com', 'AV. CIRCUNVALACION ENTRE CALLE 5 Y 6 VILLA CONCEPCION','1992-12-01','M', 1),
  (3,4321170, 'EDSON RAUL','FERNANDEZ GOMEZ','edsonfernandez@gmail.com', 'AV. JJ PEREZ ESQ 20 DE OCTUBRE NRO 10','1992-12-01','M', 1),
  (4,4002001, 'DANIEL FERNANDO','TORREIRA LOPEZ','daniel.torreira98@gmail.com', 'AV. CARRASCO ESQ HUGO DAVILA','1992-12-01','M', 1),
  (5,1279847, 'MARIA ALEJANDRA','SOARES PEREZ','maria.alejandra@gmail.com', 'ACHUMANI NRO 9488 CALLE 34','1992-12-01','F', 1),
  (6,3646655, 'DANIELA GERALDINE','GALINDEZ POVEDA','galindezdg@gmail.com', 'AV. FUERZA NAVAL EDIF. CRISALES PISO 1','1992-12-01','F', 1)
GO
INSERT INTO [User] (Username,Password,PersonId,RoleId,Status)
VALUES
('root','root',1,1,1)
GO
INSERT INTO [Module] (Title,ModuleIdFather,Route,Status)
VALUES
('Gestión de Seguridad',0,'',1),
('Roles',1,'',1),
('Modulos',1,'',1),
('Operaciones',1,'',1),
('Gestión de Usuarios',0,'',1),
('Personas',5,'',1),
('Usuarios',5,'',1)
GO
INSERT INTO [ModuleRole] (ModuleId,RoleId,Status)
VALUES
(1,1,1),
(2,1,1),
(3,1,1),
(4,1,1),
(5,1,1),
(6,1,1),
(7,1,1)
GO
INSERT INTO OperationModuleRole(ModuleRoleId,[Create],[Update],[Read],[Delete],Status)
VALUES
(1,1,1,1,1,1),
(2,1,1,1,1,1),
(3,1,1,1,1,1),
(4,1,1,1,1,1),
(5,1,1,1,1,1),
(6,1,1,1,1,1),
(7,1,1,1,1,1)
GO
