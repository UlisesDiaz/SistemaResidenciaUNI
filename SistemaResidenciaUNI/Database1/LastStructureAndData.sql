USE [dbResidencia]
GO
/****** Object:  Table [dbo].[TBL_BARRIO]    Script Date: 09/06/2019 19:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_BARRIO](
	[BAR_ID] [int] IDENTITY(1,1) NOT NULL,
	[MUN_ID] [int] NOT NULL,
	[BAR_NOMBRE] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TBL_BARRIO] PRIMARY KEY CLUSTERED 
(
	[BAR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CARRERA]    Script Date: 09/06/2019 19:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CARRERA](
	[CAR_ID] [int] IDENTITY(1,1) NOT NULL,
	[REC_ID] [int] NOT NULL,
	[CAR_DESCRIPCION] [varchar](200) NOT NULL,
	[CAR_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_CARRERA] PRIMARY KEY CLUSTERED 
(
	[CAR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_COMPAÑIA]    Script Date: 09/06/2019 19:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_COMPAÑIA](
	[COM_ID] [int] IDENTITY(1,1) NOT NULL,
	[COM_DESCRIPCION] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_COMPAÑIA] PRIMARY KEY CLUSTERED 
(
	[COM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CORREO]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CORREO](
	[COR_ID] [int] IDENTITY(1,1) NOT NULL,
	[PER_ID] [int] NOT NULL,
	[COR_DEFINICION] [varchar](40) NOT NULL,
	[COR_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_CORREO] PRIMARY KEY CLUSTERED 
(
	[COR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CUARTO]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CUARTO](
	[CUA_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUA_NUMERO] [int] NOT NULL,
	[CUA_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_CUARTO] PRIMARY KEY CLUSTERED 
(
	[CUA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_DEPARTAMENTO]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_DEPARTAMENTO](
	[DEP_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEP_NOMBRE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_DEPARTAMENTO] PRIMARY KEY CLUSTERED 
(
	[DEP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_DIRECCION]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_DIRECCION](
	[DIR_ID] [int] IDENTITY(1,1) NOT NULL,
	[BAR_ID] [int] NOT NULL,
	[PER_ID] [int] NULL,
	[DIR_NO_CASA] [nchar](10) NULL,
	[DIR_DESCRIPCION] [varchar](500) NOT NULL,
	[DIR_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_DIRECCION] PRIMARY KEY CLUSTERED 
(
	[DIR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_ESTADO_CIVIL]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ESTADO_CIVIL](
	[EST_CIV_ID] [int] IDENTITY(1,1) NOT NULL,
	[EST_CIV_DESCRI] [varchar](20) NULL,
 CONSTRAINT [PK_TBL_ESTADOCIVIL] PRIMARY KEY CLUSTERED 
(
	[EST_CIV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_ESTUDIANTE]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ESTUDIANTE](
	[EST_ID] [int] NOT NULL,
	[CAR_ID] [int] NOT NULL,
	[EST_CARNET] [varchar](10) NOT NULL,
	[EST_FECHA_INICIAL] [date] NOT NULL,
	[EST_FECHA_FINAL] [date] NULL,
	[EST_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_ESTUDIANTE_1] PRIMARY KEY CLUSTERED 
(
	[EST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_FRECUENCIA]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_FRECUENCIA](
	[FRE_ID] [int] IDENTITY(1,1) NOT NULL,
	[FRE_DESCRIPCION] [varchar](100) NOT NULL,
	[FRE_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_FRECUENCIA] PRIMARY KEY CLUSTERED 
(
	[FRE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_GENERO]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_GENERO](
	[GEN_ID] [int] IDENTITY(1,1) NOT NULL,
	[GEN_DESCRIPCION] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TBL_GENERO] PRIMARY KEY CLUSTERED 
(
	[GEN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_HIS_ESTUDIANTE_CUARTO]    Script Date: 09/06/2019 19:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO](
	[HIS_EST_CUA_ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_ID] [int] NOT NULL,
	[EST_ID] [int] NOT NULL,
	[CUA_ID] [int] NOT NULL,
	[HIS_EST_CUA_FECHA_INICIAL] [date] NOT NULL,
	[HIS_EST_CUA_FECHA_FINAL] [date] NULL,
	[HIS_EST_CUA_DESRIPCION] [varchar](1000) NULL,
	[HIS_EST_CUA_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_HIS_ESTUDIANTE_CUARTO] PRIMARY KEY CLUSTERED 
(
	[HIS_EST_CUA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO](
	[HIS_EST_REG_ID] [int] IDENTITY(1,1) NOT NULL,
	[EST_ID] [int] NULL,
	[USU_ID] [int] NULL,
	[TIP_MOT_REG_ID] [int] NOT NULL,
	[HIS_EST_REG_FECHA_INICIAL] [date] NOT NULL,
	[HIS_EST_REG_FECHA_FINAL] [date] NOT NULL,
	[HIS_EST_REG_FECHA_ESTIMADA] [date] NULL,
	[HIS_EST_REG_ACTIVO] [bit] NOT NULL,
	[HIS_EST_REG_DESCRIPCION] [varchar](500) NOT NULL,
	[HIS_EST_REG_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_HIS_ESTUDIANTE_REGISTRO] PRIMARY KEY CLUSTERED 
(
	[HIS_EST_REG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_HIS_ROL_ASEO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HIS_ROL_ASEO](
	[HIS_ROL_ASE_ID] [int] IDENTITY(1,1) NOT NULL,
	[ROL_ASE_ID] [int] NOT NULL,
	[USU_ID] [int] NOT NULL,
	[HIS_ROL_ASE_CUMPLE] [bit] NOT NULL,
	[HIS_ROL_ASE_FECHA] [date] NOT NULL,
	[HIS_ROL_ASE_DESCRIPCION] [varchar](1000) NOT NULL,
	[HIS_ROL_ASE_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_HIS_ROL_ASEO] PRIMARY KEY CLUSTERED 
(
	[HIS_ROL_ASE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_MUNICIPIO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_MUNICIPIO](
	[MUN_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEP_ID] [int] NOT NULL,
	[MUN_NOMBRE] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TBL_MUNICIPIO] PRIMARY KEY CLUSTERED 
(
	[MUN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_PER_RELACION]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PER_RELACION](
	[PER_REL_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_PER_REL_ID] [int] NOT NULL,
	[PER_ORIGEN] [int] NOT NULL,
	[PER_DESTINO] [int] NOT NULL,
	[PER_REL_FECHA_INICIAL] [date] NOT NULL,
	[PER_REL_FECHA_FINAL] [date] NULL,
	[PER_REL_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_PER_RELACION] PRIMARY KEY CLUSTERED 
(
	[PER_REL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_PERSONA]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PERSONA](
	[PER_ID] [int] IDENTITY(1,1) NOT NULL,
	[PER_IDENTIFICACION] [varchar](20) NULL,
	[TIP_IDE_ID] [int] NOT NULL,
	[GEN_ID] [int] NOT NULL,
	[PER_PRIMER_NOMBRE] [varchar](50) NOT NULL,
	[PER_SEGUNDO_NOMBRE] [varchar](50) NULL,
	[PER_PRIMER_APELLIDO] [varchar](50) NOT NULL,
	[PER_SEGUNDO_APELLIDO] [varchar](50) NOT NULL,
	[PER_FECHA_NACIMIENTO] [date] NOT NULL,
	[PER_IMAGEN] [image] NULL,
	[PER_ESTADO] [bit] NOT NULL,
	[EST_CIV_ID] [int] NOT NULL,
 CONSTRAINT [PK_TBL_PERSONA] PRIMARY KEY CLUSTERED 
(
	[PER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_RECINTO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RECINTO](
	[REC_ID] [int] IDENTITY(1,1) NOT NULL,
	[REC_DESCRIPCION] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TBL_RECINTO] PRIMARY KEY CLUSTERED 
(
	[REC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_RESPONSABLE]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RESPONSABLE](
	[PER_ID] [int] NOT NULL,
	[TIP_ARE_RES_ID] [int] NOT NULL,
	[RES_FECHA_INICIAL] [date] NOT NULL,
	[RES_FECHA_FINAL] [date] NULL,
	[RES_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_RESPONSABLE_1] PRIMARY KEY CLUSTERED 
(
	[PER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_ROL_ASEO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ROL_ASEO](
	[ROL_ASE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_ASE_ID] [int] NOT NULL,
	[FRE_ID] [int] NOT NULL,
	[EST_ID] [int] NOT NULL,
	[USU_ID] [int] NOT NULL,
	[ROL_ASE_FECHA_INICIAL] [date] NOT NULL,
	[ROL_ASE_FECHA_FINAL] [date] NULL,
	[ROL_ASE_HORA] [time](7) NULL,
	[ROL_ASE_FECHA_DESHABILITADO] [date] NULL,
	[ROL_ASE_DIA] [int] NULL,
	[ROL_ASE_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_ROL_ASEO] PRIMARY KEY CLUSTERED 
(
	[ROL_ASE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TELEFONO]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TELEFONO](
	[TEL_ID] [int] IDENTITY(1,1) NOT NULL,
	[COM_ID] [int] NOT NULL,
	[PER_ID] [int] NOT NULL,
	[TEL_NUMERO] [varchar](50) NOT NULL,
	[TEL_PERSONAL] [bit] NOT NULL,
	[TEL_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_TELEFONO] PRIMARY KEY CLUSTERED 
(
	[TEL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TIP_PER_RELACION]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIP_PER_RELACION](
	[TIP_PER_REL_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_PER_REL_DESCRIPCION] [varchar](100) NOT NULL,
	[TIP_PER_REL_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_TIP_PER_RELACION] PRIMARY KEY CLUSTERED 
(
	[TIP_PER_REL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TIPO_AREA_RESPONSABLE]    Script Date: 09/06/2019 19:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIPO_AREA_RESPONSABLE](
	[TIP_ARE__RES_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_ARE_RES_DESCRIPCION] [varchar](100) NULL,
	[TIP_ARE_RES_ESTADO] [bit] NULL,
 CONSTRAINT [PK_TBL_TIPO_AREA_RESPONSABLE] PRIMARY KEY CLUSTERED 
(
	[TIP_ARE__RES_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TIPO_ASEO]    Script Date: 09/06/2019 19:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIPO_ASEO](
	[TIP_ASE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_ASE_DESCRIPCION] [nvarchar](50) NOT NULL,
	[TIP_ASE_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_TIPO_ASEO] PRIMARY KEY CLUSTERED 
(
	[TIP_ASE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TIPO_IDENTIFICACION]    Script Date: 09/06/2019 19:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIPO_IDENTIFICACION](
	[TIP_IDE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_IDE_DESCRIPCION] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TBL_TIPO_IDENTIFICACION] PRIMARY KEY CLUSTERED 
(
	[TIP_IDE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_TIPO_MOTIVO_REGISTRO]    Script Date: 09/06/2019 19:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIPO_MOTIVO_REGISTRO](
	[TIP_MOT_REG_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_MOT_REG_DESCRIPCION] [varchar](100) NOT NULL,
	[TIP_MOT_REG_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_TIPO_MOTIVO_REGISTRO] PRIMARY KEY CLUSTERED 
(
	[TIP_MOT_REG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_USUARIO]    Script Date: 09/06/2019 19:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_USUARIO](
	[USU_ID] [int] IDENTITY(1,1) NOT NULL,
	[PER_ID] [int] NOT NULL,
	[USU_LOGIN] [varchar](15) NOT NULL,
	[USU_PASSWORD] [varchar](15) NOT NULL,
	[USU_ULT_INGRESO] [date] NOT NULL,
	[USU_FECHA_INICIAL] [date] NOT NULL,
	[USU_FECHA_FINAL] [date] NULL,
	[USU_ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_USUARIO_1] PRIMARY KEY CLUSTERED 
(
	[USU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_BARRIO] ON 
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (154, 1, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (155, 2, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (156, 3, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (157, 4, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (158, 5, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (159, 6, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (160, 7, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (161, 8, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (162, 9, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (163, 10, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (164, 11, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (165, 12, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (166, 13, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (167, 14, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (168, 15, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (169, 16, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (170, 17, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (171, 18, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (172, 19, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (173, 20, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (174, 21, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (175, 22, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (176, 23, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (177, 24, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (178, 25, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (179, 26, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (180, 27, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (181, 28, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (182, 29, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (183, 30, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (184, 31, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (185, 32, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (186, 33, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (187, 34, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (188, 35, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (189, 36, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (190, 37, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (191, 38, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (192, 39, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (193, 40, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (194, 41, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (195, 42, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (196, 43, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (197, 44, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (198, 45, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (199, 46, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (200, 47, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (201, 48, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (202, 49, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (203, 50, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (204, 51, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (205, 52, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (206, 53, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (207, 54, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (208, 55, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (209, 56, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (210, 57, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (211, 58, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (212, 59, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (213, 60, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (214, 61, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (215, 62, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (216, 63, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (217, 64, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (218, 65, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (219, 66, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (220, 67, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (221, 68, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (222, 69, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (223, 70, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (224, 71, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (225, 72, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (226, 73, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (227, 74, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (228, 75, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (229, 76, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (230, 77, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (231, 78, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (232, 79, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (233, 80, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (234, 81, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (235, 82, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (236, 83, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (237, 84, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (238, 85, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (239, 86, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (240, 87, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (241, 88, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (242, 89, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (243, 90, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (244, 91, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (245, 92, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (246, 93, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (247, 94, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (248, 95, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (249, 96, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (250, 97, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (251, 98, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (252, 99, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (253, 100, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (254, 101, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (255, 102, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (256, 103, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (257, 104, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (258, 105, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (259, 106, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (260, 107, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (261, 108, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (262, 109, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (263, 110, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (264, 111, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (265, 112, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (266, 113, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (267, 114, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (268, 115, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (269, 116, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (270, 117, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (271, 118, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (272, 119, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (273, 120, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (274, 121, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (275, 122, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (276, 123, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (277, 124, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (278, 125, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (279, 126, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (280, 127, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (281, 128, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (282, 129, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (283, 130, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (284, 131, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (285, 132, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (286, 133, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (287, 134, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (288, 135, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (289, 136, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (290, 137, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (291, 138, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (292, 139, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (293, 140, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (294, 141, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (295, 142, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (296, 143, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (297, 144, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (298, 145, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (299, 146, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (300, 147, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (301, 148, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (302, 149, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (303, 150, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (304, 151, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (305, 152, N'No Definido                                                                                         ')
GO
INSERT [dbo].[TBL_BARRIO] ([BAR_ID], [MUN_ID], [BAR_NOMBRE]) VALUES (306, 153, N'No Definido                                                                                         ')
GO
SET IDENTITY_INSERT [dbo].[TBL_BARRIO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_CARRERA] ON 
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (1, 1, N'Arquitectura', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (2, 2, N'Ingenieria Agricola', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (3, 2, N'Ingenieria Civil', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (4, 2, N'Ingenieria de Sistemas', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (5, 1, N'Ingenieria Elèctronica', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (6, 1, N'Ingenieria Electrica', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (7, 1, N'Ingenieria  en Computacion', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (8, 2, N'Ingenieria Industrial', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (9, 2, N'Ingenieria Mecanica', 1)
GO
INSERT [dbo].[TBL_CARRERA] ([CAR_ID], [REC_ID], [CAR_DESCRIPCION], [CAR_ESTADO]) VALUES (10, 1, N'Ingenieria Quimica', 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_CARRERA] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_COMPAÑIA] ON 
GO
INSERT [dbo].[TBL_COMPAÑIA] ([COM_ID], [COM_DESCRIPCION]) VALUES (1, N'Movistar')
GO
INSERT [dbo].[TBL_COMPAÑIA] ([COM_ID], [COM_DESCRIPCION]) VALUES (2, N'Claro')
GO
INSERT [dbo].[TBL_COMPAÑIA] ([COM_ID], [COM_DESCRIPCION]) VALUES (3, N'Cootel')
GO
SET IDENTITY_INSERT [dbo].[TBL_COMPAÑIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_CUARTO] ON 
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (1, 1, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (2, 2, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (3, 3, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (4, 4, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (7, 5, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (8, 6, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (9, 7, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (10, 8, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (11, 9, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (12, 10, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (13, 11, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (14, 12, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (15, 13, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (16, 14, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (17, 15, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (18, 16, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (19, 17, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (20, 18, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (21, 19, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (22, 20, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (23, 21, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (24, 22, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (25, 23, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (26, 24, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (27, 25, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (28, 26, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (29, 27, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (30, 28, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (32, 29, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (33, 30, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (34, 31, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (35, 32, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (36, 33, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (37, 34, 1)
GO
INSERT [dbo].[TBL_CUARTO] ([CUA_ID], [CUA_NUMERO], [CUA_ESTADO]) VALUES (38, 35, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_CUARTO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_DEPARTAMENTO] ON 
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (1, N'Boaco')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (2, N'Carazo')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (3, N'Chinandega')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (4, N'Chontales')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (5, N'Estelí')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (6, N'Granada')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (7, N'Jinotega')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (8, N'León')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (9, N'Madriz')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (10, N'Managua')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (11, N'Masaya')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (12, N'Matagalpa')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (13, N'Nueva Segovia')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (14, N'Región Autónoma de la Costa Caribe Norte')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (15, N'Región Autónoma de la Costa Caribe Sur')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (16, N'Río San Juan')
GO
INSERT [dbo].[TBL_DEPARTAMENTO] ([DEP_ID], [DEP_NOMBRE]) VALUES (17, N'Rivas')
GO
SET IDENTITY_INSERT [dbo].[TBL_DEPARTAMENTO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_ESTADO_CIVIL] ON 
GO
INSERT [dbo].[TBL_ESTADO_CIVIL] ([EST_CIV_ID], [EST_CIV_DESCRI]) VALUES (1, N'Soltero')
GO
INSERT [dbo].[TBL_ESTADO_CIVIL] ([EST_CIV_ID], [EST_CIV_DESCRI]) VALUES (2, N'Casado')
GO
SET IDENTITY_INSERT [dbo].[TBL_ESTADO_CIVIL] OFF
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1020, 1, N'2015-0675U', CAST(N'2019-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1023, 1, N'2018-1139U', CAST(N'2019-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1025, 1, N'2016-0970U', CAST(N'2019-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1026, 1, N'2015-0958U', CAST(N'2019-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1027, 1, N'2016-0992U', CAST(N'2019-04-01' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1028, 1, N'2018-1190U', CAST(N'2019-04-01' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1029, 1, N'2017-1292U', CAST(N'2019-04-01' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1031, 1, N'2018-1191U', CAST(N'2019-02-12' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1032, 1, N'2015-0657U', CAST(N'2019-02-13' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1033, 8, N'2016-1329U', CAST(N'2016-04-12' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1034, 8, N'2016-0248U', CAST(N'2016-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1036, 8, N'2016-1303U', CAST(N'2016-04-23' AS Date), NULL, 1)
GO
INSERT [dbo].[TBL_ESTUDIANTE] ([EST_ID], [CAR_ID], [EST_CARNET], [EST_FECHA_INICIAL], [EST_FECHA_FINAL], [EST_ESTADO]) VALUES (1037, 7, N'2016-0019U', CAST(N'2016-01-26' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_FRECUENCIA] ON 
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (1, N'Mensual', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (2, N'Semanal', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (3, N'Semestral', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (4, N'Diario', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (5, N'Anual', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (6, N'Trimestral', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (7, N'Cuatrimestral', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (8, N'Bimensual', 1)
GO
INSERT [dbo].[TBL_FRECUENCIA] ([FRE_ID], [FRE_DESCRIPCION], [FRE_ESTADO]) VALUES (10, N'Quincenal', 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_FRECUENCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_GENERO] ON 
GO
INSERT [dbo].[TBL_GENERO] ([GEN_ID], [GEN_DESCRIPCION]) VALUES (1, N'Masculino')
GO
INSERT [dbo].[TBL_GENERO] ([GEN_ID], [GEN_DESCRIPCION]) VALUES (2, N'Femenino')
GO
INSERT [dbo].[TBL_GENERO] ([GEN_ID], [GEN_DESCRIPCION]) VALUES (3, N'Sin especificar')
GO
SET IDENTITY_INSERT [dbo].[TBL_GENERO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ON 
GO
INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ([HIS_EST_CUA_ID], [USU_ID], [EST_ID], [CUA_ID], [HIS_EST_CUA_FECHA_INICIAL], [HIS_EST_CUA_FECHA_FINAL], [HIS_EST_CUA_DESRIPCION], [HIS_EST_CUA_ESTADO]) VALUES (1, 2, 1020, 24, CAST(N'2015-02-22' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ([HIS_EST_CUA_ID], [USU_ID], [EST_ID], [CUA_ID], [HIS_EST_CUA_FECHA_INICIAL], [HIS_EST_CUA_FECHA_FINAL], [HIS_EST_CUA_DESRIPCION], [HIS_EST_CUA_ESTADO]) VALUES (2, 2, 1033, 17, CAST(N'2016-02-23' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ([HIS_EST_CUA_ID], [USU_ID], [EST_ID], [CUA_ID], [HIS_EST_CUA_FECHA_INICIAL], [HIS_EST_CUA_FECHA_FINAL], [HIS_EST_CUA_DESRIPCION], [HIS_EST_CUA_ESTADO]) VALUES (3, 2, 1034, 17, CAST(N'2016-03-21' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ([HIS_EST_CUA_ID], [USU_ID], [EST_ID], [CUA_ID], [HIS_EST_CUA_FECHA_INICIAL], [HIS_EST_CUA_FECHA_FINAL], [HIS_EST_CUA_DESRIPCION], [HIS_EST_CUA_ESTADO]) VALUES (4, 2, 1036, 17, CAST(N'2016-05-12' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] ([HIS_EST_CUA_ID], [USU_ID], [EST_ID], [CUA_ID], [HIS_EST_CUA_FECHA_INICIAL], [HIS_EST_CUA_FECHA_FINAL], [HIS_EST_CUA_DESRIPCION], [HIS_EST_CUA_ESTADO]) VALUES (5, 2, 1037, 17, CAST(N'2016-02-27' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_HIS_ROL_ASEO] ON 
GO
INSERT [dbo].[TBL_HIS_ROL_ASEO] ([HIS_ROL_ASE_ID], [ROL_ASE_ID], [USU_ID], [HIS_ROL_ASE_CUMPLE], [HIS_ROL_ASE_FECHA], [HIS_ROL_ASE_DESCRIPCION], [HIS_ROL_ASE_ESTADO]) VALUES (1, 2, 2, 0, CAST(N'2019-04-12' AS Date), N'No cumple devido a Problemas de Salud', 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_HIS_ROL_ASEO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_MUNICIPIO] ON 
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (1, 1, N'Boaco')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (2, 1, N'Camoapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (3, 1, N'San José de los Remates')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (4, 1, N'San Lorenzo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (5, 1, N'Santa Lucía')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (6, 1, N'Teustepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (7, 2, N'Diriamba')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (8, 2, N'Dolores')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (9, 2, N'El Rosario')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (10, 2, N'Jinotepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (11, 2, N'La Conquista')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (12, 2, N'La Paz de Carazo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (13, 2, N'San Marcos')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (14, 2, N'Santa Teresa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (15, 3, N'Chichigalpa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (16, 3, N'Chinandega')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (17, 3, N'San Juan de Cinco Pinos')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (18, 3, N'Corinto')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (19, 3, N'El Realejo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (20, 3, N'El Viejo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (21, 3, N'Posoltega')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (22, 3, N'Puerto Morazán')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (23, 3, N'San Francisco del Norte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (24, 3, N'San Pedro del Norte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (25, 3, N'Santo Tomás del Norte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (26, 3, N'Somotillo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (27, 3, N'Villanueva')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (28, 4, N'Acoyapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (29, 4, N'Comalapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (30, 4, N'El Coral')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (31, 4, N'Juigalpa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (32, 4, N'La Libertad')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (33, 4, N'San Francisco de Cuapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (34, 4, N'San Pedro de Lóvago')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (35, 4, N'Santo Domingo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (36, 4, N'Santo Tomás')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (37, 4, N'Villa Sandino')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (38, 5, N'Estelí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (39, 5, N'Condega')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (40, 5, N'La Trinidad')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (41, 5, N'Pueblo Nuevo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (42, 5, N'San Juan de Limay')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (43, 5, N'San Nicolás de Oriente')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (44, 6, N'Diriá')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (45, 6, N'Diriomo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (46, 6, N'Granada')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (47, 6, N'Nandaime')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (48, 7, N'El Cuá')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (49, 7, N'Jinotega')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (50, 7, N'La Concordia')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (51, 7, N'San José de Bocay')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (52, 7, N'San Rafael del Norte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (53, 7, N'San Sebastián de Yalí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (54, 7, N'Santa María de Pantasma')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (55, 7, N'Wiwilí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (56, 8, N'Achuapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (57, 8, N'El Jicaral')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (58, 8, N'El Sauce')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (59, 8, N'La Paz Centro')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (60, 8, N'Larreynaga')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (61, 8, N'León')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (62, 8, N'Nagarote')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (63, 8, N'Quezalguaque')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (64, 8, N'Santa Rosa del Peñón')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (65, 8, N'Telíca')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (66, 9, N'Las Sabanas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (67, 9, N'Palacagüina')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (68, 9, N'San José de Cusmapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (69, 9, N'San Juan de Río Coco')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (70, 9, N'San Lucas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (71, 9, N'Somoto')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (72, 9, N'Telpaneca')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (73, 9, N'Totogalpa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (74, 9, N'Yalagüina')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (75, 10, N'Ciudad Sandino')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (76, 10, N'El Crucero')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (77, 10, N'Managua')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (78, 10, N'Mateare')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (79, 10, N'San Francisco Libre')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (80, 10, N'San Rafael del Sur')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (81, 10, N'Ticuantepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (82, 10, N'Tipitapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (83, 10, N'Villa Carlos Fonseca')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (84, 11, N'Masaya')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (85, 11, N'Catarina')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (86, 11, N'La Concepción')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (87, 11, N'Masatepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (88, 11, N'Nandasmo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (89, 11, N'Nindirí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (90, 11, N'Niquinohomo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (91, 11, N'San Juan de Oriente')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (92, 11, N'Tisma')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (93, 12, N'Muy Muy')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (94, 12, N'Ciudad Darío')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (95, 12, N'La Tuma - La Dalia')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (96, 12, N'Esquipulas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (97, 12, N'Matagalpa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (98, 12, N'Matiguás')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (99, 12, N'Rancho Grande')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (100, 12, N'Río Blanco')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (101, 12, N'San Dionisio')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (102, 12, N'San Isidro')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (103, 12, N'San Ramón')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (104, 12, N'Sébaco')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (105, 12, N'Terrabona')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (106, 13, N'Ciudad Antigua')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (107, 13, N'Dipilto')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (108, 13, N'El Jícaro')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (109, 13, N'Wiwilí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (110, 13, N'Jalapa')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (111, 13, N'Macuelizo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (112, 13, N'Mozonte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (113, 13, N'Murra')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (114, 13, N'Ocotal')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (115, 13, N'Quilalí')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (116, 13, N'San Fernando')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (117, 13, N'Santa María')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (118, 14, N'Bonanza')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (119, 14, N'Prinzapolka')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (120, 14, N'Puerto Cabezas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (121, 14, N'Rosita')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (122, 14, N'Siuna')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (123, 14, N'Waslala')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (124, 14, N'Waspán')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (125, 14, N'Mulukuku')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (126, 15, N'Bluefields')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (127, 15, N'Desembocadura de la Cruz de Río Grande')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (128, 15, N'El Ayote')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (129, 15, N'El Rama')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (130, 15, N'El Tortuguero')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (131, 15, N'Islas del Maíz (Corn Island)')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (132, 15, N'Kukra Hill')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (133, 15, N'La Cruz de Río Grande')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (134, 15, N'Laguna de Perlas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (135, 15, N'Muelle de los Bueyes')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (136, 15, N'Nueva Guinea')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (137, 15, N'Paiwas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (138, 16, N'El Almendro')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (139, 16, N'El Castillo')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (140, 16, N'Morrito')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (141, 16, N'San Carlos')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (142, 16, N'San Juan del Norte')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (143, 16, N'San Miguelito')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (144, 17, N'Altagracia - Ometepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (145, 17, N'Belén')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (146, 17, N'Buenos Aires')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (147, 17, N'Cárdenas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (148, 17, N'Moyogalpa - Ometepe')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (149, 17, N'Rivas')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (150, 17, N'San Juan del Sur')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (151, 17, N'Tola')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (152, 17, N'San Jorge')
GO
INSERT [dbo].[TBL_MUNICIPIO] ([MUN_ID], [DEP_ID], [MUN_NOMBRE]) VALUES (153, 17, N'Potosí')
GO
SET IDENTITY_INSERT [dbo].[TBL_MUNICIPIO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_PERSONA] ON 
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1020, NULL, 3, 2, N'Claudia ', N'Fernanda', N'Delgado', N' Pérez ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1023, NULL, 3, 2, N'Nadeska', N'Melissa ', N'Duarte', N'Urbina', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1025, NULL, 3, 2, N'Cindy', N'Maciel', N'Martínez ', N'Jimenez ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1026, NULL, 3, 2, N'Francis', N'Elena', N' Martínez ', N'Vargas', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1027, NULL, 3, 1, N'Enrique', N'David ', N'Mejía ', N'Mendoza', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1028, NULL, 3, 2, N'Cindy', N'Fernanda ', N'Ortega ', N'Flores ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1029, NULL, 3, 1, N'Denis', N'Alberto ', N'Rojas ', N'Balladares ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1031, NULL, 3, 2, N'Rosángeles  ', N'', N'Sánchez ', N'Méndez ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1032, NULL, 3, 1, N'Joel ', N'Enrique', N'Treminio ', N'Treminio ', CAST(N'2019-04-10' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1033, NULL, 3, 1, N'Claudio', N'de Jesús ', N'Chavarría', N'Altamirano', CAST(N'1998-02-12' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1034, NULL, 3, 1, N'Manuel', N'Alexander	 ', N'.Mendoza ', N'Ordoñez', CAST(N'1998-09-15' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1036, NULL, 3, 1, N'Dickson ', N'José', N'Maltez ', N'Vivas', CAST(N'1997-03-09' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (1037, NULL, 3, 1, N'Joaquin', N'Gamaliel', N'Ordoñez', N'Diaz', CAST(N'1998-05-27' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[TBL_PERSONA] ([PER_ID], [PER_IDENTIFICACION], [TIP_IDE_ID], [GEN_ID], [PER_PRIMER_NOMBRE], [PER_SEGUNDO_NOMBRE], [PER_PRIMER_APELLIDO], [PER_SEGUNDO_APELLIDO], [PER_FECHA_NACIMIENTO], [PER_IMAGEN], [PER_ESTADO], [EST_CIV_ID]) VALUES (2033, NULL, 1, 1, N'GAMALIEL', N'Joaquin', N'Ordoñez', N'Ramirez', CAST(N'1952-07-26' AS Date), NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_PERSONA] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_RECINTO] ON 
GO
INSERT [dbo].[TBL_RECINTO] ([REC_ID], [REC_DESCRIPCION]) VALUES (1, N'Recinto Universitario Simón Bolivar')
GO
INSERT [dbo].[TBL_RECINTO] ([REC_ID], [REC_DESCRIPCION]) VALUES (2, N'Recinto Universitario Pedro Arauz Palacios')
GO
SET IDENTITY_INSERT [dbo].[TBL_RECINTO] OFF
GO
INSERT [dbo].[TBL_RESPONSABLE] ([PER_ID], [TIP_ARE_RES_ID], [RES_FECHA_INICIAL], [RES_FECHA_FINAL], [RES_ESTADO]) VALUES (2033, 1, CAST(N'2019-05-19' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_ROL_ASEO] ON 
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (2, 1002, 1, 1020, 2, CAST(N'2019-02-16' AS Date), NULL, NULL, NULL, 16, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (3, 7, 2, 1020, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (4, 8, 2, 1020, 2, CAST(N'2019-02-13' AS Date), NULL, NULL, NULL, 4, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (7, 3, 1, 1037, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 4, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (8, 3, 1, 1036, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 4, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (9, 3, 1, 1033, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 20, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (10, 3, 1, 1034, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 20, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (11, 5, 1, 1037, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 7, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (12, 5, 1, 1036, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 16, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (13, 5, 1, 1033, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 27, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (15, 8, 4, 1037, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 3, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (16, 8, 4, 1033, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 1, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (17, 8, 4, 1036, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 4, 1)
GO
INSERT [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID], [TIP_ASE_ID], [FRE_ID], [EST_ID], [USU_ID], [ROL_ASE_FECHA_INICIAL], [ROL_ASE_FECHA_FINAL], [ROL_ASE_HORA], [ROL_ASE_FECHA_DESHABILITADO], [ROL_ASE_DIA], [ROL_ASE_ESTADO]) VALUES (18, 8, 4, 1034, 2, CAST(N'2019-02-11' AS Date), NULL, NULL, NULL, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_ROL_ASEO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_TELEFONO] ON 
GO
INSERT [dbo].[TBL_TELEFONO] ([TEL_ID], [COM_ID], [PER_ID], [TEL_NUMERO], [TEL_PERSONAL], [TEL_ESTADO]) VALUES (6, 1, 1037, N'76789973', 1, 1)
GO
INSERT [dbo].[TBL_TELEFONO] ([TEL_ID], [COM_ID], [PER_ID], [TEL_NUMERO], [TEL_PERSONAL], [TEL_ESTADO]) VALUES (7, 2, 1036, N'86230599', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_TELEFONO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_AREA_RESPONSABLE] ON 
GO
INSERT [dbo].[TBL_TIPO_AREA_RESPONSABLE] ([TIP_ARE__RES_ID], [TIP_ARE_RES_DESCRIPCION], [TIP_ARE_RES_ESTADO]) VALUES (1, N'Responsable Día', 1)
GO
INSERT [dbo].[TBL_TIPO_AREA_RESPONSABLE] ([TIP_ARE__RES_ID], [TIP_ARE_RES_DESCRIPCION], [TIP_ARE_RES_ESTADO]) VALUES (2, N'Responsable Noche', 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_AREA_RESPONSABLE] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_ASEO] ON 
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (1, N'Baños y Tendederos', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (2, N'Comedor', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (3, N'Sala Lateral', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (4, N'Sala Central', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (5, N'Regar Jardin Exterior', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (6, N'Pasillo Norte', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (7, N'Ventana Int/Ext', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (8, N'Limpieza de Cuarto', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (9, N'Laboratorio', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (1002, N'Pasillo Este', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (1003, N'Lavar tazas', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (1004, N'Limpieza de biblioteca', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (2003, N'Lavar ventanas', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (2004, N'Duchas', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (2005, N'Limpiar Comedor', 1)
GO
INSERT [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID], [TIP_ASE_DESCRIPCION], [TIP_ASE_ESTADO]) VALUES (2006, N'Biblioteca', 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_ASEO] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_IDENTIFICACION] ON 
GO
INSERT [dbo].[TBL_TIPO_IDENTIFICACION] ([TIP_IDE_ID], [TIP_IDE_DESCRIPCION]) VALUES (1, N'Cédula')
GO
INSERT [dbo].[TBL_TIPO_IDENTIFICACION] ([TIP_IDE_ID], [TIP_IDE_DESCRIPCION]) VALUES (2, N'Pasaporte')
GO
INSERT [dbo].[TBL_TIPO_IDENTIFICACION] ([TIP_IDE_ID], [TIP_IDE_DESCRIPCION]) VALUES (3, N'Carnet')
GO
SET IDENTITY_INSERT [dbo].[TBL_TIPO_IDENTIFICACION] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_USUARIO] ON 
GO
INSERT [dbo].[TBL_USUARIO] ([USU_ID], [PER_ID], [USU_LOGIN], [USU_PASSWORD], [USU_ULT_INGRESO], [USU_FECHA_INICIAL], [USU_FECHA_FINAL], [USU_ESTADO]) VALUES (2, 2033, N'gamaUser', N'gamaPass', CAST(N'2019-05-19' AS Date), CAST(N'2019-05-19' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TBL_USUARIO] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_CARNET]    Script Date: 09/06/2019 19:41:10 ******/
ALTER TABLE [dbo].[TBL_ESTUDIANTE] ADD  CONSTRAINT [UNIQUE_CARNET] UNIQUE NONCLUSTERED 
(
	[EST_CARNET] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_PER_RELACION] ADD  CONSTRAINT [DF_TBL_PER_RELACION_PER_REL_FECHA_INICIAL]  DEFAULT (getdate()) FOR [PER_REL_FECHA_INICIAL]
