-- Script Date: 8/19/2018 3:00 PM  - ErikEJ.SqlCeScripting version 3.5.2.26
-- Database information:
-- Locale Identifier: 1033
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\Works\AutomallApiServer\AutomallApiServer\App_Data\\Umbraco_20180819120043.sdf
-- ServerVersion: 4.0.8902.1
-- DatabaseSize: 1441792
-- Created: 8/19/2018 3:00 PM

-- User Table information:
-- Number of tables: 51
-- cmsContent: 3 row(s)
-- cmsContentType: 4 row(s)
-- cmsContentType2ContentType: 0 row(s)
-- cmsContentTypeAllowedContentType: 3 row(s)
-- cmsContentVersion: 3 row(s)
-- cmsContentXml: 3 row(s)
-- cmsDataType: 24 row(s)
-- cmsDataTypePreValues: 12 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 0 row(s)
-- cmsDocumentType: 0 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMedia: 0 row(s)
-- cmsMember: 3 row(s)
-- cmsMember2MemberGroup: 3 row(s)
-- cmsMemberType: 9 row(s)
-- cmsPreviewXml: 0 row(s)
-- cmsPropertyData: 27 row(s)
-- cmsPropertyType: 18 row(s)
-- cmsPropertyTypeGroup: 4 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 0 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoAudit: 55 row(s)
-- umbracoCacheInstruction: 1 row(s)
-- umbracoConsent: 0 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLock: 1 row(s)
-- umbracoLog: 2 row(s)
-- umbracoMigration: 1 row(s)
-- umbracoNode: 38 row(s)
-- umbracoRedirectUrl: 0 row(s)
-- umbracoRelation: 0 row(s)
-- umbracoRelationType: 2 row(s)
-- umbracoServer: 3 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2UserGroup: 2 row(s)
-- umbracoUserGroup: 5 row(s)
-- umbracoUserGroup2App: 12 row(s)
-- umbracoUserGroup2NodePermission: 0 row(s)
-- umbracoUserLogin: 14 row(s)
-- umbracoUserStartNode: 0 row(s)

