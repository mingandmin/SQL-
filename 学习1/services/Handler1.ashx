<%@ WebHandler Language="C#" Class="Handler1" %>

using System;
using System.Web;
using Api.Core.Helpers;
using System.IO;
using System.Data;
using System.Collections;
using System.Collections.Generic;
public class Handler1 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string url1 = "http://v.juhe.cn/historyWeather/province?key=02e75e4800826fc8b20f699c072b8adf";
        dynamic res = HttpHelper.HttpGet.GetResult(url1);

        string url2 = "http://v.juhe.cn/WNXG/city?key=b10533dc7bd540b2a9106ee010ea5e89";
        dynamic res2 = HttpHelper.HttpGet.GetResult(url2);
       
        zm zm = new zm();
        zm.zzz = "11";
        zm.ddy = JsonHelper.Decode<qwer>(res.Content);
        zm.zzm = JsonHelper.Decode<qwer>(res2.Content);
        
        string xxstr = JsonHelper.Encode(zm);
        context.Response.Write(xxstr);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
   

    public class zm {
        public string zzz { get; set; }
        public string mmm { get; set; }
        public dynamic ddy { get; set; }
        public dynamic zzm { get; set; }
    }

    public class qwer {
        public string reason { get; set; }
        public dynamic result { get; set; }
    }

}
