
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/19/2012 14:34:59
-- Generated from EDMX file: C:\Users\FABIO\Dropbox\artigosFabioEdie\siteconfop\confop\confop\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [siteeventodb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SiteSecao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SecaoSet] DROP CONSTRAINT [FK_SiteSecao];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteLink]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LinkSet] DROP CONSTRAINT [FK_SiteLink];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteFaq]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FaqSet] DROP CONSTRAINT [FK_SiteFaq];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteComite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComiteSet] DROP CONSTRAINT [FK_SiteComite];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteApoio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ApoioSet] DROP CONSTRAINT [FK_SiteApoio];
GO
IF OBJECT_ID(N'[dbo].[FK_ComiteMembroComite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembroComiteSet] DROP CONSTRAINT [FK_ComiteMembroComite];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteGrupoTrabalho]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GrupoTrabalhoSet] DROP CONSTRAINT [FK_SiteGrupoTrabalho];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioSet] DROP CONSTRAINT [FK_SiteUsuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SiteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiteSet];
GO
IF OBJECT_ID(N'[dbo].[SecaoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SecaoSet];
GO
IF OBJECT_ID(N'[dbo].[LinkSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LinkSet];
GO
IF OBJECT_ID(N'[dbo].[FaqSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FaqSet];
GO
IF OBJECT_ID(N'[dbo].[ApoioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ApoioSet];
GO
IF OBJECT_ID(N'[dbo].[ComiteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ComiteSet];
GO
IF OBJECT_ID(N'[dbo].[MembroComiteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembroComiteSet];
GO
IF OBJECT_ID(N'[dbo].[GrupoTrabalhoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GrupoTrabalhoSet];
GO
IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Site'
CREATE TABLE [dbo].[Site] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NULL,
    [Rodape] nvarchar(max)  NULL,
    [EmailResponsavel] nvarchar(max)  NULL
);
GO

-- Creating table 'Secao'
CREATE TABLE [dbo].[Secao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Texto] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Link'
CREATE TABLE [dbo].[Link] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Faq'
CREATE TABLE [dbo].[Faq] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Pergunta] nvarchar(max)  NOT NULL,
    [Resposta] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Apoio'
CREATE TABLE [dbo].[Apoio] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [Imagem] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Comite'
CREATE TABLE [dbo].[Comite] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'MembroComite'
CREATE TABLE [dbo].[MembroComite] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NULL,
    [ComiteId] int  NOT NULL
);
GO

-- Creating table 'GrupoTrabalho'
CREATE TABLE [dbo].[GrupoTrabalho] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL,
    [DataUltimoAcesso] datetime  NULL,
    [SiteId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Site'
ALTER TABLE [dbo].[Site]
ADD CONSTRAINT [PK_Site]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Secao'
ALTER TABLE [dbo].[Secao]
ADD CONSTRAINT [PK_Secao]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Link'
ALTER TABLE [dbo].[Link]
ADD CONSTRAINT [PK_Link]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Faq'
ALTER TABLE [dbo].[Faq]
ADD CONSTRAINT [PK_Faq]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Apoio'
ALTER TABLE [dbo].[Apoio]
ADD CONSTRAINT [PK_Apoio]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comite'
ALTER TABLE [dbo].[Comite]
ADD CONSTRAINT [PK_Comite]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MembroComite'
ALTER TABLE [dbo].[MembroComite]
ADD CONSTRAINT [PK_MembroComite]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GrupoTrabalho'
ALTER TABLE [dbo].[GrupoTrabalho]
ADD CONSTRAINT [PK_GrupoTrabalho]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SiteId] in table 'Secao'
ALTER TABLE [dbo].[Secao]
ADD CONSTRAINT [FK_SiteSecao]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteSecao'
CREATE INDEX [IX_FK_SiteSecao]
ON [dbo].[Secao]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Link'
ALTER TABLE [dbo].[Link]
ADD CONSTRAINT [FK_SiteLink]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteLink'
CREATE INDEX [IX_FK_SiteLink]
ON [dbo].[Link]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Faq'
ALTER TABLE [dbo].[Faq]
ADD CONSTRAINT [FK_SiteFaq]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteFaq'
CREATE INDEX [IX_FK_SiteFaq]
ON [dbo].[Faq]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Comite'
ALTER TABLE [dbo].[Comite]
ADD CONSTRAINT [FK_SiteComite]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteComite'
CREATE INDEX [IX_FK_SiteComite]
ON [dbo].[Comite]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Apoio'
ALTER TABLE [dbo].[Apoio]
ADD CONSTRAINT [FK_SiteApoio]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteApoio'
CREATE INDEX [IX_FK_SiteApoio]
ON [dbo].[Apoio]
    ([SiteId]);
GO

-- Creating foreign key on [ComiteId] in table 'MembroComite'
ALTER TABLE [dbo].[MembroComite]
ADD CONSTRAINT [FK_ComiteMembroComite]
    FOREIGN KEY ([ComiteId])
    REFERENCES [dbo].[Comite]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ComiteMembroComite'
CREATE INDEX [IX_FK_ComiteMembroComite]
ON [dbo].[MembroComite]
    ([ComiteId]);
GO

-- Creating foreign key on [SiteId] in table 'GrupoTrabalho'
ALTER TABLE [dbo].[GrupoTrabalho]
ADD CONSTRAINT [FK_SiteGrupoTrabalho]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteGrupoTrabalho'
CREATE INDEX [IX_FK_SiteGrupoTrabalho]
ON [dbo].[GrupoTrabalho]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [FK_SiteUsuario]
    FOREIGN KEY ([SiteId])
    REFERENCES [dbo].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteUsuario'
CREATE INDEX [IX_FK_SiteUsuario]
ON [dbo].[Usuario]
    ([SiteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------