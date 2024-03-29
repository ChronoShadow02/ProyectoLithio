USE [LithioBD]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Articulo] [varchar](200) NOT NULL,
	[Nombre_Articulo] [varchar](200) NOT NULL,
	[Descripcion_Articulo] [varchar](200) NULL,
	[Cantidad_Articulo] [int] NOT NULL,
	[Costo_Articulo] [float] NOT NULL,
	[Costo_Anterior_Articulo] [float] NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Id_Presentacion] [int] NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costo_ConceptoAux]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costo_ConceptoAux](
	[Id_Costo_Concepto_AUX] [int] IDENTITY(1,1) NOT NULL,
	[Id_Costo] [int] NOT NULL,
	[Id_Articulo] [int] NOT NULL,
	[Codigo_Articulo] [varchar](200) NOT NULL,
	[Nombre_Articulo] [varchar](200) NOT NULL,
	[Id_Presentacion] [int] NOT NULL,
	[Nombre_Presentacion] [varchar](200) NOT NULL,
	[Id_proveedor] [int] NOT NULL,
	[Nombre_Proveedor] [varchar](200) NOT NULL,
	[Unidades_Articulos] [int] NOT NULL,
	[Costo_Por_Unidad_Dolares] [float] NOT NULL,
	[Costo_Total_Dolares] [float] NOT NULL,
	[Total_Costo_Dolares] [float] NULL,
	[ProbCostoTotalCompra] [float] NULL,
	[DistCostoMaritimo] [float] NULL,
	[DistCostoTerrestre] [float] NULL,
	[MontoCostoPorArticuloMar] [float] NULL,
	[MontoCostoPorArticuloTer] [float] NULL,
	[Total_CosteoPorArticuloMar] [float] NULL,
	[Total_CosteoPorArticuloTer] [float] NULL,
	[Total_CosteoTotal] [float] NULL,
 CONSTRAINT [PK_Costo_ConceptoAux] PRIMARY KEY CLUSTERED 
(
	[Id_Costo_Concepto_AUX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costos]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costos](
	[Id_Costo] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Costos] [int] NOT NULL,
	[DUA] [varchar](200) NOT NULL,
	[Tipo_De_Cambio] [decimal](18, 2) NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Costos] PRIMARY KEY CLUSTERED 
(
	[Id_Costo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Usuario]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Usuario](
	[Id_Estado_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Estado_Usuario] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Estado_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Estado_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id_Pais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Pais] [varchar](200) NOT NULL,
	[Sigla_Pais] [varchar](3) NOT NULL,
	[Moneda_Pais] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentaciones]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentaciones](
	[Id_Presentacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Presentacion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Presentaciones] PRIMARY KEY CLUSTERED 
(
	[Id_Presentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Proveedor] [varchar](200) NOT NULL,
	[Nombre_Proveedor] [varchar](200) NOT NULL,
	[Id_Pais] [int] NOT NULL,
	[Tiene_Costo_Maritimo] [varchar](2) NOT NULL,
	[Costo_Maritimo] [decimal](18, 2) NOT NULL,
	[Tiene_Costo_Terrestre] [varchar](2) NOT NULL,
	[Costo_Terrestre] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[Id_Tipo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Tipo_Usuario] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [varchar](200) NOT NULL,
	[Correo_Electronico] [varchar](200) NOT NULL,
	[Contrasena_Usuario] [varchar](200) NOT NULL,
	[Id_Tipo_Usuario] [int] NOT NULL,
	[Id_Estado_Usuario] [int] NOT NULL,
	[Token_Recovery] [varchar](200) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (1, N'02904-04-0208', N'Vascomil 22', NULL, 10, 1500, 1000, 1, 1)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (5, N'02850-05-0208', N'Vasco 5000', NULL, 1, 2000, 0, 1, 1)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (6, N'11905-04-0208', N'Synergy 905', NULL, 1, 1625, 1625, 1, 1)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (7, N'11905-04-0019', N'Synergy 905', NULL, 1, 186, 186, 1, 13)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (8, N'11735-02-0019', N'Synergy 735', NULL, 2, 215, 300, 1, 1002)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (9, N'65018700062', N'ECOCOOL SYN 2175', NULL, 1, 1425, 1425, 2, 1)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', NULL, 10, 805, 0, 2, 2)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (11, N'NJT1500C', N'NJT1500C 60Hz', N'Aceite especializado en motores de automóviles de 60Hz', 4, 475, 2500, 15, 1002)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (12, N'NJT500C', N'NJT500C 75Hz', NULL, 4, 475, 1500, 15, 2)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (13, N'NJT600', N'Next Jem 600ML', NULL, 4, 420, 1000, 15, 13)
INSERT [dbo].[Articulos] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Cantidad_Articulo], [Costo_Articulo], [Costo_Anterior_Articulo], [Id_Proveedor], [Id_Presentacion]) VALUES (14, N'1195-202-550ML', N'PLANTOHYD 60ML', NULL, 10, 750, 250, 2, 13)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Costo_ConceptoAux] ON 

INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1, 77, 0, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 19241, 0.77958526064133882, 747.31043085078738, 538.521906345824, 74.731043085078738, 53.852190634582406, 15074.731043085079, 15053.852190634583, 15128.583233719661)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (2, 77, 0, N'02850-05-0208', N'Vasco 5000', 1, N'Cubeta', 1, N'Blaser', 1, 2000, 2000, 19241, 0.10394470141884518, 99.641390780105, 71.80292084610987, 99.641390780105, 71.80292084610987, 2099.6413907801052, 2071.80292084611, 2171.444311626215)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (3, 77, 0, N'11905-04-0208', N'Synergy 905', 1, N'Cubeta', 1, N'Blaser', 1, 1625, 1625, 19241, 0.084455069902811708, 80.9586300088353, 58.339873187464271, 80.9586300088353, 58.339873187464271, 1705.9586300088354, 1683.3398731874643, 1764.2985031962996)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (4, 77, 0, N'11905-04-0019', N'Synergy 905', 13, N'Estañón', 1, N'Blaser', 1, 186, 186, 19241, 0.0096668572319526, 9.2666493425497638, 6.6776716386882171, 9.2666493425497638, 6.6776716386882171, 195.26664934254976, 192.67767163868822, 201.94432098123798)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (5, 77, 0, N'11735-02-0019', N'Synergy 735', 1002, N'Cuarto', 1, N'Blaser', 2, 215, 430, 19241, 0.022348110805051714, 21.422899017722575, 15.437627981913622, 10.711449508861287, 7.7188139909568108, 440.71144950886128, 437.71881399095679, 448.43026349981812)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (6, 77, 0, N'65018700062', N'ECOCOOL SYN 2175', 1, N'Cubeta', 2, N'Fuchs', 1, 1425, 1425, 9475, 0.15039577836411611, 0, 0, 0, 0, 1425, 1425, 1425)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (7, 77, 0, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 9475, 0.84960422163588389, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (8, 79, 0, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 15000, 1, 958.6, 690.78, 95.86, 69.078, 15095.86, 15069.078, 15164.938)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (9, 80, 0, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 15000, 1, 958.6, 690.78, 95.86, 69.078, 15095.86, 15069.078, 15164.938)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (10, 80, 0, N'65018700062', N'ECOCOOL SYN 2175', 1, N'Cubeta', 2, N'Fuchs', 1, 1425, 1425, 1425, 1, 0, 0, 0, 0, 1425, 1425, 1425)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (11, 82, 0, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 15000, 1, 958.6, 690.78, 95.86, 69.078, 15095.86, 15069.078, 15164.938)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (12, 84, 1, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 15000, 1, 958.6, 690.78, 95.86, 69.078, 15095.86, 15069.078, 15164.938)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (13, 85, 1, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 19241, 0.77958526064133882, 747.31043085078738, 538.521906345824, 74.731043085078738, 53.852190634582406, 15074.731043085079, 15053.852190634583, 15128.583233719661)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (14, 85, 5, N'02850-05-0208', N'Vasco 5000', 1, N'Cubeta', 1, N'Blaser', 1, 2000, 2000, 19241, 0.10394470141884518, 99.641390780105, 71.80292084610987, 99.641390780105, 71.80292084610987, 2099.6413907801052, 2071.80292084611, 2171.444311626215)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (15, 85, 6, N'11905-04-0208', N'Synergy 905', 1, N'Cubeta', 1, N'Blaser', 1, 1625, 1625, 19241, 0.084455069902811708, 80.9586300088353, 58.339873187464271, 80.9586300088353, 58.339873187464271, 1705.9586300088354, 1683.3398731874643, 1764.2985031962996)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (16, 85, 7, N'11905-04-0019', N'Synergy 905', 13, N'Estañón', 1, N'Blaser', 1, 186, 186, 19241, 0.0096668572319526, 9.2666493425497638, 6.6776716386882171, 9.2666493425497638, 6.6776716386882171, 195.26664934254976, 192.67767163868822, 201.94432098123798)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (17, 85, 8, N'11735-02-0019', N'Synergy 735', 1002, N'Cuarto', 1, N'Blaser', 2, 215, 430, 19241, 0.022348110805051714, 21.422899017722575, 15.437627981913622, 10.711449508861287, 7.7188139909568108, 440.71144950886128, 437.71881399095679, 448.43026349981812)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (18, 85, 9, N'65018700062', N'ECOCOOL SYN 2175', 1, N'Cubeta', 2, N'Fuchs', 1, 1425, 1425, 9475, 0.15039577836411611, 0, 0, 0, 0, 1425, 1425, 1425)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (19, 85, 10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 9475, 0.84960422163588389, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (20, 86, 10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 8050, 1, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (21, 86, 1, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 15186, 0.98775187672856579, 946.85894903200324, 682.3192414065586, 94.685894903200321, 68.231924140655863, 15094.685894903201, 15068.231924140657, 15162.917819043856)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (22, 86, 7, N'11905-04-0019', N'Synergy 905', 13, N'Estañón', 1, N'Blaser', 1, 186, 186, 15186, 0.012248123271434215, 11.74105096799684, 8.4607585934413265, 11.74105096799684, 8.4607585934413265, 197.74105096799684, 194.46075859344131, 206.20180956143815)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (23, 87, 7, N'11905-04-0019', N'Synergy 905', 13, N'Estañón', 1, N'Blaser', 1, 186, 186, 2186, 0.085086916742909427, 81.564318389752984, 58.776340347666974, 81.564318389752984, 58.776340347666974, 267.564318389753, 244.77634034766697, 326.34065873742)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (24, 87, 10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 8050, 1, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (25, 87, 5, N'02850-05-0208', N'Vasco 5000', 1, N'Cubeta', 1, N'Blaser', 1, 2000, 2000, 2186, 0.91491308325709053, 877.035681610247, 632.003659652333, 877.035681610247, 632.003659652333, 2877.0356816102471, 2632.0036596523332, 3509.03934126258)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1023, 1087, 6, N'11905-04-0208', N'Synergy 905', 1, N'Cubeta', 1, N'Blaser', 1, 1625, 1625, 16625, 0.097744360902255634, 93.697744360902249, 67.519849624060143, 93.697744360902249, 67.519849624060143, 1718.6977443609023, 1692.51984962406, 1786.2175939849624)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1024, 1087, 10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 8050, 1, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1025, 1087, 12, N'NJT500C', N'NJT500C 75Hz', 2, N'Tubo', 15, N'Next Jem', 4, 475, 1900, 1900, 1, 100, 0, 25, 0, 1925, 1900, 1925)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1026, 1087, 1, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 16625, 0.90225563909774431, 864.90225563909769, 623.26015037593982, 86.490225563909775, 62.326015037593983, 15086.49022556391, 15062.326015037594, 15148.816240601504)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1027, 1088, 13, N'NJT600', N'Next Jem 600ML', 13, N'Estañón', 15, N'Next Jem', 4, 420, 1680, 1680, 1, 100, 0, 25, 0, 1705, 1680, 1705)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1028, 1088, 7, N'11905-04-0019', N'Synergy 905', 13, N'Estañón', 1, N'Blaser', 1, 186, 186, 616, 0.30194805194805197, 289.44740259740263, 208.57967532467532, 289.44740259740263, 208.57967532467532, 475.44740259740263, 394.57967532467535, 684.027077922078)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1029, 1088, 8, N'11735-02-0019', N'Synergy 735', 1002, N'Cuarto', 1, N'Blaser', 2, 215, 430, 616, 0.698051948051948, 669.15259740259739, 482.20032467532462, 334.5762987012987, 241.10016233766231, 764.5762987012987, 671.10016233766237, 1005.676461038961)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1030, 1088, 10, N'PLANTOHYD 40 N', N'PLANTOHYD 40 N', 2, N'Tubo', 2, N'Fuchs', 10, 805, 8050, 9475, 0.84960422163588389, 0, 0, 0, 0, 8050, 8050, 8050)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1031, 1088, 9, N'65018700062', N'ECOCOOL SYN 2175', 1, N'Cubeta', 2, N'Fuchs', 1, 1425, 1425, 9475, 0.15039577836411611, 0, 0, 0, 0, 1425, 1425, 1425)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1032, 1089, 11, N'NJT1500C', N'NJT1500C 60Hz', 1002, N'Cuarto', 15, N'Next Jem', 4, 475, 1900, 1900, 1, 100, 0, 25, 0, 1925, 1900, 1925)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1033, 1089, 1, N'02904-04-0208', N'Vascomil 22', 1, N'Cubeta', 1, N'Blaser', 10, 1500, 15000, 16625, 0.90225563909774431, 864.90225563909769, 623.26015037593982, 86.490225563909775, 62.326015037593983, 15086.49022556391, 15062.326015037594, 15148.816240601504)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1034, 1089, 6, N'11905-04-0208', N'Synergy 905', 1, N'Cubeta', 1, N'Blaser', 1, 1625, 1625, 16625, 0.097744360902255634, 93.697744360902249, 67.519849624060143, 93.697744360902249, 67.519849624060143, 1718.6977443609023, 1692.51984962406, 1786.2175939849624)
INSERT [dbo].[Costo_ConceptoAux] ([Id_Costo_Concepto_AUX], [Id_Costo], [Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Id_Presentacion], [Nombre_Presentacion], [Id_proveedor], [Nombre_Proveedor], [Unidades_Articulos], [Costo_Por_Unidad_Dolares], [Costo_Total_Dolares], [Total_Costo_Dolares], [ProbCostoTotalCompra], [DistCostoMaritimo], [DistCostoTerrestre], [MontoCostoPorArticuloMar], [MontoCostoPorArticuloTer], [Total_CosteoPorArticuloMar], [Total_CosteoPorArticuloTer], [Total_CosteoTotal]) VALUES (1035, 1089, 14, N'1195-202-550ML', N'PLANTOHYD 60ML', 13, N'Estañón', 2, N'Fuchs', 10, 750, 7500, 7500, 1, 0, 0, 0, 0, 7500, 7500, 7500)
SET IDENTITY_INSERT [dbo].[Costo_ConceptoAux] OFF
GO
SET IDENTITY_INSERT [dbo].[Costos] ON 

INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (74, 1010, N'1010', CAST(1010.10 AS Decimal(18, 2)), CAST(N'2021-05-13T20:47:02.850' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (76, 1022, N'123123', CAST(1231.23 AS Decimal(18, 2)), CAST(N'2021-05-13T21:22:16.840' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (77, 101, N'01.1011', CAST(4.40 AS Decimal(18, 2)), CAST(N'2021-05-26T20:50:53.873' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (78, 0, N'423432', CAST(4120.42 AS Decimal(18, 2)), CAST(N'2021-05-26T20:54:30.620' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (79, 4523, N'454123', CAST(452.43 AS Decimal(18, 2)), CAST(N'2021-05-26T21:01:20.677' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (80, 1041, N'4011', CAST(4104.10 AS Decimal(18, 2)), CAST(N'2021-05-26T21:03:12.847' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (81, 1041, N'4011', CAST(4104.10 AS Decimal(18, 2)), CAST(N'2021-05-26T21:04:23.367' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (82, 412, N'42525', CAST(4.52 AS Decimal(18, 2)), CAST(N'2021-05-26T21:14:05.693' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (83, 412, N'42525', CAST(4.52 AS Decimal(18, 2)), CAST(N'2021-05-26T21:14:54.077' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (84, 10, N'10', CAST(101.01 AS Decimal(18, 2)), CAST(N'2021-05-26T21:15:21.587' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (85, 46452, N'10042', CAST(4124.12 AS Decimal(18, 2)), CAST(N'2021-05-26T21:16:02.627' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (86, 14578, N'005-2020-157782', CAST(520.00 AS Decimal(18, 2)), CAST(N'2021-06-07T21:18:36.760' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (87, 50, N'004-2021-168435', CAST(520.00 AS Decimal(18, 2)), CAST(N'2021-06-25T20:31:47.563' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (1087, 3, N'004-2021-15803', CAST(600.00 AS Decimal(18, 2)), CAST(N'2021-07-12T11:43:51.703' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (1088, 2, N'008-2021-14558', CAST(600.00 AS Decimal(18, 2)), CAST(N'2021-07-12T12:01:33.217' AS DateTime))
INSERT [dbo].[Costos] ([Id_Costo], [Numero_Costos], [DUA], [Tipo_De_Cambio], [Fecha_Creacion]) VALUES (1089, 5, N'2021-07-121030', CAST(590.00 AS Decimal(18, 2)), CAST(N'2021-07-12T10:33:13.940' AS DateTime))
SET IDENTITY_INSERT [dbo].[Costos] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado_Usuario] ON 

INSERT [dbo].[Estado_Usuario] ([Id_Estado_Usuario], [Desc_Estado_Usuario]) VALUES (1, N'Activo')
INSERT [dbo].[Estado_Usuario] ([Id_Estado_Usuario], [Desc_Estado_Usuario]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[Estado_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais], [Sigla_Pais], [Moneda_Pais]) VALUES (1, N'Costa Rica', N'CRC', N'Colon')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais], [Sigla_Pais], [Moneda_Pais]) VALUES (2, N'Estados Unidos', N'USA', N'dolar')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais], [Sigla_Pais], [Moneda_Pais]) VALUES (11, N'China', N'CHI', N'Yuan')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais], [Sigla_Pais], [Moneda_Pais]) VALUES (1027, N'Corea del Sur', N'KOR', N'Won')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais], [Sigla_Pais], [Moneda_Pais]) VALUES (1029, N'Japón', N'JPN', N'Yen')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentaciones] ON 

INSERT [dbo].[Presentaciones] ([Id_Presentacion], [Nombre_Presentacion]) VALUES (1, N'Cubeta')
INSERT [dbo].[Presentaciones] ([Id_Presentacion], [Nombre_Presentacion]) VALUES (2, N'Tubo')
INSERT [dbo].[Presentaciones] ([Id_Presentacion], [Nombre_Presentacion]) VALUES (13, N'Estañón')
INSERT [dbo].[Presentaciones] ([Id_Presentacion], [Nombre_Presentacion]) VALUES (1002, N'Cuarto')
SET IDENTITY_INSERT [dbo].[Presentaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id_Proveedor], [Codigo_Proveedor], [Nombre_Proveedor], [Id_Pais], [Tiene_Costo_Maritimo], [Costo_Maritimo], [Tiene_Costo_Terrestre], [Costo_Terrestre]) VALUES (1, N'370', N'Blaser', 1, N'SI', CAST(958.60 AS Decimal(18, 2)), N'SI', CAST(690.78 AS Decimal(18, 2)))
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Codigo_Proveedor], [Nombre_Proveedor], [Id_Pais], [Tiene_Costo_Maritimo], [Costo_Maritimo], [Tiene_Costo_Terrestre], [Costo_Terrestre]) VALUES (2, N'371', N'Fuchs', 2, N'NO', CAST(0.00 AS Decimal(18, 2)), N'NO', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Codigo_Proveedor], [Nombre_Proveedor], [Id_Pais], [Tiene_Costo_Maritimo], [Costo_Maritimo], [Tiene_Costo_Terrestre], [Costo_Terrestre]) VALUES (15, N'12', N'Next Jem', 1, N'SI', CAST(100.00 AS Decimal(18, 2)), N'NO', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] ON 

INSERT [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario], [Desc_Tipo_Usuario]) VALUES (1, N'Administrador')
INSERT [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario], [Desc_Tipo_Usuario]) VALUES (2, N'Consultor')
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre_Completo], [Correo_Electronico], [Contrasena_Usuario], [Id_Tipo_Usuario], [Id_Estado_Usuario], [Token_Recovery]) VALUES (2, N'Angel Vega Cordero', N'andresvegacordero007@gmail.com', N'1', 1, 1, N'a21460ad25d731c32b9190edefcb1bcdc3441a44b1b71cf1cdc1c12ed8ce305e')
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre_Completo], [Correo_Electronico], [Contrasena_Usuario], [Id_Tipo_Usuario], [Id_Estado_Usuario], [Token_Recovery]) VALUES (12, N'demo', N'abc@gmail.com', N'000', 2, 1, NULL)
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre_Completo], [Correo_Electronico], [Contrasena_Usuario], [Id_Tipo_Usuario], [Id_Estado_Usuario], [Token_Recovery]) VALUES (13, N'MARÍA', N'elsa0000001@gmail.com', N'000', 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Presentaciones] FOREIGN KEY([Id_Presentacion])
REFERENCES [dbo].[Presentaciones] ([Id_Presentacion])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Presentaciones]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Proveedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Proveedores]
GO
ALTER TABLE [dbo].[Costo_ConceptoAux]  WITH CHECK ADD  CONSTRAINT [FK_Costo_ConceptoAux_Costos] FOREIGN KEY([Id_Costo])
REFERENCES [dbo].[Costos] ([Id_Costo])
GO
ALTER TABLE [dbo].[Costo_ConceptoAux] CHECK CONSTRAINT [FK_Costo_ConceptoAux_Costos]
GO
ALTER TABLE [dbo].[Costo_ConceptoAux]  WITH CHECK ADD  CONSTRAINT [FK_Costo_ConceptoAux_Presentaciones] FOREIGN KEY([Id_Presentacion])
REFERENCES [dbo].[Presentaciones] ([Id_Presentacion])
GO
ALTER TABLE [dbo].[Costo_ConceptoAux] CHECK CONSTRAINT [FK_Costo_ConceptoAux_Presentaciones]
GO
ALTER TABLE [dbo].[Costo_ConceptoAux]  WITH CHECK ADD  CONSTRAINT [FK_Costo_ConceptoAux_Proveedores] FOREIGN KEY([Id_proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Costo_ConceptoAux] CHECK CONSTRAINT [FK_Costo_ConceptoAux_Proveedores]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Paises] FOREIGN KEY([Id_Pais])
REFERENCES [dbo].[Paises] ([Id_Pais])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Paises]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Estado_Usuario] FOREIGN KEY([Id_Estado_Usuario])
REFERENCES [dbo].[Estado_Usuario] ([Id_Estado_Usuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Estado_Usuario]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_Usuario] FOREIGN KEY([Id_Tipo_Usuario])
REFERENCES [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarTokenRecuperacionPass]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_ActualizarTokenRecuperacionPass]
	-- Add the parameters for the stored procedure here
	@Correo_Electronico varchar(200),
	@Token varchar(200)
AS
BEGIN
	UPDATE Usuarios
	SET Token_Recovery = @Token
	where Correo_Electronico = @Correo_Electronico
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Articulos_ExisteArticulosCodigo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Articulos_ExisteArticulosCodigo]
	-- Add the parameters for the stored procedure here
	@Codigo_Articulo varchar(200)
