<%@ WebHandler Language="C#" Class="Handler2" %>

using System;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Api.Core.Helpers;
using System.IO;
using System.Data;
using System.Collections;
using System.Collections.Generic;
public class Handler2 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string json1 = "";
        string json2 = "";
        string json3 = "";

        JObject staff = new JObject();
        staff.Add(new JProperty("Name", "Jack"));
        staff.Add(new JProperty("Age", 33));
        staff.Add(new JProperty("Department", "Personnel Department"));
        staff.Add(new JProperty("Leader", new JObject(new JProperty("Name", "Tom"), new JProperty("Age", 44), new JProperty("Department", "Personnel Department"))));
        //Console.WriteLine(staff.ToString());
        string xx = staff.ToString();
        
        
        string url1 = "http://v.juhe.cn/historyWeather/province?key=02e75e4800826fc8b20f699c072b8adf";
        dynamic res = HttpHelper.HttpGet.GetResult(url1);
         JObject yy = new JObject();

         yy = JObject.FromObject(JsonHelper.Decode<qwer>(res.Content));

         context.Response.Write(yy);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    public class qwer
    {
        public string reason { get; set; }
        public dynamic result { get; set; }
    }

}