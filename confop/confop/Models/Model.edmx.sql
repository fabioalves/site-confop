
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/29/2012 10:02:23
-- Generated from EDMX file: C:\Users\FABIO\Dropbox\artigosFabioEdie\siteconfop\confop\confop\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [siteeventodb];
GO
IF SCHEMA_ID(N'siteevento') IS NULL EXECUTE(N'CREATE SCHEMA [siteevento]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[siteevento].[FK_SiteSecao]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Secao] DROP CONSTRAINT [FK_SiteSecao];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteLink]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Link] DROP CONSTRAINT [FK_SiteLink];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteFaq]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Faq] DROP CONSTRAINT [FK_SiteFaq];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteComite]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Comite] DROP CONSTRAINT [FK_SiteComite];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteApoio]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Apoio] DROP CONSTRAINT [FK_SiteApoio];
GO
IF OBJECT_ID(N'[siteevento].[FK_ComiteMembroComite]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[MembroComite] DROP CONSTRAINT [FK_ComiteMembroComite];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteGrupoTrabalho]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[GrupoTrabalho] DROP CONSTRAINT [FK_SiteGrupoTrabalho];
GO
IF OBJECT_ID(N'[siteevento].[FK_SiteUsuario]', 'F') IS NOT NULL
    ALTER TABLE [siteevento].[Usuario] DROP CONSTRAINT [FK_SiteUsuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[siteevento].[Site]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Site];
GO
IF OBJECT_ID(N'[siteevento].[Secao]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Secao];
GO
IF OBJECT_ID(N'[siteevento].[Link]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Link];
GO
IF OBJECT_ID(N'[siteevento].[Faq]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Faq];
GO
IF OBJECT_ID(N'[siteevento].[Apoio]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Apoio];
GO
IF OBJECT_ID(N'[siteevento].[Comite]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Comite];
GO
IF OBJECT_ID(N'[siteevento].[MembroComite]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[MembroComite];
GO
IF OBJECT_ID(N'[siteevento].[GrupoTrabalho]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[GrupoTrabalho];
GO
IF OBJECT_ID(N'[siteevento].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [siteevento].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Site'
CREATE TABLE [siteevento].[Site] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NULL,
    [Rodape] nvarchar(max)  NULL,
    [EmailResponsavel] nvarchar(max)  NULL
);
GO

-- Creating table 'Secao'
CREATE TABLE [siteevento].[Secao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Texto] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Link'
CREATE TABLE [siteevento].[Link] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Faq'
CREATE TABLE [siteevento].[Faq] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Pergunta] nvarchar(max)  NOT NULL,
    [Resposta] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Apoio'
CREATE TABLE [siteevento].[Apoio] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [Imagem] nvarchar(max)  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Comite'
CREATE TABLE [siteevento].[Comite] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'MembroComite'
CREATE TABLE [siteevento].[MembroComite] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NULL,
    [ComiteId] int  NOT NULL
);
GO

-- Creating table 'GrupoTrabalho'
CREATE TABLE [siteevento].[GrupoTrabalho] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [siteevento].[Usuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL,
    [DataUltimoAcesso] datetime  NULL,
    [SiteId] int  NOT NULL
);
GO

-- Creating table 'Contato'
CREATE TABLE [siteevento].[Contato] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Remetente] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Assunto] nvarchar(max)  NOT NULL,
    [Mensagem] nvarchar(max)  NOT NULL,
    [SiteId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Site'
ALTER TABLE [siteevento].[Site]
ADD CONSTRAINT [PK_Site]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Secao'
ALTER TABLE [siteevento].[Secao]
ADD CONSTRAINT [PK_Secao]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Link'
ALTER TABLE [siteevento].[Link]
ADD CONSTRAINT [PK_Link]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Faq'
ALTER TABLE [siteevento].[Faq]
ADD CONSTRAINT [PK_Faq]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Apoio'
ALTER TABLE [siteevento].[Apoio]
ADD CONSTRAINT [PK_Apoio]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comite'
ALTER TABLE [siteevento].[Comite]
ADD CONSTRAINT [PK_Comite]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MembroComite'
ALTER TABLE [siteevento].[MembroComite]
ADD CONSTRAINT [PK_MembroComite]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GrupoTrabalho'
ALTER TABLE [siteevento].[GrupoTrabalho]
ADD CONSTRAINT [PK_GrupoTrabalho]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuario'
ALTER TABLE [siteevento].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contato'
ALTER TABLE [siteevento].[Contato]
ADD CONSTRAINT [PK_Contato]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SiteId] in table 'Secao'
ALTER TABLE [siteevento].[Secao]
ADD CONSTRAINT [FK_SiteSecao]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteSecao'
CREATE INDEX [IX_FK_SiteSecao]
ON [siteevento].[Secao]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Link'
ALTER TABLE [siteevento].[Link]
ADD CONSTRAINT [FK_SiteLink]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteLink'
CREATE INDEX [IX_FK_SiteLink]
ON [siteevento].[Link]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Faq'
ALTER TABLE [siteevento].[Faq]
ADD CONSTRAINT [FK_SiteFaq]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteFaq'
CREATE INDEX [IX_FK_SiteFaq]
ON [siteevento].[Faq]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Comite'
ALTER TABLE [siteevento].[Comite]
ADD CONSTRAINT [FK_SiteComite]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteComite'
CREATE INDEX [IX_FK_SiteComite]
ON [siteevento].[Comite]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Apoio'
ALTER TABLE [siteevento].[Apoio]
ADD CONSTRAINT [FK_SiteApoio]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteApoio'
CREATE INDEX [IX_FK_SiteApoio]
ON [siteevento].[Apoio]
    ([SiteId]);
GO

-- Creating foreign key on [ComiteId] in table 'MembroComite'
ALTER TABLE [siteevento].[MembroComite]
ADD CONSTRAINT [FK_ComiteMembroComite]
    FOREIGN KEY ([ComiteId])
    REFERENCES [siteevento].[Comite]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ComiteMembroComite'
CREATE INDEX [IX_FK_ComiteMembroComite]
ON [siteevento].[MembroComite]
    ([ComiteId]);
GO

-- Creating foreign key on [SiteId] in table 'GrupoTrabalho'
ALTER TABLE [siteevento].[GrupoTrabalho]
ADD CONSTRAINT [FK_SiteGrupoTrabalho]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteGrupoTrabalho'
CREATE INDEX [IX_FK_SiteGrupoTrabalho]
ON [siteevento].[GrupoTrabalho]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Usuario'
ALTER TABLE [siteevento].[Usuario]
ADD CONSTRAINT [FK_SiteUsuario]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteUsuario'
CREATE INDEX [IX_FK_SiteUsuario]
ON [siteevento].[Usuario]
    ([SiteId]);
GO

-- Creating foreign key on [SiteId] in table 'Contato'
ALTER TABLE [siteevento].[Contato]
ADD CONSTRAINT [FK_ContatoSite]
    FOREIGN KEY ([SiteId])
    REFERENCES [siteevento].[Site]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContatoSite'
CREATE INDEX [IX_FK_ContatoSite]
ON [siteevento].[Contato]
    ([SiteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------