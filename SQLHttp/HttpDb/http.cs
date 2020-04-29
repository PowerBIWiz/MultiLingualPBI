using System.Data.SqlTypes;
using System.Net;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString http(SqlString url)
    {
        var wc = new WebClient();
        var html = wc.DownloadString(url.Value);
        return new SqlString (html);
    }

    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString posthttp(SqlString url, SqlString valueToTranslate, SqlString subscriptionKey)
    {
        string html;
        using (WebClient wc = new WebClient())
        {
            wc.Headers[HttpRequestHeader.ContentType] = "application/json; charset=UTF-8";
            wc.Headers.Add("Ocp-Apim-Subscription-Key", subscriptionKey.Value);
            html = wc.UploadString(url.Value, valueToTranslate.Value);
        }
        return new SqlString(html);
    }
}
