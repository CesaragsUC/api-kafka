USE [master]
GO
/****** Object:  Database [SimpleDemoAPI]    Script Date: 19/03/2023 15:11:01 ******/
CREATE DATABASE [SimpleDemoAPI]

ALTER DATABASE [SimpleDemoAPI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SimpleDemoAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SimpleDemoAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SimpleDemoAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SimpleDemoAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SimpleDemoAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SimpleDemoAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SimpleDemoAPI] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SimpleDemoAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SimpleDemoAPI] SET  MULTI_USER 
GO
ALTER DATABASE [SimpleDemoAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SimpleDemoAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SimpleDemoAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SimpleDemoAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SimpleDemoAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SimpleDemoAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SimpleDemoAPI] SET QUERY_STORE = OFF
GO
USE [SimpleDemoAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Cpf] [varchar](50) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 19/03/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Imagem] [varchar](max) NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[CategoriaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221126022718_InitialCreate', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221126030235_InitialCreate2', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221126030308_Identity', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221126151544_chave', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221126151841_correcao nome', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130003717_caralho', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230207005839_clientes', N'6.0.11')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0ce7feea-f020-442e-b91f-98d07ea44448', N'noah52@bol.com.br', N'NOAH52@BOL.COM.BR', N'noah52@bol.com.br', N'NOAH52@BOL.COM.BR', 0, N'AQAAAAEAACcQAAAAEFWMKBuqODaNA33xAZDJYRkogPCI6ZNeLlc6TpUlxhyy67b8jGZtHEJaYjIdA+4sAw==', N'4NFNJBRN3XCDYXATZ4HBVUXYPZFEMJQ6', N'da0d0050-d1df-4fc6-bcdb-9858dbb4045d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'25b569fd-b103-46e1-a2a5-a49c72f5423e', N'mariacecilia.oliveira43@gmail.com', N'MARIACECILIA.OLIVEIRA43@GMAIL.COM', N'mariacecilia.oliveira43@gmail.com', N'MARIACECILIA.OLIVEIRA43@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKYHD/TBQf4wiR9Tj/iiLnc8HIxJccEIBMs6yOlSZdJ01Yq5g2sBsX884vdpgYAGjw==', N'ADYKA5OZDAYXS4BQBZV2YPZTA4AJ7CQV', N'46f6e56a-cfdc-4282-b115-e7e7d2f6339e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2a2ed836-d662-461c-960c-964de8c207cc', N'melissa_carvalho51@bol.com.br', N'MELISSA_CARVALHO51@BOL.COM.BR', N'melissa_carvalho51@bol.com.br', N'MELISSA_CARVALHO51@BOL.COM.BR', 0, N'AQAAAAEAACcQAAAAEFuYwyp5K7pCFl2z0EqFzVQOgPElvzGtJVj2JKyFtdLaC0ON0qEY36DtLh3oYv6/HA==', N'4BNUJMF47IHXBWSLMTOBBEBDA5FR2NDN', N'aa4716a7-c8b8-4b66-8e36-eb07daa76b52', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3428e1ea-a2cb-47a2-803a-5bcacd542e48', N'felicia63@hotmail.com', N'FELICIA63@HOTMAIL.COM', N'felicia63@hotmail.com', N'FELICIA63@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJg/ZigZpwRJEZUTtBvxEibsMAZ2mQReojaeHAozBc5EkIaLyLnpUhYsKk80lX8evQ==', N'EL4253ZNQHCVGLIWTSUME7CUHYJEZ2DF', N'4b7f918e-f96b-4ab4-a585-5b399704813e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'52e8a74a-ad86-4d34-9b1c-0cd5e83f24dc', N'giovanna.barros@live.com', N'GIOVANNA.BARROS@LIVE.COM', N'giovanna.barros@live.com', N'GIOVANNA.BARROS@LIVE.COM', 1, N'AQAAAAEAACcQAAAAEACK+vJlCdvM5csnCEQrVHw7RO3LBHh3zLl1Ctrup6NTgXJie4rhmGR8HZki1jHPBw==', N'GIR7PFBPPTCU4ZYAQFRVZRNXZ4HUICC7', N'e3c70c20-45d8-4aaa-a402-18cc40936129', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'739dfde0-10d1-4cc9-8f25-4de9e9d22c76', N'cerraosso3@example.com', N'CERRAOSSO3@EXAMPLE.COM', N'cerraosso3@example.com', N'CERRAOSSO3@EXAMPLE.COM', 1, N'AQAAAAEAACcQAAAAEFrtgoBFqhxKiZ3WQGZyEMi/pPcNrz50tif7/MxI5eTNPRe+RTMqal6gmNjmo4ffEQ==', N'5KPEJLWSTQV47QH3KOAOHOUOOK3S542P', N'b81c0f27-b0b5-4827-bd4d-a6651d6cf1b1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'80a9ddf0-d193-4503-b276-ff512ce1bdb0', N'fabio.silva50@gmail.com', N'FABIO.SILVA50@GMAIL.COM', N'fabio.silva50@gmail.com', N'FABIO.SILVA50@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEK9I1cNZNhz7M5+Y6m17Tuxuo1hWFilm4MUxYkNA1RMExCqCGUFUEVv7hOJXPIfqDA==', N'PS7Z6SQXJYN26KZT46DWX4I25JPTO3EW', N'68dce9db-e4c3-4a38-8f4b-3e72ff888d3f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8b16c0da-8d2b-406b-838a-f0b288a1c074', N'paulo.carvalho@live.com', N'PAULO.CARVALHO@LIVE.COM', N'paulo.carvalho@live.com', N'PAULO.CARVALHO@LIVE.COM', 0, N'AQAAAAEAACcQAAAAENJA0gphCFzGVg4HCgjaD/x2Nf8h4nDyrUwOYrB6R47LZElKk61imNgiCwwJtSOj/A==', N'OU2D5VDUCTVNQYGREVUSP63SMVGBDGCT', N'89090cd9-5551-4950-897b-36a7e5548b6c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a6b610bf-f683-4b69-b816-34e516e74d95', N'arthur_moreira@bol.com.br', N'ARTHUR_MOREIRA@BOL.COM.BR', N'arthur_moreira@bol.com.br', N'ARTHUR_MOREIRA@BOL.COM.BR', 0, N'AQAAAAEAACcQAAAAELak4bZ4eiJSYT/UtyR/av+huTXvR1y5s522D1rManCM1axDa9EL3sjVeyOFGJpTSQ==', N'BFQO4WHAOCVB3IJ2U2VTSQ6F7FPY6IJM', N'3565ae04-1cf2-4443-bcae-2a013cfdfdcb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a946f846-1b67-4775-8fdf-1f4e87de728e', N'teste@teste.com', N'TESTE@TESTE.COM', N'teste@teste.com', N'TESTE@TESTE.COM', 1, N'AQAAAAEAACcQAAAAEDwjSlbFKH5wfPu+BYLFRO4pN3tfli2x+cm8OCV8wry4SpNm9tTWQQjP38Jgm9gmdQ==', N'XNDTYC6XGIN67TMGZBKQ2LCHAAUXQFKY', N'085f4cbc-40de-4b92-9066-a8150701c3a0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ab1c14d0-bfcd-4af5-9ccf-6ee428afd388', N'murilo.melo38@gmail.com', N'MURILO.MELO38@GMAIL.COM', N'murilo.melo38@gmail.com', N'MURILO.MELO38@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAo9EL0lh5L4DAVM38jvbfZy3FJDqK2QyvaZKi791LqKO8DD+2BCBPvYd5UK93FgGQ==', N'JRXECKAJ5BFYRUS6SERHGATFQ7TRROCD', N'ced9324d-5261-48c8-8bd7-a7e204032e1c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'de1f4ce2-4e14-450d-8650-4ebdc2beeb0b', N'cesar@teste.com', N'CESAR@TESTE.COM', N'cesar@teste.com', N'CESAR@TESTE.COM', 1, N'AQAAAAEAACcQAAAAEIBeXIcRFZh9k2LuFVMG+QNIG0/2/zUg2rUAdHYZiz18ooDhtAtC9RuRTWzMZrYZ6A==', N'OZQARV522EBJIAV6JDWA7PIHHFWNH3EK', N'eb7a9301-4987-4b7c-8f7e-08d3239989dc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e7943460-7d07-40df-b941-6fa325918692', N'alessandro.melo@gmail.com', N'ALESSANDRO.MELO@GMAIL.COM', N'alessandro.melo@gmail.com', N'ALESSANDRO.MELO@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEDlWp0U23n3Nd5xfUTcoLuiGWgfbrldELuqpys0w29f7NlLJ0CCZckYL8ituT1pYIQ==', N'VX2AIJ57UDXSWS2RMZLJ463VIW7KKYIM', N'b5cfbff2-6e2f-450f-bb50-55d8411fe155', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'3464d4e3-6a68-4af8-abe8-0c71f6e4ae1f', N'Hardware', CAST(N'2022-11-26T12:02:02.2760001' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'Consoles', CAST(N'2022-11-26T11:37:26.5270415' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'648c2818-6417-4b47-8e94-3d268d336887', N'Acessorios', CAST(N'2022-11-26T12:04:58.0572295' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'e031fd85-6498-4093-bd37-5000916c9ac5', N'Placas de video', CAST(N'2023-02-04T09:46:06.4945745' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'3d467af8-eb14-4dc1-9b3f-6f932b5b601d', N'PC', CAST(N'2022-11-26T12:01:22.6966041' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'b35f3d4e-bd31-45e9-8615-b0974f599411', N'Escritorio', CAST(N'2022-11-26T12:02:13.3483345' AS DateTime2))
INSERT [dbo].[Categorias] ([Id], [Nome], [DataCadastro]) VALUES (N'5a9a11ed-4bbd-4f17-b1e5-e9caef788ac2', N'Cameras', CAST(N'2023-02-04T09:52:05.9180286' AS DateTime2))
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Ativo], [DataCadastro]) VALUES (N'739dfde0-10d1-4cc9-8f25-4de9e9d22c76', N'cerraosso3', N'cerraosso3@example.com', N'10079473067', 1, CAST(N'2023-02-08T17:52:32.0207611' AS DateTime2))
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'2d21ed54-da18-4085-a094-12910e995dcb', N'gdfgdf', N'b5e7cde6-e75d-4458-881d-9ddd8a0fe84a_cadeira-rgb.jpg', CAST(34.00 AS Decimal(18, 2)), 5, 0, CAST(N'2023-02-07T23:50:42.3835003' AS DateTime2), N'e031fd85-6498-4093-bd37-5000916c9ac5')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'f71bd65b-8737-43ab-a1f7-15997964b100', N'asdasdas', N'bf0e6b21-30d0-4b87-8ae0-bb38b06f2f27_teclado-gamer.jpg', CAST(11.00 AS Decimal(18, 2)), 33, 0, CAST(N'2023-02-07T23:46:23.4606786' AS DateTime2), N'3d467af8-eb14-4dc1-9b3f-6f932b5b601d')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'300bc45e-fdf3-42bc-8a0c-17ebabc6795b', N'Pilha Panassonic', N'7ac43db3-04b0-486a-a65b-80cdf8250b3a_pilhas-pannasonic.jpg', CAST(16.00 AS Decimal(18, 2)), 6, 1, CAST(N'2023-02-07T23:10:22.7078010' AS DateTime2), N'648c2818-6417-4b47-8e94-3d268d336887')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'944e4a89-06a4-4948-9349-2f008f69a617', N'sadasd', N'29f080ef-b382-44ae-9e3f-14cafd1e4a9d_ps5.jpg', CAST(23.00 AS Decimal(18, 2)), 23, 0, CAST(N'2023-02-08T17:55:02.4407030' AS DateTime2), N'e031fd85-6498-4093-bd37-5000916c9ac5')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'9b42783f-e8a5-486e-9082-44944e4166bf', N'Gabinete Corsair 760T', N'088b8e78-d85e-4b69-a5c7-138d0bad275f_Gabinete Corsair 760T branco.jpg', CAST(789.00 AS Decimal(18, 2)), 6, 0, CAST(N'2022-11-29T21:29:28.5696285' AS DateTime2), N'3d467af8-eb14-4dc1-9b3f-6f932b5b601d')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'567094bd-e1e4-4480-82cb-682512e0d009', N'hhf', N'9e543532-afa7-46f1-a7bf-f93337caf293_luminaria-2.webp', CAST(12.00 AS Decimal(18, 2)), 12, 1, CAST(N'2023-02-08T17:40:27.6238801' AS DateTime2), N'3464d4e3-6a68-4af8-abe8-0c71f6e4ae1f')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'77afc7fd-5246-4dc5-99cd-748135cdb1f1', N'GFHH', N'1b3434c9-65f0-4154-ac01-ce103ed1f20b_ram-16gb.jpg', CAST(45.00 AS Decimal(18, 2)), 45, 0, CAST(N'2023-02-08T18:10:29.3766504' AS DateTime2), N'e031fd85-6498-4093-bd37-5000916c9ac5')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'4a0d1c7d-d6b2-465d-a2a7-a5807cdb72aa', N'rtrt', N'9d5524d3-d3a5-490b-ba38-402ae9a5f04b_cadeira-gamer-azul.webp', CAST(65.00 AS Decimal(18, 2)), 56, 0, CAST(N'2023-02-08T18:13:19.4581752' AS DateTime2), N'648c2818-6417-4b47-8e94-3d268d336887')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'3a21ddc9-8160-48ae-925f-b7667445d660', N'teste', N'eee2c479-0ec3-47cf-922c-63ccb0641571_xbox.webp', CAST(123.00 AS Decimal(18, 2)), 23, 1, CAST(N'2023-02-08T18:17:31.9186558' AS DateTime2), N'648c2818-6417-4b47-8e94-3d268d336887')
INSERT [dbo].[Produtos] ([Id], [Nome], [Imagem], [Valor], [Quantidade], [Ativo], [DataCadastro], [CategoriaId]) VALUES (N'5b6c18fd-e036-4b5b-99d8-e7d09218fcf3', N'sddsfs', N'cabd196d-08c0-48b1-a33b-0b0c928a69ed_Controle Xbox 360.jpg', CAST(34.00 AS Decimal(18, 2)), 34, 0, CAST(N'2023-02-08T18:16:00.4574713' AS DateTime2), N'e031fd85-6498-4093-bd37-5000916c9ac5')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19/03/2023 15:11:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 19/03/2023 15:11:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Produtos_CategoriaId]    Script Date: 19/03/2023 15:11:01 ******/
CREATE NONCLUSTERED INDEX [IX_Produtos_CategoriaId] ON [dbo].[Produtos]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK_Produtos_Categorias_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK_Produtos_Categorias_CategoriaId]
GO
USE [master]
GO
ALTER DATABASE [SimpleDemoAPI] SET  READ_WRITE 
GO
