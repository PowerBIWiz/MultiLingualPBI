USE master;
GO

EXEC sp_changedbowner 'sa'
ALTER DATABASE [AdventureWorksDW2017] SET trustworthy ON

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO

-- Create assembly for dbo.posthttp manually before proceeding...

/*

DROP ASSEMBLY [HttpDb]
DROP FUNCTION [dbo].[http]

SELECT ROUTINE_NAME FROM information_schema.routines WHERE routine_type = 'function'

select dbo.http('http://icanhazip.com')

select dbo.http('POST https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr" -H "Ocp-Apim-Subscription-Key: e95fba12093d4e719cbeedadc9103509" -H "Content-Type: application/json; charset=UTF-8" -d "[{''Text'':''Hello, what is your name?''}]')

https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr" -H "Ocp-Apim-Subscription-Key: e95fba12093d4e719cbeedadc9103509" -H "Content-Type: application/json; charset=UTF-8" -d "[{'Text':'Hello, what is your name?'}]

select dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr" -H "Ocp-Apim-Subscription-Key: e95fba12093d4e719cbeedadc9103509" -H "Content-Type: application/json; charset=UTF-8" -d "[{''Text'':''Hello, what is your name?''}]','')
*/


USE [AdventureWorksDW2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimReportLanguage](
	[ReportLanguage] [varchar](40) NULL,
	[ReportLanguageCode] [varchar](10) NULL,
	[Is_Supported] [varchar](10) NULL
) ON [PRIMARY]
GO

USE [AdventureWorksDW2017]
GO
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Afrikaans','af','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Arabic','ar','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Bangla','bn','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Bosnian (Latin)','bs','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Bulgarian','bg','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Cantonese (Traditional)','yue','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Catalan','ca','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Chinese Simplified','zh-Hans','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Chinese Traditional','zh-Hant','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Croatian','hr','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Czech','cs','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Danish','da','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Dutch','nl','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('English','en','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Estonian','et','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Fijian','fj','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Filipino','fil','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Finnish','fi','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('French','fr','Yes');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('German','de','Yes');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Greek','el','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Haitian Creole','ht','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Hebrew','he','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Hindi','hi','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Hmong Daw','mww','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Hungarian','hu','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Icelandic','is','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Indonesian','id','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Irish','ga','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Italian','it','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Japanese','ja','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Kannada','kn','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Kiswahili','sw','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Klingon','tlh','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Klingon (plqaD)','tlh-Qaak','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Korean','ko','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Latvian','lv','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Lithuanian','lt','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Malagasy','mg','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Malay','ms','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Malayalam','ml','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Maltese','mt','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Maori','mi','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Norwegian','nb','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Persian','fa','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Polish','pl','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Portuguese (Brazil)','pt-br','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Portuguese (Portugal)','pt-pt','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Punjabi','pa','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Queretaro Otomi','otq','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Romanian','ro','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Russian','ru','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Samoan','sm','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Serbian (Cyrillic)','sr-Cyrl','Yes');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Serbian (Latin)','sr-Latn','Yes');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Slovak','sk','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Slovenian','sl','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Spanish','es','Yes');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Swedish','sv','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Tahitian','ty','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Tamil','ta','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Telugu','te','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Thai','th','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Tongan','to','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Turkish','tr','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Ukrainian','uk','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Urdu','ur','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Vietnamese','vi','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Welsh','cy','No');
INSERT INTO [dbo].[DimReportLanguage] ([ReportLanguage],[ReportLanguageCode],[Is_Supported]) VALUES ('Yucatec Maya','yua','No');

GO

USE [AdventureWorksDW2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_dim_supported_rpt_Language] AS
SELECT [ReportLanguage]
      ,[ReportLanguageCode]
  FROM [AdventureWorksDW2017].[dbo].[DimReportLanguage]
  WHERE [Is_Supported] = 'Yes'
GO

USE [AdventureWorksDW2017]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[posthttp](@url [nvarchar](max), @valueToTranslate [nvarchar](max), @subsriptionKey [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [HttpDb].[UserDefinedFunctions].[posthttp]
GO

USE [AdventureWorksDW2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[translate_english_to_thislanguage] (@englishstring [nvarchar](MAX), @thislanguage [nvarchar](MAX), @verbose [bit] = 0)
RETURNS [nvarchar](MAX)
AS
BEGIN
 IF @verbose = 0 RETURN JSON_VALUE(dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to='+@thislanguage, '[{"Text":"'+ @englishstring + '"}]', '<Your Cognitive Services Key Here>'),'$[0].translations[0].text');
 RETURN dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to='+@thislanguage, '[{"Text":"'+ @englishstring + '"}]', '<Your Cognitive Services Key Here>')
END;
GO

USE [AdventureWorksDW2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vFactSurveyResponse] AS
SELECT [ReportLanguage]
      ,[ReportLanguageCode]
      ,[SurveyResponseKey]
      ,[DateKey]
      ,dbo.translate_english_to_thislanguage([EnglishProductCategoryName],[ReportLanguageCode],DEFAULT) ProductCategoryName_UL
      ,dbo.translate_english_to_thislanguage([EnglishProductSubcategoryName],[ReportLanguageCode],DEFAULT) ProductSubcategoryName_UL
      ,[Date]
  FROM -- Cartesion join is intentional/necessary, Power BI RLS will filter out the duplicates.
       (SELECT TOP (100) * FROM [AdventureWorksDW2017].[dbo].[FactSurveyResponse]) AS x
      ,[AdventureWorksDW2017].[dbo].[v_dim_supported_rpt_Language]
GO


