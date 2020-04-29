select dbo.http('http://icanhazip.com')
select dbo.posthttp('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr', '[{"Text":"Hello, what is your name?"}]', '<Cognitive Services API Key goes here>')
select dbo.translate_english_to_thislanguage('Would you like to have lunch with me?','fr',1) as col_translated