GO
ALTER TABLE [dbo].[TBL_BARRIO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_MUNICIPIO_TBL_BARRIO] FOREIGN KEY([MUN_ID])
REFERENCES [dbo].[TBL_MUNICIPIO] ([MUN_ID])
GO
ALTER TABLE [dbo].[TBL_BARRIO] CHECK CONSTRAINT [FK_TBL_MUNICIPIO_TBL_BARRIO]
GO
ALTER TABLE [dbo].[TBL_CARRERA]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CARRERA_TBL_RECINTO] FOREIGN KEY([REC_ID])
REFERENCES [dbo].[TBL_RECINTO] ([REC_ID])
GO
ALTER TABLE [dbo].[TBL_CARRERA] CHECK CONSTRAINT [FK_TBL_CARRERA_TBL_RECINTO]
GO
ALTER TABLE [dbo].[TBL_CORREO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CORREO_TBL_PERSONA] FOREIGN KEY([PER_ID])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_CORREO] CHECK CONSTRAINT [FK_TBL_CORREO_TBL_PERSONA]
GO
ALTER TABLE [dbo].[TBL_DIRECCION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DIRECCION_TBL_BARRIO] FOREIGN KEY([BAR_ID])
REFERENCES [dbo].[TBL_BARRIO] ([BAR_ID])
GO
ALTER TABLE [dbo].[TBL_DIRECCION] CHECK CONSTRAINT [FK_TBL_DIRECCION_TBL_BARRIO]
GO
ALTER TABLE [dbo].[TBL_DIRECCION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DIRECCION_TBL_PERSONA] FOREIGN KEY([PER_ID])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_DIRECCION] CHECK CONSTRAINT [FK_TBL_DIRECCION_TBL_PERSONA]
GO
ALTER TABLE [dbo].[TBL_ESTUDIANTE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ESTUDIANTE_TBL_CARRERA] FOREIGN KEY([CAR_ID])
REFERENCES [dbo].[TBL_CARRERA] ([CAR_ID])
GO
ALTER TABLE [dbo].[TBL_ESTUDIANTE] CHECK CONSTRAINT [FK_TBL_ESTUDIANTE_TBL_CARRERA]
GO
ALTER TABLE [dbo].[TBL_ESTUDIANTE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ESTUDIANTE_TBL_PERSONA] FOREIGN KEY([EST_ID])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_ESTUDIANTE] CHECK CONSTRAINT [FK_TBL_ESTUDIANTE_TBL_PERSONA]
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_CUARTO] FOREIGN KEY([CUA_ID])
REFERENCES [dbo].[TBL_CUARTO] ([CUA_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] CHECK CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_CUARTO]
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_ESTUDIANTE] FOREIGN KEY([EST_ID])
REFERENCES [dbo].[TBL_ESTUDIANTE] ([EST_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] CHECK CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_ESTUDIANTE]
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_USUARIO] FOREIGN KEY([USU_ID])
REFERENCES [dbo].[TBL_USUARIO] ([USU_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_CUARTO] CHECK CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_CUARTO_TBL_USUARIO]
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_REGISTRO_TBL_TIPO_MOTIVO_REGISTRO] FOREIGN KEY([TIP_MOT_REG_ID])
REFERENCES [dbo].[TBL_TIPO_MOTIVO_REGISTRO] ([TIP_MOT_REG_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO] CHECK CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_REGISTRO_TBL_TIPO_MOTIVO_REGISTRO]
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_REGISTRO_TBL_USUARIO] FOREIGN KEY([USU_ID])
REFERENCES [dbo].[TBL_USUARIO] ([USU_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ESTUDIANTE_REGISTRO] CHECK CONSTRAINT [FK_TBL_HIS_ESTUDIANTE_REGISTRO_TBL_USUARIO]
GO
ALTER TABLE [dbo].[TBL_HIS_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ROL_ASEO_TBL_ROL_ASEO] FOREIGN KEY([ROL_ASE_ID])
REFERENCES [dbo].[TBL_ROL_ASEO] ([ROL_ASE_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_HIS_ROL_ASEO_TBL_ROL_ASEO]
GO
ALTER TABLE [dbo].[TBL_HIS_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_HIS_ROL_ASEO_TBL_USUARIO] FOREIGN KEY([USU_ID])
REFERENCES [dbo].[TBL_USUARIO] ([USU_ID])
GO
ALTER TABLE [dbo].[TBL_HIS_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_HIS_ROL_ASEO_TBL_USUARIO]
GO
ALTER TABLE [dbo].[TBL_MUNICIPIO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DEPARTAMENTO_TBL_MUNICIPIO] FOREIGN KEY([DEP_ID])
REFERENCES [dbo].[TBL_DEPARTAMENTO] ([DEP_ID])
GO
ALTER TABLE [dbo].[TBL_MUNICIPIO] CHECK CONSTRAINT [FK_TBL_DEPARTAMENTO_TBL_MUNICIPIO]
GO
ALTER TABLE [dbo].[TBL_PER_RELACION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PER_RELACION_TBL_PERSONA] FOREIGN KEY([PER_ORIGEN])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_PER_RELACION] CHECK CONSTRAINT [FK_TBL_PER_RELACION_TBL_PERSONA]
GO
ALTER TABLE [dbo].[TBL_PER_RELACION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PER_RELACION_TBL_PERSONA1] FOREIGN KEY([PER_DESTINO])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_PER_RELACION] CHECK CONSTRAINT [FK_TBL_PER_RELACION_TBL_PERSONA1]
GO
ALTER TABLE [dbo].[TBL_PER_RELACION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PER_RELACION_TBL_TIP_PER_RELACION] FOREIGN KEY([TIP_PER_REL_ID])
REFERENCES [dbo].[TBL_TIP_PER_RELACION] ([TIP_PER_REL_ID])
GO
ALTER TABLE [dbo].[TBL_PER_RELACION] CHECK CONSTRAINT [FK_TBL_PER_RELACION_TBL_TIP_PER_RELACION]
GO
ALTER TABLE [dbo].[TBL_PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PERSONA_TBL_ESTADO_CIVIL] FOREIGN KEY([EST_CIV_ID])
REFERENCES [dbo].[TBL_ESTADO_CIVIL] ([EST_CIV_ID])
GO
ALTER TABLE [dbo].[TBL_PERSONA] CHECK CONSTRAINT [FK_TBL_PERSONA_TBL_ESTADO_CIVIL]
GO
ALTER TABLE [dbo].[TBL_PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PERSONA_TBL_GENERO] FOREIGN KEY([GEN_ID])
REFERENCES [dbo].[TBL_GENERO] ([GEN_ID])
GO
ALTER TABLE [dbo].[TBL_PERSONA] CHECK CONSTRAINT [FK_TBL_PERSONA_TBL_GENERO]
GO
ALTER TABLE [dbo].[TBL_PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PERSONA_TBL_TIPO_IDENTIFICACION] FOREIGN KEY([TIP_IDE_ID])
REFERENCES [dbo].[TBL_TIPO_IDENTIFICACION] ([TIP_IDE_ID])
GO
ALTER TABLE [dbo].[TBL_PERSONA] CHECK CONSTRAINT [FK_TBL_PERSONA_TBL_TIPO_IDENTIFICACION]
GO
ALTER TABLE [dbo].[TBL_RESPONSABLE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_RESPONSABLE_TBL_TIPO_AREA_RESPONSABLE] FOREIGN KEY([TIP_ARE_RES_ID])
REFERENCES [dbo].[TBL_TIPO_AREA_RESPONSABLE] ([TIP_ARE__RES_ID])
GO
ALTER TABLE [dbo].[TBL_RESPONSABLE] CHECK CONSTRAINT [FK_TBL_RESPONSABLE_TBL_TIPO_AREA_RESPONSABLE]
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ROL_ASEO_TBL_ESTUDIANTE] FOREIGN KEY([EST_ID])
REFERENCES [dbo].[TBL_ESTUDIANTE] ([EST_ID])
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_ROL_ASEO_TBL_ESTUDIANTE]
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ROL_ASEO_TBL_FRECUENCIA] FOREIGN KEY([FRE_ID])
REFERENCES [dbo].[TBL_FRECUENCIA] ([FRE_ID])
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_ROL_ASEO_TBL_FRECUENCIA]
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ROL_ASEO_TBL_TIPO_ASEO] FOREIGN KEY([TIP_ASE_ID])
REFERENCES [dbo].[TBL_TIPO_ASEO] ([TIP_ASE_ID])
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_ROL_ASEO_TBL_TIPO_ASEO]
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_ROL_ASEO_TBL_USUARIO] FOREIGN KEY([USU_ID])
REFERENCES [dbo].[TBL_USUARIO] ([USU_ID])
GO
ALTER TABLE [dbo].[TBL_ROL_ASEO] CHECK CONSTRAINT [FK_TBL_ROL_ASEO_TBL_USUARIO]
GO
ALTER TABLE [dbo].[TBL_TELEFONO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_TELEFONO_TBL_COMPAÑIA] FOREIGN KEY([COM_ID])
REFERENCES [dbo].[TBL_COMPAÑIA] ([COM_ID])
GO
ALTER TABLE [dbo].[TBL_TELEFONO] CHECK CONSTRAINT [FK_TBL_TELEFONO_TBL_COMPAÑIA]
GO
ALTER TABLE [dbo].[TBL_TELEFONO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_TELEFONO_TBL_PERSONA1] FOREIGN KEY([PER_ID])
REFERENCES [dbo].[TBL_PERSONA] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_TELEFONO] CHECK CONSTRAINT [FK_TBL_TELEFONO_TBL_PERSONA1]
GO
ALTER TABLE [dbo].[TBL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_USUARIO_TBL_RESPONSABLE1] FOREIGN KEY([PER_ID])
REFERENCES [dbo].[TBL_RESPONSABLE] ([PER_ID])
GO
ALTER TABLE [dbo].[TBL_USUARIO] CHECK CONSTRAINT [FK_TBL_USUARIO_TBL_RESPONSABLE1]
GO
ALTER TABLE [dbo].[TBL_PERSONA]  WITH CHECK ADD  CONSTRAINT [CK__TBL_PERSO__PER_F__7B264821] CHECK  (([PER_FECHA_NACIMIENTO]<getdate()))
GO
ALTER TABLE [dbo].[TBL_PERSONA] CHECK CONSTRAINT [CK__TBL_PERSO__PER_F__7B264821]
GO
/****** Object:  StoredProcedure [dbo].[BUCARPERSONA]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUCARPERSONA]
 @numducumento VARCHAR (10)
as
SELECT PER.PER_PRIMER_NOMBRE
FROM TBL_PERSONA PER
WHERE PER.PER_IDENTIFICACION=@numducumento
GO
/****** Object:  StoredProcedure [dbo].[spBuscarEstudiantePorCuarto]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarEstudiantePorCuarto]
@NumeroCuarto int
AS
BEGIN
SELECT PER.PER_ID,PER.PER_PRIMER_NOMBRE,PER.PER_SEGUNDO_NOMBRE,PER.PER_PRIMER_APELLIDO FROM TBL_PERSONA PER
INNER JOIN TBL_ESTUDIANTE ES 
ON (PER.PER_ID=ES.EST_ID)
INNER JOIN TBL_HIS_ESTUDIANTE_CUARTO HIC
ON (ES.EST_ID=HIC.EST_ID)
INNER JOIN TBL_CUARTO CUA
ON (HIC.CUA_ID=CUA.CUA_ID)
WHERE CUA.CUA_ID=@NumeroCuarto
END
GO
/****** Object:  StoredProcedure [dbo].[spInfoEstudiante]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInfoEstudiante]

@NumCarnet varchar(15)
AS

BEGIN 

SELECT 
ISNULL(PER.PER_PRIMER_NOMBRE, '') PER_PRIMER_NOMBRE,
ISNULL(PER.PER_SEGUNDO_NOMBRE, '') PER_SEGUNDO_NOMBRE,
ISNULL(PER.PER_PRIMER_APELLIDO, '')PER_PRIMER_APELLIDO,
ISNULL(PER.PER_SEGUNDO_APELLIDO, '')PER_SEGUNDO_APELLIDO,
ISNULL(PER.PER_FECHA_NACIMIENTO, '')PER_FECHA_NACIMIENTO,
ISNULL(GEN.GEN_DESCRIPCION, '') GEN_DESCRIPCION,
ISNULL(DIR.DIR_DESCRIPCION, '') DIR_DESCRIPCION,
ISNULL(BAR.BAR_NOMBRE, '') BAR_NOMBRE,
ISNULL(MUN.MUN_NOMBRE, '') MUN_NOMBRE,
ISNULL(DEP.DEP_NOMBRE,  '') DEP_NOMBRE,
ISNULL(CORR.COR_DEFINICION, '') COR_DEFINICION, 
ISNULL(TEL.TEL_NUMERO,  '')TEL_NUMERO,
ISNULL(COMP.COM_DESCRIPCION, '')COM_DESCRIPCION ,
ISNULL(CAR.CAR_DESCRIPCION, '')CAR_DESCRIPCION,
ISNULL(REC.REC_DESCRIPCION, '')REC_DESCRIPCION,
ISNULL(CUA.CUA_NUMERO, '') CUA_NUMERO

FROM TBL_PERSONA PER
INNER JOIN TBL_GENERO GEN ON (PER.GEN_ID=GEN.GEN_ID)
LEFT JOIN TBL_DIRECCION DIR ON (PER.PER_ID=DIR.PER_ID)
LEFT JOIN TBL_BARRIO BAR ON (DIR.BAR_ID=BAR.BAR_ID)
LEFT JOIN  TBL_MUNICIPIO MUN ON (BAR.MUN_ID=MUN.MUN_ID)
LEFT JOIN TBL_DEPARTAMENTO DEP ON (MUN.DEP_ID=DEP.DEP_ID)
LEFT JOIN TBL_CORREO CORR ON (PER.PER_ID=CORR.PER_ID)
LEFT JOIN TBL_TELEFONO TEL ON (PER.PER_ID=TEL.PER_ID)
LEFT JOIN TBL_COMPAÑIA COMP ON (TEL.COM_ID=COMP.COM_ID)
LEFT JOIN TBL_ESTUDIANTE EST  ON (PER.PER_ID=EST.EST_ID)
LEFT JOIN TBL_CARRERA CAR  ON (EST.CAR_ID=CAR.CAR_ID)
LEFT JOIN TBL_RECINTO REC ON (CAR.REC_ID=REC.REC_ID)
LEFT JOIN TBL_HIS_ESTUDIANTE_CUARTO HIST ON (EST.EST_ID=HIST.EST_ID)
LEFT JOIN TBL_CUARTO CUA ON (HIST.CUA_ID=CUA.CUA_ID)
where EST.EST_CARNET  =@numCarnet
AND HIST.HIS_EST_CUA_ESTADO = 1

END



SELECT * FROM TBL_DIRECCION
SELECT * FROM TBL_BARRIO
SELECT * FROM TBL_MUNICIPIO
SELECT * FROM TBL_DEPARTAMENTO




EXEC spBuscarEstudiantePorCuarto 17
GO
/****** Object:  StoredProcedure [dbo].[spMostrarCuartosDisponibles]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMostrarCuartosDisponibles]
AS
BEGIN

  SELECT *FROM TBL_CUARTO CUA
  WHERE CUA.CUA_ESTADO=1

END
GO
/****** Object:  StoredProcedure [dbo].[SPNuevoTipoAseo]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPNuevoTipoAseo]
@Descripcion varchar(50)
as
begin
  
  INSERT INTO TBL_TIPO_ASEO VALUES (@Descripcion,1)

end
GO
/****** Object:  StoredProcedure [dbo].[TotalPersonas]    Script Date: 09/06/2019 19:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[TotalPersonas]
 as
 SELECT PER.PER_PRIMER_NOMBRE, COUNT(*) as TotalPersonas
 FROM TBL_PERSONA PER 
 GROUP BY PER.PER_PRIMER_NOMBRE
GO
