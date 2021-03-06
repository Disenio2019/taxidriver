USE [master]
GO
/****** Object:  Database [dbtaxi]    Script Date: 23/05/2019 20:53:04 ******/
CREATE DATABASE [dbtaxi] ON  PRIMARY 
( NAME = N'dbtaxi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbtaxi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbtaxi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbtaxi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbtaxi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbtaxi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbtaxi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbtaxi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbtaxi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbtaxi] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbtaxi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbtaxi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbtaxi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbtaxi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbtaxi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbtaxi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbtaxi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbtaxi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbtaxi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbtaxi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbtaxi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbtaxi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbtaxi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbtaxi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbtaxi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbtaxi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbtaxi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbtaxi] SET RECOVERY FULL 
GO
ALTER DATABASE [dbtaxi] SET  MULTI_USER 
GO
ALTER DATABASE [dbtaxi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbtaxi] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbtaxi', N'ON'
GO
USE [dbtaxi]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 23/05/2019 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chofer](
	[NroLicencia] [nvarchar](10) NOT NULL,
	[Categoria] [varchar](1) NULL,
	[Nombre] [nvarchar](20) NULL,
	[Apellido] [nvarchar](20) NULL,
	[Direccion] [nvarchar](100) NULL,
	[Celular] [int] NULL,
 CONSTRAINT [PK_Chofer] PRIMARY KEY CLUSTERED 
(
	[NroLicencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/05/2019 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Cuenta] [nvarchar](10) NOT NULL,
	[Clave] [nvarchar](200) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
	[Rol] [varchar](20) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
	[FechaCreacion] [date] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 23/05/2019 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Placa] [nvarchar](10) NOT NULL,
	[TipoVehiculo] [nvarchar](50) NULL,
	[Marca] [nvarchar](20) NULL,
	[Modelo] [int] NULL,
	[CantidadPasajeros] [int] NULL,
	[FkChofer] [nvarchar](10) NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Chofer] ([NroLicencia], [Categoria], [Nombre], [Apellido], [Direccion], [Celular]) VALUES (N'5765429', N'P', N'JHOANA', N'GABRIEL', N'CALLE BOLIVAR ENTRE QUE TE IMPORTA', 56242422)
INSERT [dbo].[Chofer] ([NroLicencia], [Categoria], [Nombre], [Apellido], [Direccion], [Celular]) VALUES (N'7295211', N'A', N'ARIEL', N'GABRIEL TICONA', N'CALLE BOLIVAR ENTRE QUE TE IMPORTA', 62352424)
INSERT [dbo].[Usuario] ([Cuenta], [Clave], [Nombre], [Apellido], [Rol], [Estado], [FechaCreacion]) VALUES (N'admin', N'1234567890', N'Admin', N'Nistrador', N'Administrador', N'Activo', CAST(N'2019-05-13' AS Date))
INSERT [dbo].[Usuario] ([Cuenta], [Clave], [Nombre], [Apellido], [Rol], [Estado], [FechaCreacion]) VALUES (N'agabriel', N'123456', N'ariel', N'gabriel', N'Administrador', N'Activo', CAST(N'2019-05-07' AS Date))
INSERT [dbo].[Usuario] ([Cuenta], [Clave], [Nombre], [Apellido], [Rol], [Estado], [FechaCreacion]) VALUES (N'msantos', N'22222', N'Manuel', N'Santos', N'Operador', N'Activo', CAST(N'2019-05-13' AS Date))
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Chofer] FOREIGN KEY([FkChofer])
REFERENCES [dbo].[Chofer] ([NroLicencia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Chofer]
GO
USE [master]
GO
ALTER DATABASE [dbtaxi] SET  READ_WRITE 
GO
