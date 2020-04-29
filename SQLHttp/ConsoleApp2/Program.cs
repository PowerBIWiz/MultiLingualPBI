using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            string URI = "https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=fr";

            using (WebClient wc = new WebClient())
            {
                wc.Headers[HttpRequestHeader.ContentType] = "application/json; charset=UTF-8";
                wc.Headers.Add("Ocp-Apim-Subscription-Key", "e95fba12093d4e719cbeedadc9103509");
                string HtmlResult = wc.UploadString(URI, "[{'Text':'Hello, what is your name?'}]");
            }

         }
    }
}
