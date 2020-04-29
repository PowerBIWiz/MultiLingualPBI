EXEC sp_changedbowner 'sa'
ALTER DATABASE AdventureWorksDW2017 SET trustworthy ON

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO
DROP FUNCTION [dbo].[http];
GO
DROP FUNCTION [dbo].[posthttp];
GO

CREATE FUNCTION [dbo].[http] (@url [nvarchar](MAX))
RETURNS [nvarchar](MAX)
AS EXTERNAL NAME [HttpDb].[UserDefinedFunctions].[http];

CREATE FUNCTION [dbo].[posthttp] (@url [nvarchar](MAX), @valueToTranslate [nvarchar](MAX), @subsriptionKey [nvarchar](MAX))
RETURNS [nvarchar](MAX)
AS EXTERNAL NAME [HttpDb].[UserDefinedFunctions].[posthttp];

DROP FUNCTION [dbo].[translate_english_to_thislanguage]

CREATE FUNCTION [dbo].[translate_english_to_thislanguage] (@englishstring [nvarchar](MAX), @thislanguage [nvarchar](MAX), @verbose [bit] = 0)
RETURNS [nvarchar](MAX)
AS
BEGIN
 IF @verbose = 0 RETURN JSON_VALUE(dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to='+@thislanguage, '[{"Text":"'+ @englishstring + '"}]', '<Cognitive Services API Key goes here>'),'$[0].translations[0].text');
 RETURN dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to='+@thislanguage, '[{"Text":"'+ @englishstring + '"}]', '<Cognitive Services API Key goes here>')
END;

select dbo.http('http://icanhazip.com')
select dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr', '[{"Text":"Hello, what is your name?"}]', '<Cognitive Services API Key goes here>')
select dbo.translate_english_to_thislanguage('Would you like to have lunch with me?','fr',1) as col_translated

