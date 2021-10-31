USE [master]
GO
/****** Object:  Database [Sistema_de_Ventas]    Script Date: 31/10/2021 04:15:22 a. m. ******/
CREATE DATABASE [Sistema_de_Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_de_Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_de_Ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistema_de_Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_de_Ventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sistema_de_Ventas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_de_Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_de_Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_de_Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_de_Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sistema_de_Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_de_Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistema_de_Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_de_Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_de_Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_de_Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_de_Ventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema_de_Ventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sistema_de_Ventas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema_de_Ventas', N'ON'
GO
ALTER DATABASE [Sistema_de_Ventas] SET QUERY_STORE = OFF
GO
USE [Sistema_de_Ventas]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idpersona] [int] NULL,
	[codigo_cliente] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consumo]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consumo](
	[idconsumo] [int] IDENTITY(1,1) NOT NULL,
	[idreserva] [int] NULL,
	[idproducto] [int] NULL,
	[cantidad] [decimal](7, 2) NULL,
	[precio_venta] [decimal](7, 2) NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_consumo] PRIMARY KEY CLUSTERED 
(
	[idconsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[habitacion]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitacion](
	[idhabitacion] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](50) NULL,
	[piso] [varchar](5) NULL,
	[descripcion] [varchar](max) NULL,
	[caracteristicas] [varchar](max) NULL,
	[precio_diario] [decimal](7, 2) NULL,
	[estado] [varchar](50) NULL,
	[tipo_habitacion] [varchar](50) NULL,
 CONSTRAINT [PK_habitacion] PRIMARY KEY CLUSTERED 
(
	[idhabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[idpago] [int] IDENTITY(1,1) NOT NULL,
	[idreserva] [int] NULL,
	[tipo_comprobante] [varchar](50) NULL,
	[num_comprobante] [varchar](50) NULL,
	[igv] [decimal](4, 2) NULL,
	[total_pago] [decimal](7, 2) NULL,
	[fecha_emision] [date] NULL,
	[fecha_pago] [date] NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[idpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apaterno] [varchar](50) NULL,
	[amaterno] [varchar](50) NULL,
	[tipo_documento] [varchar](50) NULL,
	[num_documento] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](550) NULL,
	[unidad_medida] [varchar](50) NULL,
	[precio_venta] [decimal](7, 2) NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserva](
	[idreserva] [int] IDENTITY(1,1) NOT NULL,
	[idhabitacion] [int] NULL,
	[idcliente] [int] NULL,
	[idtrabajador] [int] NULL,
	[tipo_reserva] [varchar](50) NULL,
	[fecha_reserva] [date] NULL,
	[fecha_ingresa] [date] NULL,
	[fecha_salida] [date] NULL,
	[costo_alojamiento] [decimal](7, 2) NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_reserva] PRIMARY KEY CLUSTERED 
(
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trabajador]    Script Date: 31/10/2021 04:15:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trabajador](
	[idpersona] [int] NOT NULL,
	[sueldo] [decimal](7, 2) NULL,
	[acceso] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Table3] PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cliente] ([idpersona], [codigo_cliente]) VALUES (11, N'CLI 27')