CREATE TABLE [cmsContent] (
  [pk] int NOT NULL  IDENTITY (4,1)
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int NOT NULL  IDENTITY (535,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) NOT NULL DEFAULT ('folder.png')
, [description] nvarchar(1500) NULL
, [isContainer] bit NOT NULL DEFAULT ('0')
, [allowAtRoot] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int NOT NULL  IDENTITY (4,1)
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int NOT NULL  IDENTITY (40,1)
, [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int NOT NULL  IDENTITY (10,1)
, [datatypeNodeId] int NOT NULL
, [value] ntext NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(450) NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [templateId] int NULL
, [newest] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int NOT NULL  IDENTITY (1,1)
, [uniqueId] uniqueidentifier NOT NULL
, [macroUseInEditor] bit NOT NULL DEFAULT ('0')
, [macroRefreshRate] int NOT NULL DEFAULT ('0')
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit NOT NULL DEFAULT ('1')
, [macroCachePersonalized] bit NOT NULL DEFAULT ('0')
, [macroDontRender] bit NOT NULL DEFAULT ('0')
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int NOT NULL  IDENTITY (1,1)
, [uniquePropertyId] uniqueidentifier NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int NOT NULL DEFAULT ('0')
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMedia] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [mediaPath] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) NOT NULL DEFAULT ('''')
, [LoginName] nvarchar(1000) NOT NULL DEFAULT ('''')
, [Password] nvarchar(1000) NOT NULL DEFAULT ('''')
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int NOT NULL  IDENTITY (10,1)
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit NOT NULL DEFAULT ('0')
, [viewOnProfile] bit NOT NULL DEFAULT ('0')
, [isSensitive] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int NOT NULL  IDENTITY (28,1)
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDecimal] numeric(38,6) NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int NOT NULL  IDENTITY (52,1)
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int NOT NULL DEFAULT ('0')
, [mandatory] bit NOT NULL DEFAULT ('0')
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
, [UniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int NOT NULL  IDENTITY (12,1)
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int NOT NULL  IDENTITY (1,1)
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit NOT NULL DEFAULT ('0')
, [id] int NOT NULL  IDENTITY (1,1)
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime NOT NULL DEFAULT (GETDATE())
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAudit] (
  [id] int NOT NULL  IDENTITY (56,1)
, [performingUserId] int NOT NULL
, [performingDetails] nvarchar(1024) NULL
, [performingIp] nvarchar(64) NULL
, [eventDateUtc] datetime NOT NULL DEFAULT (GETDATE())
, [affectedUserId] int NOT NULL
, [affectedDetails] nvarchar(1024) NULL
, [eventType] nvarchar(256) NOT NULL
, [eventDetails] nvarchar(1024) NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int NOT NULL  IDENTITY (13,1)
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
, [instructionCount] int NOT NULL DEFAULT ('1')
);
GO
CREATE TABLE [umbracoConsent] (
  [id] int NOT NULL  IDENTITY (1,1)
, [current] bit NOT NULL
, [source] nvarchar(512) NOT NULL
, [context] nvarchar(128) NOT NULL
, [action] nvarchar(512) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [state] int NOT NULL
, [comment] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int NOT NULL  IDENTITY (1,1)
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int NOT NULL  IDENTITY (2,1)
, [languageISOCode] nvarchar(10) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoLock] (
  [id] int NOT NULL  IDENTITY (1,1)
, [value] int NOT NULL
, [name] nvarchar(64) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int NOT NULL  IDENTITY (3,1)
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime NOT NULL DEFAULT (GETDATE())
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoMigration] (
  [id] int NOT NULL  IDENTITY (100,1)
, [name] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [version] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int NOT NULL  IDENTITY (1067,1)
, [trashed] bit NOT NULL DEFAULT ('0')
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int NOT NULL  IDENTITY (1,1)
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime NOT NULL DEFAULT (GETDATE())
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int NOT NULL  IDENTITY (3,1)
, [typeUniqueId] uniqueidentifier NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int NOT NULL  IDENTITY (4,1)
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime NOT NULL DEFAULT (GETDATE())
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userDisabled] bit NOT NULL DEFAULT ('0')
, [userNoConsole] bit NOT NULL DEFAULT ('0')
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [passwordConfig] nvarchar(500) NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
, [emailConfirmedDate] datetime NULL
, [invitedDate] datetime NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [avatar] nvarchar(500) NULL
, [tourData] ntext NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser2UserGroup] (
  [userId] int NOT NULL
, [userGroupId] int NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup] (
  [id] int NOT NULL  IDENTITY (6,1)
, [userGroupAlias] nvarchar(200) NOT NULL
, [userGroupName] nvarchar(200) NOT NULL
, [userGroupDefaultPermissions] nvarchar(50) NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [icon] nvarchar(255) NULL
, [startContentId] int NULL
, [startMediaId] int NULL
);
GO
CREATE TABLE [umbracoUserGroup2App] (
  [userGroupId] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup2NodePermission] (
  [userGroupId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserLogin] (
  [sessionId] uniqueidentifier NOT NULL
, [userId] int NOT NULL
, [loggedInUtc] datetime NOT NULL
, [lastValidatedUtc] datetime NOT NULL
, [loggedOutUtc] datetime NULL
, [ipAddress] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoUserStartNode] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [startNode] int NOT NULL
, [startNodeType] int NOT NULL
);
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (1,1060,1044);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (2,1064,1044);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (3,1066,1044);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (534,1033,N'File',N'icon-document',N'icon-document',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1033,0);
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (1,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',{ts '2018-08-07 12:23:04.503'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (2,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',{ts '2018-08-19 14:57:44.877'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (3,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',{ts '2018-08-19 08:38:47.450'});
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1060,N'<Member id="1060" key="a7f5c211-4b7e-4bfe-8e46-7f9c0470153c" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-08-01T23:40:36" updateDate="2018-08-07T12:23:04" nodeName="TestUser" urlName="testuser" path="-1,1060" isDoc="" nodeType="1044" nodeTypeAlias="Member" loginName="test" email="test@mail.com" icon="icon-user"><umbracoMemberFailedPasswordAttempts><![CDATA[0]]></umbracoMemberFailedPasswordAttempts><umbracoMemberApproved>1</umbracoMemberApproved><umbracoMemberLockedOut>0</umbracoMemberLockedOut><umbracoMemberLastLogin><![CDATA[07.08.2018 12:23:04]]></umbracoMemberLastLogin><umbracoMemberLastPasswordChangeDate><![CDATA[01.08.2018 23:40:36]]></umbracoMemberLastPasswordChangeDate></Member>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1064,N'<Member id="1064" key="0d74f422-ff63-4cb1-90d7-8bdbf3860aea" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-08-06T20:26:04" updateDate="2018-08-19T14:57:44" nodeName="Oki" urlName="oki" path="-1,1064" isDoc="" nodeType="1044" nodeTypeAlias="Member" loginName="OkiToki" email="oki@itworks.expert" icon="icon-user"><umbracoMemberComments><![CDATA[User to connect to Oki-toki API]]></umbracoMemberComments><umbracoMemberApproved>1</umbracoMemberApproved><umbracoMemberLockedOut>0</umbracoMemberLockedOut><umbracoMemberLastLogin><![CDATA[19.08.2018 14:57:44]]></umbracoMemberLastLogin><umbracoMemberLastPasswordChangeDate><![CDATA[06.08.2018 20:26:04]]></umbracoMemberLastPasswordChangeDate></Member>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1066,N'<Member id="1066" key="b7ab6572-9146-4824-a658-dfea30cf3219" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-08-07T09:42:44" updateDate="2018-08-19T08:38:47" nodeName="1CTest" urlName="1ctest" path="-1,1066" isDoc="" nodeType="1044" nodeTypeAlias="Member" loginName="1CTest" email="1ctest@itworks.expert" icon="icon-user"><umbracoMemberFailedPasswordAttempts><![CDATA[5]]></umbracoMemberFailedPasswordAttempts><umbracoMemberApproved>1</umbracoMemberApproved><umbracoMemberLockedOut>1</umbracoMemberLockedOut><umbracoMemberLastLockoutDate><![CDATA[19.08.2018 8:38:47]]></umbracoMemberLastLockoutDate><umbracoMemberLastLogin><![CDATA[19.08.2018 8:15:13]]></umbracoMemberLastLogin><umbracoMemberLastPasswordChangeDate><![CDATA[07.08.2018 9:42:44]]></umbracoMemberLastPasswordChangeDate></Member>');
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (1,-49,N'Umbraco.TrueFalse',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (2,-51,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (3,-87,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (4,-88,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (5,-89,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (6,-90,N'Umbraco.UploadField',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (7,-92,N'Umbraco.NoEdit',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (8,-36,N'Umbraco.DateTime',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (9,-37,N'Umbraco.ColorPickerAlias',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (11,-39,N'Umbraco.DropDownMultiple',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (12,-40,N'Umbraco.RadioButtonList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (13,-41,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (14,-42,N'Umbraco.DropDown',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (15,-43,N'Umbraco.CheckBoxList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (22,1041,N'Umbraco.Tags',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (24,1043,N'Umbraco.ImageCropper',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-26,-95,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-27,-96,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-28,-97,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (26,1046,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (27,1047,N'Umbraco.MemberPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (28,1048,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (29,1049,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (30,1050,N'Umbraco.RelatedLinks2',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-1,-97,N'10',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-2,-97,N'username',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-3,-97,N'asc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-4,-97,N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]',4,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-5,-96,N'100',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-6,-96,N'updateDate',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-7,-96,N'desc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-8,-96,N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]',4,N'layouts');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-9,-96,N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]',5,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (6,1049,N'1',0,N'multiPicker');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
INSERT INTO [cmsMember] ([nodeId],[Email],[LoginName],[Password]) VALUES (1060,N'test@mail.com',N'test',N'EEaz9BnbMH39ahjquO4z2w==o0vQBC1k9Ya3em3a22BQ9j4nwq/CegpsnpfU+sVtWEM=');
GO
INSERT INTO [cmsMember] ([nodeId],[Email],[LoginName],[Password]) VALUES (1064,N'oki@itworks.expert',N'OkiToki',N'/GcQz//DSlN/pU6osTNSiQ==4UpasIxCUsu8O7yQ2NoLbSHt3C7tBXAsgoSOhjchssQ=');
GO
INSERT INTO [cmsMember] ([nodeId],[Email],[LoginName],[Password]) VALUES (1066,N'1ctest@itworks.expert',N'1CTest',N'xhJR366GE/Wr6Af2C6f+TQ==pk1g/m5nq8I4gw12F5n6LT5uktJoHDYwBpR0q8vYexU=');
GO
INSERT INTO [cmsMember2MemberGroup] ([Member],[MemberGroup]) VALUES (1060,1061);
GO
INSERT INTO [cmsMember2MemberGroup] ([Member],[MemberGroup]) VALUES (1064,1063);
GO
INSERT INTO [cmsMember2MemberGroup] ([Member],[MemberGroup]) VALUES (1066,1065);
GO
SET IDENTITY_INSERT [cmsMemberType] ON;
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (1,1044,50,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (2,1044,51,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (3,1044,28,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (4,1044,29,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (5,1044,30,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (6,1044,31,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (7,1044,32,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (8,1044,33,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (9,1044,34,0,0,0);
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (1,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',50,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (2,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',51,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (3,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',28,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (4,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',29,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (5,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',30,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (6,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',31,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (7,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',32,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (8,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',33,NULL,NULL,{ts '2018-08-07 12:23:04.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (9,1060,'021bd749-d450-4a9c-b180-ae7293c4d62c',34,NULL,NULL,{ts '2018-08-01 23:40:36.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (10,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',50,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (11,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',51,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (12,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',28,NULL,NULL,NULL,NULL,N'User to connect to Oki-toki API');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (13,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',29,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (14,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',30,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (15,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',31,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (16,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',32,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (17,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',33,NULL,NULL,{ts '2018-08-19 14:57:44.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (18,1064,'b82fdad7-434e-4f83-a384-aba7b747e97e',34,NULL,NULL,{ts '2018-08-06 20:26:04.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (19,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',50,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (20,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',51,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (21,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',28,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (22,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',29,5,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (23,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',30,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (24,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',31,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (25,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',32,NULL,NULL,{ts '2018-08-19 08:38:47.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (26,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',33,NULL,NULL,{ts '2018-08-19 08:15:13.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (27,1066,'8635e8c0-b61a-43c2-adea-5336e1b260da',34,NULL,NULL,{ts '2018-08-07 09:42:44.000'},NULL,NULL);
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (6,1043,1032,3,N'umbracoFile',N'Upload image',0,0,NULL,NULL,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',0,0,NULL,NULL,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (27,-96,1031,5,N'contents',N'Contents:',0,0,NULL,NULL,'0000001b-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (29,-92,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (32,-92,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (33,-92,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (34,-92,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (50,-92,1044,NULL,N'umbracoMemberPasswordRetrievalAnswer',N'Password Answer',0,0,NULL,NULL,'e67b1b1a-3139-4239-92c9-9d541f546a90');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (51,-92,1044,NULL,N'umbracoMemberPasswordRetrievalQuestion',N'Password Question',1,0,NULL,NULL,'76d216c4-9abf-40e4-87bf-ac5f1e4a00ff');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (5,1031,N'Contents',1,'79995fa2-63ee-453c-a29b-2e66f324cdbe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [umbracoAudit] ON;
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (42,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:37.383'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (43,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:37.463'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (44,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:49.493'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (45,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:49.573'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (46,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 06:41:20.017'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (47,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 06:41:20.117'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (48,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:42:44.230'},-1,N'Member 1066 "1CTest" <1ctest@itworks.expert>',N'umbraco/member/save',N'updating CreateDate, UpdateDate, ProviderUserKey, Id, HasIdentity, Path, SortOrder, Level, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (49,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:42:44.360'},-1,N'Member 1066 "1CTest" <1ctest@itworks.expert>',N'umbraco/member/save',N'updating UpdateDate, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (50,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:42:44.617'},-1,N'Member 1066 "1CTest" <1ctest@itworks.expert>',N'umbraco/member/save',N'updating UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (51,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:42:44.817'},-1,N'Member 1066 "1CTest" <1ctest@itworks.expert>',N'umbraco/member/roles/assigned',N'roles modified, assigned Eurogarage');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (52,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 09:23:40.553'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (53,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 09:23:40.837'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (54,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-19 11:57:34.770'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (55,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-19 11:57:35.013'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (1,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:24:59.450'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating TourData, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (2,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:40:36.323'},-1,N'Member 1060 "test" <test@mail.com>',N'umbraco/member/save',N'updating CreateDate, UpdateDate, ProviderUserKey, Id, HasIdentity, Path, Level, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (3,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:40:36.557'},-1,N'Member 1060 "test" <test@mail.com>',N'umbraco/member/save',N'updating UpdateDate, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (4,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:40:36.783'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/save',N'updating Name, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (5,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:14.200'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (6,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:14.323'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (7,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:21.033'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (8,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:21.140'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (9,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:43.637'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/save',N'updating UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (10,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 20:41:43.857'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/roles/assigned',N'roles modified, assigned Role1');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (11,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-01 21:07:55.797'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (12,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-01 21:08:01.953'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (13,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-01 21:08:24.250'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (14,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-01 21:08:24.443'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (15,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-01 21:08:24.563'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (16,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:08:59.343'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/save',N'updating UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (17,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:08:59.550'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/roles/removed',N'roles modified, removed Role1');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (18,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:08:59.710'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/roles/assigned',N'roles modified, assigned Role2');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (19,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:11:59.090'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/save',N'updating UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (20,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:11:59.283'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/roles/removed',N'roles modified, removed Role2');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (21,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-01 21:11:59.357'},-1,N'Member 1060 "TestUser" <test@mail.com>',N'umbraco/member/roles/assigned',N'roles modified, assigned Role1');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (22,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-05 19:52:02.457'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (23,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-05 19:52:17.637'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (24,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-05 19:52:17.797'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (25,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-05 19:52:17.917'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (26,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-06 17:21:21.377'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (27,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-06 17:21:21.473'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (28,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 17:26:04.273'},-1,N'Member 1064 "Oki-Toki" <oki@itworks.expert>',N'umbraco/member/save',N'updating CreateDate, UpdateDate, ProviderUserKey, Id, HasIdentity, Path, SortOrder, Level, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (29,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 17:26:04.450'},-1,N'Member 1064 "Oki-Toki" <oki@itworks.expert>',N'umbraco/member/save',N'updating UpdateDate, umbracoMemberPasswordRetrievalAnswer, umbracoMemberPasswordRetrievalQuestion, umbracoMemberComments, umbracoMemberFailedPasswordAttempts, umbracoMemberApproved, umbracoMemberLockedOut, umbracoMemberLastLockoutDate, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (30,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 17:26:04.863'},-1,N'Member 1064 "Oki-Toki" <oki@itworks.expert>',N'umbraco/member/save',N'updating UpdateDate, umbracoMemberComments');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (31,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 17:26:05.043'},-1,N'Member 1064 "Oki" <oki@itworks.expert>',N'umbraco/member/save',N'updating Name, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (32,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 17:26:05.310'},-1,N'Member 1064 "Oki" <oki@itworks.expert>',N'umbraco/member/roles/assigned',N'roles modified, assigned Oki-Toki');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (33,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-06 20:05:08.673'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (34,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-06 20:05:08.880'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (35,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 20:05:52.180'},-1,N'Member 1064 "Oki" <oki@itworks.expert>',N'umbraco/member/save',N'updating RawPasswordValue, UpdateDate, umbracoMemberLastPasswordChangeDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (36,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 20:05:52.443'},-1,N'Member 1064 "Oki" <oki@itworks.expert>',N'umbraco/member/save',N'updating Username, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (37,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-06 20:05:52.773'},-1,N'Member 1064 "Oki" <oki@itworks.expert>',N'umbraco/member/roles/assigned',N'roles modified, assigned OkiToki');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (38,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 06:35:45.043'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (39,0,N'User "SYSTEM" ',N'::1',{ts '2018-08-07 06:35:45.233'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (40,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:22.083'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (41,0,N'User "Valentin" <valentin.gushan@gmail.com>',N'::1',{ts '2018-08-07 06:40:22.170'},0,N'User "Valentin" <valentin.gushan@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
SET IDENTITY_INSERT [umbracoAudit] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] ON;
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (12,{ts '2018-08-07 06:42:44.933'},N'[{"RefreshType":3,"RefresherId":"e285df34-acdc-4226-ae32-c0cb5cf388da","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1066]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e285df34-acdc-4226-ae32-c0cb5cf388da","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1066]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e285df34-acdc-4226-ae32-c0cb5cf388da","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1066]","JsonIdCount":1,"JsonPayload":null}]',N'VM1//LM/W3SVC/1/ROOT/AutomallApiServer [P30368/D4] C7AD08E675374F10B488EB0EA6D61579',3);
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [umbracoConsent] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoLock] ON;
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (-331,-1,N'Servers');
GO
SET IDENTITY_INSERT [umbracoLock] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,-1,{ts '2018-08-19 14:58:40.713'},N'PackagerInstall',N'Package ''Export SQL Server Compact'' installed. Package guid: bf31305f-ae50-400c-9fdb-9ed19cae73be');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (2,0,-1,{ts '2018-08-19 14:58:58.443'},N'Save',N'Save ContentTypes performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoMigration] ON;
GO
INSERT INTO [umbracoMigration] ([id],[name],[createDate],[version]) VALUES (1,N'Umbraco',{ts '2018-08-01 23:24:19.237'},N'7.11.1');
GO
SET IDENTITY_INSERT [umbracoMigration] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2018-08-01 23:24:04.893'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2018-08-01 23:24:04.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2018-08-01 23:24:04.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.903'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-95,0,-1,0,1,N'-1,-95',2,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-96,0,-1,0,1,N'-1,-96',2,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-97,0,-1,0,1,N'-1,-97',2,'aa2c52a0-ce87-4e65-a47c-7df09358585d',N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1044,0,-1,0,1,N'-1,1044',0,'d59be02f-1df9-4228-aa1e-01917d806cda',N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2018-08-01 23:24:04.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1046,0,-1,0,1,N'-1,1046',2,'fd1e0da5-5606-4862-b679-5d0cf3a52a59',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1047,0,-1,0,1,N'-1,1047',2,'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1048,0,-1,0,1,N'-1,1048',2,'135d60e0-64d9-49ed-ab08-893c9ba44ae5',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1049,0,-1,0,1,N'-1,1049',2,'9dbbcbbb-2327-434a-b355-af1b84e5010a',N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1050,0,-1,0,1,N'-1,1050',2,'b4e3535a-1753-47e2-8568-602cf8cfee6f',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-08-01 23:24:04.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1060,0,-1,0,1,N'-1,1060',0,'a7f5c211-4b7e-4bfe-8e46-7f9c0470153c',N'TestUser','39eb0f98-b348-42a1-8662-e7eb18487560',{ts '2018-08-01 23:40:36.153'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1061,0,-1,0,0,N'-1,1061',0,'e35146dc-539d-47b3-be16-722ffa122b44',N'Role1','366e63b9-880f-4e13-a61c-98069b029728',{ts '2018-08-01 23:40:57.627'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1062,0,-1,0,0,N'-1,1062',0,'19221705-9438-405d-a2a9-e84a1f12c1a1',N'Role2','366e63b9-880f-4e13-a61c-98069b029728',{ts '2018-08-01 23:41:02.897'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1063,0,-1,0,0,N'-1,1063',0,'ff186183-b68c-4192-b14f-0b54b4ac269e',N'OkiToki','366e63b9-880f-4e13-a61c-98069b029728',{ts '2018-08-06 20:23:33.277'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1064,0,-1,0,1,N'-1,1064',1,'0d74f422-ff63-4cb1-90d7-8bdbf3860aea',N'Oki','39eb0f98-b348-42a1-8662-e7eb18487560',{ts '2018-08-06 20:26:04.143'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1065,0,-1,0,0,N'-1,1065',0,'ad5967d2-448d-4df1-8360-448663825da8',N'Eurogarage','366e63b9-880f-4e13-a61c-98069b029728',{ts '2018-08-07 09:37:35.747'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1066,0,-1,0,1,N'-1,1066',2,'b7ab6572-9146-4824-a658-dfea30cf3219',N'1CTest','39eb0f98-b348-42a1-8662-e7eb18487560',{ts '2018-08-07 09:42:44.077'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,'4cbeb612-e689-3563-b755-bf3ede295433',1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (2,'0cc3507c-66ab-3091-8913-3d998148e423',0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (1,N'http://localhost:63840/umbraco',N'DESKTOP-I3EQPG2//LM/W3SVC/2/ROOT',{ts '2018-08-01 23:24:44.763'},{ts '2018-08-02 00:27:19.447'},0,0);
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (2,N'http://localhost:63840/umbraco',N'VM1//LM/W3SVC/2/ROOT',{ts '2018-08-03 09:41:48.677'},{ts '2018-08-19 14:59:43.653'},1,1);
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (3,N'http://webmall.md:80/AutomallApiServer/umbraco',N'VM1//LM/W3SVC/1/ROOT/AutomallApiServer',{ts '2018-08-06 23:10:03.363'},{ts '2018-08-19 09:32:31.920'},0,0);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (0,0,0,N'Valentin',N'valentin.gushan@gmail.com',N'efv1imv0epl5aoSBrqm43g==eBwFBjVpJ38Rmrri+4kQV2bqQhBNqMd+5EgJ9Z0VY6w=',N'{"hashAlgorithm":"HMACSHA256"}',N'valentin.gushan@gmail.com',N'en-US',N'1adde49f-50f6-455f-aab3-314c6e21c820',0,NULL,{ts '2018-08-01 23:24:23.617'},{ts '2018-08-19 14:57:34.483'},NULL,NULL,{ts '2018-08-01 23:24:15.340'},{ts '2018-08-19 14:57:34.607'},NULL,N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]');
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,1);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,5);
GO
SET IDENTITY_INSERT [umbracoUserGroup] ON;
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7ï',{ts '2018-08-01 23:24:20.203'},{ts '2018-08-01 23:24:20.203'},N'icon-medal',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (2,N'writer',N'Writers',N'CAH:F',{ts '2018-08-01 23:24:20.207'},{ts '2018-08-01 23:24:20.207'},N'icon-edit',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5Fï',{ts '2018-08-01 23:24:20.207'},{ts '2018-08-01 23:24:20.207'},N'icon-tools',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (4,N'translator',N'Translators',N'AF',{ts '2018-08-01 23:24:20.207'},{ts '2018-08-01 23:24:20.207'},N'icon-globe',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (5,N'sensitiveData',N'Sensitive data',N'',{ts '2018-08-01 23:24:20.207'},{ts '2018-08-01 23:24:20.207'},N'icon-lock',-1,-1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] OFF;
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'developer');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'member');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'settings');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'users');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (2,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (4,N'translation');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('69adb5d3-33f6-41a1-84be-2c887a39066f',0,{ts '2018-08-01 20:24:25.440'},{ts '2018-08-01 20:40:57.523'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('6d9a06b3-8025-4be4-a4f1-43dc9802d707',0,{ts '2018-08-01 20:41:14.463'},{ts '2018-08-01 20:41:14.463'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('20f1683b-7af8-4190-a297-1e08d9916808',0,{ts '2018-08-01 20:41:21.277'},{ts '2018-08-01 20:41:21.277'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('a96d403e-0f99-4ca3-bd22-481cb7e92217',0,{ts '2018-08-01 21:08:25.020'},{ts '2018-08-01 21:11:40.077'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('ec8df377-a661-4cfb-b2ac-6614e32dcd3a',0,{ts '2018-08-05 19:52:21.383'},{ts '2018-08-05 19:57:28.540'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('25fd44f9-6fe7-4658-a961-4042230e5aee',0,{ts '2018-08-06 17:21:21.687'},{ts '2018-08-06 17:53:04.600'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('a4a98d04-6b60-4454-9045-30c4c24ada10',0,{ts '2018-08-06 20:05:11.750'},{ts '2018-08-06 20:10:35.653'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('c7c650cd-ef1d-455b-8510-b875bf1bc088',0,{ts '2018-08-07 06:35:55.817'},{ts '2018-08-07 06:40:21.897'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7eba381e-0631-40e8-b1d7-3b28ae1222b7',0,{ts '2018-08-07 06:40:22.280'},{ts '2018-08-07 06:40:22.280'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('1361d76d-719d-490c-bcc9-f43c0062f292',0,{ts '2018-08-07 06:40:37.563'},{ts '2018-08-07 06:40:37.563'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('e5e4664c-21ce-4ee2-80c2-62d2f9d9d88e',0,{ts '2018-08-07 06:40:49.680'},{ts '2018-08-07 06:40:49.680'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('c14aab0b-749d-43b5-ba7c-46190ea94554',0,{ts '2018-08-07 06:41:20.253'},{ts '2018-08-07 06:42:43.510'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('b55d9d0b-0e04-4595-aeb7-807b7bf98f42',0,{ts '2018-08-07 09:23:44.507'},{ts '2018-08-07 09:23:44.743'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('79723351-333c-4d2d-a0f4-13e4aaa5009c',0,{ts '2018-08-19 11:57:38.180'},{ts '2018-08-19 11:59:47.573'},NULL,N'::1');
GO
SET IDENTITY_INSERT [umbracoUserStartNode] OFF;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [PK_cmsMedia] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAudit] ADD CONSTRAINT [PK_umbracoAudit] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoConsent] ADD CONSTRAINT [PK_umbracoConsent] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLock] ADD CONSTRAINT [PK_umbracoLock] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMigration] ADD CONSTRAINT [PK_umbracoMigration] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [PK_user2userGroup] PRIMARY KEY ([userId],[userGroupId]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [PK_userGroup2App] PRIMARY KEY ([userGroupId],[app]);
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY ([userGroupId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY ([sessionId]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [PK_userStartNode] PRIMARY KEY ([id]);
GO
CREATE UNIQUE INDEX [IX_cmsContent] ON [cmsContent] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentType] ON [cmsContentType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE INDEX [IX_cmsContentVersion_ContentId] ON [cmsContentVersion] ([ContentId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentVersion_VersionId] ON [cmsContentVersion] ([VersionId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDataType_nodeId] ON [cmsDataType] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDictionary_id] ON [cmsDictionary] ([id] ASC);
GO
CREATE INDEX [IX_cmsDictionary_key] ON [cmsDictionary] ([key] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDocument] ON [cmsDocument] ([nodeId] ASC,[versionId] ASC);
GO
CREATE INDEX [IX_cmsDocument_newest] ON [cmsDocument] ([newest] ASC);
GO
CREATE INDEX [IX_cmsDocument_published] ON [cmsDocument] ([published] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacro_UniqueId] ON [cmsMacro] ([uniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroPropertyAlias] ON [cmsMacro] ([macroAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_Alias] ON [cmsMacroProperty] ([macro] ASC,[macroPropertyAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [cmsMacroProperty] ([uniquePropertyId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMedia] ON [cmsMedia] ([nodeId] ASC,[versionId] ASC,[mediaPath] ASC);
GO
CREATE INDEX [IX_cmsMember_LoginName] ON [cmsMember] ([LoginName] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyData_1] ON [cmsPropertyData] ([contentNodeId] ASC,[versionId] ASC,[propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyTypeAlias] ON [cmsPropertyType] ([Alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeUniqueID] ON [cmsPropertyType] ([UniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [cmsPropertyTypeGroup] ([uniqueID] ASC);
GO
CREATE INDEX [IX_cmsTags] ON [cmsTags] ([tag] ASC,[group] ASC);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId] ON [cmsTemplate] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccess_nodeId] ON [umbracoAccess] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccessRule] ON [umbracoAccessRule] ([ruleValue] ASC,[ruleType] ASC,[accessId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode] ON [umbracoLanguage] ([languageISOCode] ASC);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoMigration] ON [umbracoMigration] ([name] ASC,[version] ASC);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE INDEX [IX_umbracoNodePath] ON [umbracoNode] ([path] ASC);
GO
CREATE INDEX [IX_umbracoNodeTrashed] ON [umbracoNode] ([trashed] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoNodeUniqueID] ON [umbracoNode] ([uniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRedirectUrl] ON [umbracoRedirectUrl] ([urlHash] ASC,[contentKey] ASC,[createDateUtc] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelation_parentChildType] ON [umbracoRelation] ([parentId] ASC,[childId] ASC,[relType] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_alias] ON [umbracoRelationType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_name] ON [umbracoRelationType] ([name] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_UniqueId] ON [umbracoRelationType] ([typeUniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_computerName] ON [umbracoServer] ([computerName] ASC);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupAlias] ON [umbracoUserGroup] ([userGroupAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupName] ON [umbracoUserGroup] ([userGroupName] ASC);
GO
CREATE INDEX [IX_umbracoUser2NodePermission_nodeId] ON [umbracoUserGroup2NodePermission] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserStartNode_startNodeType] ON [umbracoUserStartNode] ([startNodeType] ASC,[startNode] ASC,[userId] ASC);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY ([ParentId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY ([startNode]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