AS
BEGIN
	SELECT art.Id_Articulo, art.Codigo_Articulo, art.Nombre_Articulo, art.Descripcion_Articulo,art.Cantidad_Articulo, art.Costo_Articulo, art.Costo_Anterior_Articulo,pro.Id_Proveedor ,pro.Nombre_Proveedor, pre.Id_Presentacion,pre.Nombre_Presentacion
	FROM Articulos art
	INNER JOIN Presentaciones pre 
	ON art.Id_Presentacion = pre.Id_Presentacion 
	INNER JOIN Proveedores pro 
	ON art.Id_Proveedor = pro.Id_Proveedor
	WHERE Codigo_Articulo = @Codigo_Articulo

END
GO
/****** Object:  StoredProcedure [dbo].[pa_Articulos_Insert]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,27 dic 2020>
-- Description:	<Description,,Insert de articulos>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Articulos_Insert]
	-- Add the parameters for the stored procedure here
	@Codigo_Articulo varchar(200),
	@Nombre_Articulo varchar(200),
	@Descripcion_Articulo varchar(200),
	@Cantidad_Articulo int,
	@Costo_Articulo float,
	@Costo_Anterior_Articulo float,
	@Id_Proveedor int,
	@Id_Presentacion int
AS
BEGIN
	INSERT INTO Articulos (Codigo_Articulo,Nombre_Articulo,Descripcion_Articulo,Cantidad_Articulo,Costo_Articulo,Costo_Anterior_Articulo,Id_Proveedor,Id_Presentacion)
	VALUES (@Codigo_Articulo,@Nombre_Articulo,@Descripcion_Articulo,@Cantidad_Articulo,@Costo_Articulo,@Costo_Anterior_Articulo,@Id_Proveedor,@Id_Presentacion);
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Articulos_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,25 dic 2020,>
-- Description:	<Description,,Lista de artículos>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Articulos_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT art.Id_Articulo, art.Codigo_Articulo, art.Nombre_Articulo, art.Descripcion_Articulo,art.Cantidad_Articulo ,art.Costo_Articulo, art.Costo_Anterior_Articulo,pro.Id_Proveedor ,pro.Nombre_Proveedor, pre.Id_Presentacion,pre.Nombre_Presentacion
	FROM Articulos art
	INNER JOIN Presentaciones pre 
	ON art.Id_Presentacion = pre.Id_Presentacion 
	INNER JOIN Proveedores pro 
	ON art.Id_Proveedor = pro.Id_Proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Articulos_Update]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,27 dic 2020>
-- Description:	<Description,,Update de articulos>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Articulos_Update]
	-- Add the parameters for the stored procedure here
	@Id_Articulo int,
	@Codigo_Articulo varchar(200),
	@Nombre_Articulo varchar(200),
	@Descripcion_Articulo varchar(200),
	@Cantidad_Articulo int,
	@Costo_Articulo float,
	@Id_Proveedor int,
	@Id_Presentacion int
AS
BEGIN
	UPDATE Articulos
	SET Codigo_Articulo = @Codigo_Articulo,
		Nombre_Articulo = @Nombre_Articulo,
		Descripcion_Articulo = @Descripcion_Articulo,
		Cantidad_Articulo = @Cantidad_Articulo,
		Costo_Articulo = @Costo_Articulo,
		Id_Proveedor =  @Id_Proveedor,
		Id_Presentacion = @Id_Presentacion
	WHERE Id_Articulo = @Id_Articulo
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Articulos_Update_CostoAnterior]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,27 dic 2020>
-- Description:	<Description,,Update de articulos>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Articulos_Update_CostoAnterior]
	-- Add the parameters for the stored procedure here
	@Id_Articulo int,
	@Costo_Articulo float
AS
BEGIN
	UPDATE Articulos
	SET Costo_Anterior_Articulo =  @Costo_Articulo
	WHERE Id_Articulo = @Id_Articulo
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ArticulosRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,27 dic 2020>
-- Description:	<Description,,Retorna los id de la tabla articulos>
-- =============================================
CREATE PROCEDURE [dbo].[pa_ArticulosRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Articulo int
AS
BEGIN
	SELECT art.Id_Articulo, art.Codigo_Articulo, art.Nombre_Articulo, art.Descripcion_Articulo,art.Cantidad_Articulo, art.Costo_Articulo, art.Costo_Anterior_Articulo,pro.Id_Proveedor ,pro.Nombre_Proveedor, pre.Id_Presentacion,pre.Nombre_Presentacion
	FROM Articulos art
	INNER JOIN Presentaciones pre 
	ON art.Id_Presentacion = pre.Id_Presentacion 
	INNER JOIN Proveedores pro 
	ON art.Id_Proveedor = pro.Id_Proveedor
	where art.Id_Articulo = @Id_Articulo
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoMontoMaritimo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pa_CosteoMontoMaritimo]
	-- Add the parameters for the stored procedure here
	@MontoCosteoPorArticulo float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET MontoCostoPorArticuloMar = @MontoCosteoPorArticulo
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoMontoTerrestre]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CosteoMontoTerrestre]

	-- Add the parameters for the stored procedure here
	@MontoCosteoPorArticuloTer float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET MontoCostoPorArticuloTer = @MontoCosteoPorArticuloTer
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoMontoTotal]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CosteoMontoTotal]
	-- Add the parameters for the stored procedure here
	@Total_Costeo float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET Total_CosteoTotal = @Total_Costeo
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoMontoTotal_CosteoPorArticuloMar]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CosteoMontoTotal_CosteoPorArticuloMar]

	-- Add the parameters for the stored procedure here
	@Total_CosteoPorArticuloMar float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET Total_CosteoPorArticuloMar = @Total_CosteoPorArticuloMar
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoMontoTotal_CosteoPorArticuloTer]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CosteoMontoTotal_CosteoPorArticuloTer]

	-- Add the parameters for the stored procedure here
	@Total_CosteoPorArticuloTer float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET Total_CosteoPorArticuloTer = @Total_CosteoPorArticuloTer
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CosteoRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CosteoRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Costo_Concepto_AUX INT 
AS
BEGIN
	SELECT aux.Id_Costo_Concepto_AUX,aux.Id_Costo,aux.Codigo_Articulo,aux.Nombre_Articulo ,aux.Id_Presentacion,aux.Nombre_Presentacion,aux.Id_proveedor,aux.Nombre_Proveedor,aux.Unidades_Articulos,aux.Costo_Por_Unidad_Dolares,aux.Costo_Total_Dolares,aux.Total_Costo_Dolares,aux.ProbCostoTotalCompra,aux.DistCostoMaritimo,aux.MontoCostoPorArticuloMar,aux.DistCostoTerrestre,aux.MontoCostoPorArticuloTer,pro.Tiene_Costo_Maritimo, pro.Costo_Maritimo, pro.Tiene_Costo_Terrestre, pro.Costo_Terrestre
	FROM Costo_ConceptoAux aux
	INNER JOIN Proveedores pro
	ON aux.Id_proveedor = pro.Id_Proveedor
	where Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Costo_ConceptoAux]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,angel>
-- Create date: <Create Date,,03/05/2021>
-- Description:	<Description,,insert de auxiliar para no tratar de usar la tabla original>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Costo_ConceptoAux]
	-- Add the parameters for the stored procedure here 
	@id_costo int ,
	@id_articulo int,
	@codigo_articulo varchar(200),
	@nombre_articulo varchar(200),
	@id_presentacion int,
	@nombre_presentacion varchar(200),
	@id_proveedor int ,
	@nombre_proveedor varchar(200),
	@unidades_articulos float,
	@costo_por_unidad_dolares float,
	@total_costo_dolares float
AS
BEGIN
	INSERT INTO Costo_ConceptoAux
           (Id_Costo
		   ,Id_Articulo
           ,Codigo_Articulo
           ,Nombre_Articulo
		   ,Id_Presentacion
           ,Nombre_Presentacion
		   ,Id_proveedor
		   ,Nombre_Proveedor
           ,Unidades_Articulos
           ,Costo_Por_Unidad_Dolares
           ,Costo_Total_Dolares)
     VALUES
           (@id_costo,
		   @id_articulo
           ,@codigo_articulo
           ,@nombre_articulo
		   ,@id_presentacion
           ,@nombre_presentacion
		   ,@id_proveedor
		   ,@nombre_proveedor
           ,@unidades_articulos
           ,@costo_por_unidad_dolares
           ,@total_costo_dolares);
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoAUX_OrdenarProveedor]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoAUX_OrdenarProveedor]
	-- Add the parameters for the stored procedure here
	@Id_Costeo int
AS
BEGIN
	SELECT Id_Costo_Concepto_AUX, Id_Costo, Codigo_Articulo, Nombre_Articulo, Id_Presentacion, Nombre_Presentacion, Id_proveedor, Nombre_Proveedor, Unidades_Articulos, Costo_Por_Unidad_Dolares, Costo_Total_Dolares, Total_Costo_Dolares,ProbCostoTotalCompra,DistCostoMaritimo,DistCostoTerrestre
	FROM dbo.Costo_ConceptoAux
	WHERE Id_Costo = @Id_Costeo
	order by Nombre_Proveedor desc
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoContarProveedor]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoContarProveedor]
	-- Add the parameters for the stored procedure here
	@id_costo int
AS
BEGIN
	Select Nombre_Proveedor,COUNT( Nombre_Proveedor) as 'Articulos',SUM(Costo_Total_Dolares) as 'CostoTotalporProveedor'
	FROM Costo_ConceptoAux
	where Id_Costo = @id_costo
	group by Nombre_Proveedor
	order by Nombre_Proveedor desc
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoDistCostoMaritimoUpdate]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoDistCostoMaritimoUpdate]
	@DistCostoMaritimo float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET DistCostoMaritimo = @DistCostoMaritimo
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoDistCostoTerrestreUpdate]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoDistCostoTerrestreUpdate]
	@DistCostoTerrestre float,
	@Id_Costo_Concepto_AUX int 
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET DistCostoTerrestre = @DistCostoTerrestre
	WHERE Id_Costo_Concepto_AUX = @Id_Costo_Concepto_AUX
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoObtenerImpuestos]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoObtenerImpuestos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT Codigo_Proveedor,Nombre_Proveedor,Tiene_Costo_Maritimo,Costo_Maritimo,Tiene_Costo_Terrestre,Costo_Terrestre
	FROM Proveedores
	
END
GO
/****** Object:  StoredProcedure [dbo].[pa_CostoProbUpdate]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CostoProbUpdate]
	@id_costo int,
	@id_costo_concepto_aux int,
	@nombre_proveedor varchar(200),
	@ProbCostoTotalCompra float
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET  ProbCostoTotalCompra = @ProbCostoTotalCompra
	WHERE Id_Costo = @id_costo
	AND Nombre_Proveedor = @nombre_proveedor
	AND Id_Costo_Concepto_AUX = @id_costo_concepto_aux;
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Costos_BusquedaCodigoArt]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Angel Vega Cordero
-- Create date: 22/03/2021
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[pa_Costos_BusquedaCodigoArt]
	-- Add the parameters for the stored procedure here
	@Codigo_Articulo varchar(200)
AS
BEGIN
	SELECT art.Id_Articulo, art.Codigo_Articulo, art.Nombre_Articulo,art.Cantidad_Articulo,art.Id_Presentacion, pre.Nombre_Presentacion, pro.Id_Proveedor,pro.Nombre_Proveedor, art.Costo_Articulo
	FROM Articulos art 
	INNER JOIN Presentaciones pre 
	ON art.Id_Presentacion = pre.Id_Presentacion 
	INNER JOIN Proveedores pro 
	ON art.Id_Proveedor = pro.Id_Proveedor
	WHERE art.Codigo_Articulo like '%'+@Codigo_Articulo+'%';
END




GO
/****** Object:  StoredProcedure [dbo].[pa_CrearRespaldo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_CrearRespaldo]
    
AS
BEGIN
 
--Script 1: Backup specific database

-- 1. Variable declaration

DECLARE @path VARCHAR(500)
DECLARE @name VARCHAR(500)
DECLARE @pathwithname VARCHAR(500)
DECLARE @time DATETIME
DECLARE @year VARCHAR(4)
DECLARE @month VARCHAR(2)
DECLARE @day VARCHAR(2)
DECLARE @hour VARCHAR(2)
DECLARE @minute VARCHAR(2)
DECLARE @second VARCHAR(2)

-- 2. Setting the backup path

SET @path = 'D:\'

-- 3. Getting the time values

SELECT @time   = GETDATE()
SELECT @year   = (SELECT CONVERT(VARCHAR(4), DATEPART(yy, @time)))
SELECT @month  = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(mm,@time),'00')))
SELECT @day    = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(dd,@time),'00')))
SELECT @hour   = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(hh,@time),'00')))
SELECT @minute = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(mi,@time),'00')))
SELECT @second = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(ss,@time),'00')))

-- 4. Defining the filename format

SELECT @name ='LithioBD' + '_' + @year + @month + @day + @hour + @minute + @second

SET @pathwithname = @path + @name + '.bak'

--5. Executing the backup command

BACKUP DATABASE LithioBD 
TO DISK = @pathwithname WITH NOFORMAT, NOINIT, SKIP, REWIND, NOUNLOAD, STATS = 10

END
GO
/****** Object:  StoredProcedure [dbo].[pa_EstadoUsuario_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,Select estado usuario,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_EstadoUsuario_Select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select Id_Estado_Usuario,Desc_Estado_Usuario
	from Estado_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Paises_ExistePais]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,17/1/2021>
-- Description:	<Description,,Procedimieto que verifica si existe algun pais a ingresar>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Paises_ExistePais]
	-- Add the parameters for the stored procedure here
	@NombrePais varchar(200)
AS
BEGIN
	SELECT Id_Pais ,Nombre_Pais,Sigla_Pais,Moneda_Pais
	FROM Paises
	WHERE Nombre_Pais like '%'+@NombrePais+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Paises_Insert]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Author,,Angel Vega>
-- Create date: <Hoy Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Paises_Insert]
	-- Add the parameters for the stored procedure here
	@Nombre_Pais varchar(200),
	@Sigla_Pais varchar(3),
	@Moneda_Pais varchar(200)
AS
BEGIN
	INSERT INTO Paises(Nombre_Pais,Sigla_Pais,Moneda_Pais)
	VALUES(@Nombre_Pais,@Sigla_Pais,@Moneda_Pais)
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Paises_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel Vega>
-- Create date: <Hoy,,>
-- Description:	<Muestra la lista de países,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Paises_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT Id_Pais,Nombre_Pais,Sigla_Pais,Moneda_Pais
	FROM Paises
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Paises_Update]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Fecha Hoy,,>
-- Description:	<UPDATE DE TABLA PAISES,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Paises_Update]
	-- Add the parameters for the stored procedure here
	@Id_Pais int,
	@Nombre_Pais varchar(200),
	@Sigla_Pais varchar(200),
	@Moneda_Pais varchar(200)
AS
BEGIN
	UPDATE PAISES
	SET Nombre_Pais = @Nombre_Pais,
		Sigla_Pais = @Sigla_Pais,
		Moneda_Pais = @Moneda_Pais
		WHERE Id_Pais = @Id_Pais
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PaisesRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Hoy,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_PaisesRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Pais int
AS
BEGIN
	SELECT Id_Pais ,Nombre_Pais,Sigla_Pais,Moneda_Pais
	FROM Paises
	WHERE Id_Pais = @Id_Pais
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Permisos_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel Vega Cordero>
-- Create date: <Create Date,,30 nov 2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Permisos_Select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT Usu.Id_Usuario, Usu.Nombre_Completo, Usu.Id_Tipo_Usuario, Tip.Desc_Tipo_Usuario, Usu.Id_Estado_Usuario,Est.Desc_Estado_Usuario
	FROM Estado_Usuario Est 
	INNER JOIN Usuarios Usu 
	ON Est.Id_Estado_Usuario = Usu.Id_Estado_Usuario 
	INNER JOIN Tipo_Usuario Tip 
	ON Usu.Id_Tipo_Usuario = Tip.Id_Tipo_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Permisos_Update]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,Update de Permisos,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Permisos_Update]
	-- Add the parameters for the stored procedure here
	@Id_Usuario int,
	@Id_Estado_Usuario int,
	@Id_Tipo_Usuario int
AS
BEGIN
	UPDATE Usuarios
	SET Id_Tipo_Usuario = @Id_Tipo_Usuario,
		Id_Estado_Usuario = @Id_Estado_Usuario
	WHERE Id_Usuario = @Id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PermisosRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,Retorna los permisos de los usuarios,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_PermisosRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Usuario int 
AS
BEGIN
	SELECT Usu.Id_Usuario, Usu.Nombre_Completo, Usu.Id_Tipo_Usuario, Tip.Desc_Tipo_Usuario, Usu.Id_Estado_Usuario,Est.Desc_Estado_Usuario
	FROM Estado_Usuario Est 
	INNER JOIN Usuarios Usu 
	ON Est.Id_Estado_Usuario = Usu.Id_Estado_Usuario 
	INNER JOIN Tipo_Usuario Tip 
	ON Usu.Id_Tipo_Usuario = Tip.Id_Tipo_Usuario
	WHERE Usu.Id_Usuario = @Id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Presentaciones_ExistePresentacion]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Presentaciones_ExistePresentacion]
	-- Add the parameters for the stored procedure here
	@Nombre_Presentacion varchar(200)
AS
BEGIN
	SELECT Id_Presentacion,Nombre_Presentacion
	FROM PRESENTACIONES
	WHERE Nombre_Presentacion like '%' +@Nombre_Presentacion + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Presentaciones_Insert]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_Presentaciones_Insert]
	-- Add the parameters for the stored procedure here
	@Nombre_Presentacion varchar(200)
AS
BEGIN
	INSERT INTO PRESENTACIONES (Nombre_Presentacion) VALUES (@Nombre_Presentacion);
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Presentaciones_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_Presentaciones_Select]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	SELECT Id_Presentacion,Nombre_Presentacion
	FROM Presentaciones
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Presentaciones_Update]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_Presentaciones_Update]
	-- Add the parameters for the stored procedure here
	@Id_Presentacion int,
	@Nombre_Presentacion varchar(200)
AS
BEGIN
	UPDATE PRESENTACIONES
	SET  Nombre_Presentacion = @Nombre_Presentacion
	WHERE Id_Presentacion = @Id_Presentacion
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PresentacionesRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_PresentacionesRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Presentacion int
AS
BEGIN
	SELECT Id_Presentacion,Nombre_Presentacion
	FROM PRESENTACIONES
	WHERE Id_Presentacion = @Id_Presentacion
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Proveedores_ExisteProveedor]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Proveedores_ExisteProveedor]
	-- Add the parameters for the stored procedure here
	@Codigo_Proveedor varchar(200),
	@Nombre_Proveedor varchar(200)
AS
BEGIN
	SELECT Id_Proveedor, Codigo_Proveedor, Nombre_Proveedor,Id_Pais
	FROM PROVEEDORES
	WHERE Codigo_Proveedor = @Codigo_Proveedor
	or Nombre_Proveedor = @Nombre_Proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Proveedores_Insert]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create 9 Nov 2020,,>
-- Description:	<Description,,Insert de proveedores>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Proveedores_Insert]
	-- Add the parameters for the stored procedure here
	@Nombre_Proveedor varchar(200),
	@Codigo_Proveedor varchar(200),
	@Id_Pais int,
	@Tiene_Costo_Maritimo varchar(2),
	@Costo_Maritimo decimal (18,2),
	@Tiene_Costo_Terrestre varchar(2),
	@Costo_Terrestre decimal (18,2)


AS
BEGIN
	INSERT INTO Proveedores (Codigo_Proveedor,Nombre_Proveedor,Id_Pais,Tiene_Costo_Maritimo,Costo_Maritimo,Tiene_Costo_Terrestre,Costo_Terrestre)
	VALUES (@Codigo_Proveedor,@Nombre_Proveedor,@Id_Pais,@Tiene_Costo_Maritimo, @Costo_Maritimo,@Tiene_Costo_Terrestre,@Costo_Terrestre);
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Proveedores_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create 9 Nov 2020,,>
-- Description:	<Description,,Select de proveedores>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Proveedores_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT Pro.Id_Proveedor, Pro.Codigo_Proveedor, Pro.Nombre_Proveedor,Pa.Id_Pais, Pa.Nombre_Pais, Pro.Tiene_Costo_Maritimo, Pro.Costo_Maritimo,Pro.Tiene_Costo_Terrestre,Pro.Costo_Terrestre
	FROM Paises Pa 
	INNER JOIN Proveedores Pro
	ON Pa.Id_Pais = Pro.Id_Pais
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Proveedores_Update]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_Proveedores_Update]
	-- Add the parameters for the stored procedure here
	@Id_Proveedor int,
	@Codigo_Proveedor varchar(200),
	@Nombre_Proveedor varchar(200),
	@Id_Pais int,
    @Tiene_Costo_Maritimo varchar(2),
	@Costo_Maritimo decimal (18,2),
	@Tiene_Costo_Terrestre varchar(2),
	@Costo_Terrestre decimal (18,2)
AS
BEGIN
	UPDATE Proveedores
	SET Codigo_Proveedor = @Codigo_Proveedor,
		Nombre_Proveedor = @Nombre_Proveedor,
		Id_Pais = @Id_Pais,
		Tiene_Costo_Maritimo = @Tiene_Costo_Maritimo,
		Costo_Maritimo = @Costo_Maritimo,
		Tiene_Costo_Terrestre = @Tiene_Costo_Terrestre,
		Costo_Terrestre = @Costo_Terrestre
		WHERE Id_Proveedor = @Id_Proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ProveedoresRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel Vega>
-- Create date: <Create Date,,9 Nov 2020>
-- Description:	<Description,,Devuelve el registro que tenga el Id proveedor correspondiente>
-- =============================================
CREATE PROCEDURE [dbo].[pa_ProveedoresRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Proveedor int
AS
BEGIN
	SELECT Id_Proveedor, Codigo_Proveedor, Nombre_Proveedor,Id_Pais,Tiene_Costo_Maritimo, Costo_Maritimo,Tiene_Costo_Terrestre,Costo_Terrestre
	FROM PROVEEDORES
	WHERE Id_Proveedor = @Id_Proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ReporteListaCosteo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ReporteListaCosteo]
	-- Add the parameters for the stored procedure here
	@Numero_Costeo int=null,
	@DUA varchar(200) =null,
	@FechaInicial datetime, 
	@FechaFinal datetime
AS
BEGIN
	SELECT Cost.Id_Costo,
		   Cost.Numero_Costos,
		   Cost.DUA,
		   Cost.Tipo_De_Cambio, 
		   Caux.Codigo_Articulo,
		   Caux.Nombre_Articulo,
		   Caux.Nombre_Presentacion, 
           Caux.Nombre_Proveedor, 
		   Caux.Unidades_Articulos, 
		   Caux.Costo_Por_Unidad_Dolares, 
		   Caux.Costo_Total_Dolares, 
           Caux.Total_Costo_Dolares,
		   Caux.ProbCostoTotalCompra, 
		   Caux.DistCostoMaritimo, 
		   Caux.DistCostoTerrestre, 
           Caux.MontoCostoPorArticuloMar,
		   Caux.MontoCostoPorArticuloTer, 
		   Caux.Total_CosteoPorArticuloMar, 
		   Caux.Total_CosteoPorArticuloTer, 
           Caux.Total_CosteoTotal, 
		   Cost.Fecha_Creacion
	FROM Costo_ConceptoAux Caux
	INNER JOIN Costos Cost
	ON Caux.Id_Costo = Cost.Id_Costo
	WHERE Cost.Numero_Costos = (case when @Numero_Costeo is null then Cost.Numero_Costos else @Numero_Costeo end)
	and DUA like (case when @DUA is null then '%%' else '%' + @DUA + '%' end)
	and Cost.Fecha_Creacion between @FechaInicial and @FechaFinal
END

GO
/****** Object:  StoredProcedure [dbo].[pa_RetornaArticulosAC]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,25 dic 2020,>
-- Description:	<Description,,Lista de artículos para crear el autocomplete>
-- =============================================
CREATE PROCEDURE [dbo].[pa_RetornaArticulosAC]
	-- Add the parameters for the stored procedure here
	@Codigo_Articulo varchar(200) 
AS
BEGIN
	SELECT art.Id_Articulo, art.Codigo_Articulo
	FROM Articulos art
	INNER JOIN Presentaciones pre 
	ON art.Id_Presentacion = pre.Id_Presentacion 
	INNER JOIN Proveedores pro 
	ON art.Id_Proveedor = pro.Id_Proveedor
	WHERE art.Codigo_Articulo like (case when @Codigo_Articulo is null then '%%' else '%'+@Codigo_Articulo+'%' end)
END
GO
/****** Object:  StoredProcedure [dbo].[pa_RetornaUsuarioCorreoPwd_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_RetornaUsuarioCorreoPwd_Select]
	-- Add the parameters for the stored procedure here
	@Correo varchar(200),
	@Contrasena varchar(200)
AS
BEGIN
	SELECT USU.Id_Usuario, USU.Nombre_Completo, USU.Correo_Electronico, USU.Contrasena_Usuario, USU.Id_Tipo_Usuario, 
                         TIP.Desc_Tipo_Usuario, USU.Id_Estado_Usuario, EST.Desc_Estado_Usuario
FROM Estado_Usuario EST 
INNER JOIN Usuarios USU 
ON EST.Id_Estado_Usuario = USU.Id_Estado_Usuario 
INNER JOIN Tipo_Usuario TIP 
ON USU.Id_Tipo_Usuario = TIP.Id_Tipo_Usuario
WHERE USU.Correo_Electronico = @Correo
AND USU.Contrasena_Usuario = @Contrasena


END
GO
/****** Object:  StoredProcedure [dbo].[pa_TipoUsuario_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,Select tipo usuario,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_TipoUsuario_Select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select Id_Tipo_Usuario,Desc_Tipo_Usuario 
	from Tipo_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_updatePrecioFinalLineasCosteo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_updatePrecioFinalLineasCosteo]
	-- Add the parameters for the stored procedure here
	@id_costeo int,
	@nombre_provedor varchar(200),
	@precio_final_articulos float
AS
BEGIN
	UPDATE Costo_ConceptoAux
	SET Total_Costo_Dolares = @precio_final_articulos
	WHERE Id_Costo = @id_costeo
	AND Nombre_Proveedor = @nombre_provedor
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Insert]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,1 Nov 2020>
-- Description:	<Description,,Ingresar registro de usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Usuarios_Insert]
	-- Add the parameters for the stored procedure here
	@Nombre_Completo varchar(200),
	@Correo_Electronico varchar(200),
	@Contrasena_Usuario varchar(200),
	@Id_Tipo_Usuario int,
	@Id_Estado_Usuario int
AS
BEGIN
	INSERT INTO Usuarios (Nombre_Completo,Correo_Electronico,Contrasena_Usuario,Id_Tipo_Usuario,Id_Estado_Usuario)
				  VALUES (@Nombre_Completo,@Correo_Electronico,@Contrasena_Usuario,@Id_Tipo_Usuario,@Id_Estado_Usuario);
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Select]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,,1 nov 2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Usuarios_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT Usu.Id_Usuario, Usu.Nombre_Completo, Tip.Desc_Tipo_Usuario
	FROM Tipo_Usuario AS Tip 
	INNER JOIN Usuarios AS Usu 
	ON Tip.Id_Tipo_Usuario = Usu.Id_Tipo_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_SelectTodo]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel Vega Cordero>
-- Create date: <Create Date,,30 nov 2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_Usuarios_SelectTodo]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	Select Id_Usuario,Nombre_Completo,Correo_Electronico,Contrasena_Usuario
	from usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[pa_UsuariosRetornaID]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,Retorna Usuarios,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_UsuariosRetornaID]
	-- Add the parameters for the stored procedure here
	@Id_Usuario int
AS
BEGIN
	Select Id_Usuario,Nombre_Completo,Correo_Electronico,Contrasena_Usuario
	from usuarios
	WHERE Id_Usuario = @Id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_UsuariosUpdate]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Angel>
-- Create date: <Create Date,13 dic 2020,>
-- Description:	<Description,update de usuarios,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_UsuariosUpdate]
	-- Add the parameters for the stored procedure here
	@Nombre_Completo varchar(200),
	@Correo_Electronico varchar(200),
	@Id_Usuario int
AS
BEGIN
	UPDATE USUARIOS
	SET Nombre_Completo = @Nombre_Completo,
		Correo_Electronico = @Correo_Electronico
	WHERE Id_Usuario = @Id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[pa_VerificarCorreoRecuperacionPass]    Script Date: 14/10/2021 22:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pa_VerificarCorreoRecuperacionPass]
	-- Add the parameters for the stored procedure here
	@Correo_Electronico varchar(200)
AS
BEGIN
	SELECT Id_Usuario,Nombre_Completo,Correo_Electronico
	from usuarios
	where Correo_Electronico = @Correo_Electronico
END
GO