GO
INSERT [dbo].[cliente] ([idpersona], [codigo_cliente]) VALUES (13, N'CLI 88')
GO
INSERT [dbo].[cliente] ([idpersona], [codigo_cliente]) VALUES (14, N'CLI 48')
GO
INSERT [dbo].[cliente] ([idpersona], [codigo_cliente]) VALUES (12, N'CLI 43')
GO
INSERT [dbo].[cliente] ([idpersona], [codigo_cliente]) VALUES (15, N'CLI 81')
GO
SET IDENTITY_INSERT [dbo].[habitacion] ON 
GO
INSERT [dbo].[habitacion] ([idhabitacion], [numero], [piso], [descripcion], [caracteristicas], [precio_diario], [estado], [tipo_habitacion]) VALUES (1, N'502', N'1', N'La siguiente habitacion, cuenta,
con vista al mar y cuanto con Jacuzzi.', N'Internet, television por cable, y servicio
de lavado.', CAST(450.00 AS Decimal(7, 2)), N'Ocupado', N'Matrimonial')
GO
INSERT [dbo].[habitacion] ([idhabitacion], [numero], [piso], [descripcion], [caracteristicas], [precio_diario], [estado], [tipo_habitacion]) VALUES (2, N'455', N'4', N'La siguiente habitacion no tiene acceso al mar', N'tiene internet con cable', CAST(500.00 AS Decimal(7, 2)), N'Disponible', N'Individual')
GO
INSERT [dbo].[habitacion] ([idhabitacion], [numero], [piso], [descripcion], [caracteristicas], [precio_diario], [estado], [tipo_habitacion]) VALUES (3, N'750', N'7', N'Sin vista al mar', N'internet wifi', CAST(350.00 AS Decimal(7, 2)), N'Disponible', N'Familiar')
GO
INSERT [dbo].[habitacion] ([idhabitacion], [numero], [piso], [descripcion], [caracteristicas], [precio_diario], [estado], [tipo_habitacion]) VALUES (4, N'302', N'3', N'la siguiente habitacion, tiene vista al agua', N'la habitacion tiene jacuzzi', CAST(750.00 AS Decimal(7, 2)), N'Disponible', N'presidencial')
GO
SET IDENTITY_INSERT [dbo].[habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (1, N'Ricardo', N'Herrera', N'Hernandez', N'DNI', N'(656)358-8226', N'Calle Uva', N'(656)-356-3445', N'ricardo.herrera@zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (2, N'Daniela', N'Herrera', N'Velazquez', N'LM', N'(656)845-1234', N'Calle topinambo #123', N'123223', N'daniela.herrera@zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (3, N'dsad', N'das', N'dsad', N'DNI', N'asda', N'dsad', N'dsa', N'dsa')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (4, N'dfds', N'ffds', N'fds', N'DNI', N'fds', N'fds', N'fds', N'fds')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (5, N'fdf', N'fdsfds', N'fds', N'DNI', N'fdsf', N'fds', N'fds', N'fsd')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (6, N'sda', N'dsa', N'dsa', N'DNI', N'dsa', N'dsa', N'dsa', N'dsa')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (7, N'Roberto', N'Moreno', N'Contreras', N'DNI', N'12232', N'Sin direccion', N'Sin telefono', N'roberto.moreno@gmail.com')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (8, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'123456', N'Calle Uva #123', N'(656)358-8226', N'ricardo.herrera@zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (9, N'Daniel', N'Herrera', N'Velazquez', N'DNI', N'122334', N'sin direccion', N'sin telefono', N'sin emial')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (10, N'Sandra Gabriela', N'Hernadez', N'Contreras', N'LM', N'125856', N'Sin direccion', N'Sin Telefono', N'Sin correo')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (11, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'1', N'Calle Topinambo #9614', N'(656) - 358-8226', N'ricardo.herrera@zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (12, N'Daniela', N'Contreras', N'De la O', N'Otros', N'2', N'Calle Uva #231', N'(656)987-8852', N'Daniela.Contreras@zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (13, N'Roberta', N'Moreno', N'Luna', N'CE', N'3', N'Sin direccion', N'(656)358-7898', N'Roberta.Moreno@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (14, N'Ricardo', N'Contreras', N'Luna', N'Otros', N'4', N'Sin direccion', N'Sin telefono', N'Ricardo.Contreras@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (15, N'Fabian', N'Maciel', N'Ortiz', N'DNI', N'3', N'sin direccion', N'(656)', N'Fabian.Maciel@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (16, N'Pruebas', N'pruebas', N'pruebas', N'Otros', N'pruebas', N'pruebas', N'(656)', N'Pruebas.pruebas@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (17, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'1', N'Calle Topinambo #9614', N'(656)358-8226', N'Ricardo.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (18, N'dsa', N'dsa', N'dsa', N'DNI', N'dsa', N'dsa', N'(656)dsa', N'dsa.dsa@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (19, N'dsa', N'dsa', N'dsa', N'DNI', N'dsa', N'dsa', N'(656)dsa', N'dsa.dsa@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (20, N'fds', N'fds', N'fdsfds', N'DNI', N'fds', N'fds', N'(656)fds', N'fds.fds@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (21, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'1', N'Topinambo #9614', N'(656)3588226', N'Ricardo.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (22, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'1', N'Sin direccion', N'(656)358-822612', N'Ricardo.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (23, N'Ricardo', N'Herrera', N'Velazquez', N'DNI', N'1', N'Calle Porfirio Diaz # 922', N'(656)358-8226', N'Ricardo.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (24, N'Sandra', N'Herrera', N'Velazquez', N'DNI', N'2', N'Calle Topinambo # 9614', N'(656)', N'Sandra.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (25, N'Sandra', N'Herrera', N'Velazquez', N'DNI', N'2', N'Calle Topinambo # 9614', N'(656)', N'Sandra.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (26, N'Sandra', N'Herrera', N'Velazquez', N'Otros', N'2', N'Calle Topinambo # 9614', N'(656)', N'Sandra.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (27, N'Daniel', N'Herrera', N'Velazquez', N'DNI', N'2', N'Sin direccion', N'(656)', N'Daniel.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (28, N'Renata', N'Herrera', N'Perez', N'DNI', N'2', N'Calle porfirio diaz', N'(656) 3588226', N'Renata.Herrera@Zemog.com.mx')
GO
INSERT [dbo].[persona] ([idpersona], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (29, N'pruebas', N'pruebas', N'pruebas', N'DNI', N'1', N'sin direccion', N'sin direccion', N'pruebas.pruebas@Zemog.com.mx')
GO
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([idproducto], [nombre], [descripcion], [unidad_medida], [precio_venta]) VALUES (1, N'Doritos', N'Paquete de doritos nachos', N'KG', CAST(12.00 AS Decimal(7, 2)))
GO
INSERT [dbo].[producto] ([idproducto], [nombre], [descripcion], [unidad_medida], [precio_venta]) VALUES (2, N'Agua purificada', N'Agua de Ltr 1', N'LT', CAST(15.00 AS Decimal(7, 2)))
GO
INSERT [dbo].[producto] ([idproducto], [nombre], [descripcion], [unidad_medida], [precio_venta]) VALUES (3, N'Manzanas', N'Manzana por km', N'KG', CAST(8.00 AS Decimal(7, 2)))
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
INSERT [dbo].[trabajador] ([idpersona], [sueldo], [acceso], [login], [password], [estado]) VALUES (23, CAST(12234.00 AS Decimal(7, 2)), N'Administrador', N'ricardo', N'123', N'A')
GO
INSERT [dbo].[trabajador] ([idpersona], [sueldo], [acceso], [login], [password], [estado]) VALUES (26, CAST(12585.00 AS Decimal(7, 2)), N'Digitador', N'sandra', N'123', N'D')
GO
INSERT [dbo].[trabajador] ([idpersona], [sueldo], [acceso], [login], [password], [estado]) VALUES (27, CAST(1223.00 AS Decimal(7, 2)), N'Digitador', N'dani', N'123', N'A')
GO
INSERT [dbo].[trabajador] ([idpersona], [sueldo], [acceso], [login], [password], [estado]) VALUES (28, CAST(1234.00 AS Decimal(7, 2)), N'Digitador', N'tata', N'123', N'A')
GO
INSERT [dbo].[trabajador] ([idpersona], [sueldo], [acceso], [login], [password], [estado]) VALUES (29, CAST(0.00 AS Decimal(7, 2)), N'Administrador', N'pruebas', N'123', N'A')
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_reserva] FOREIGN KEY([idreserva])
REFERENCES [dbo].[reserva] ([idreserva])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_reserva]
GO
ALTER TABLE [dbo].[reserva]  WITH CHECK ADD  CONSTRAINT [FK_reserva_habitacion] FOREIGN KEY([idhabitacion])
REFERENCES [dbo].[habitacion] ([idhabitacion])
GO
ALTER TABLE [dbo].[reserva] CHECK CONSTRAINT [FK_reserva_habitacion]
GO
USE [master]
GO
ALTER DATABASE [Sistema_de_Ventas] SET  READ_WRITE 
GO
