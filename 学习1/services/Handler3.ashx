<%@ WebHandler Language="C#" Class="Handler3" %>

using System;
using System.Web;
using Newtonsoft.Json.Linq;
using System.Linq;
using System.Collections.Generic;

public class Handler3 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string json = "{\"Name\" : \"Jack\", \"Age\" : 34, \"Colleagues\" : [{\"Name\" : \"Tom\" , \"Age\":44},{\"Name\" : \"Abel\",\"Age\":29}] }";
        
       // StringBuilder   MyStringBuilder   =   new   StringBuilder("Hello   World!"); 
        //JObject method = JObject.FromObject(context.Request["xx"]);
        
        byte[] byts = new byte[context.Request.InputStream.Length];
        context.Request.InputStream.Read(byts, 0, byts.Length);
       // System.Text.Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
        string req = System.Text.Encoding.UTF8.GetString(byts);
       
        string zmobj = context.Server.UrlDecode(req);

        JObject jObj = JObject.Parse(req);
        
        //string xxobj = context.Request.Params["xx"].ToString();
        //string xxstr = xxobj.ToString();
        //JObject jObj = JObject.Parse(xxobj);
        //var names = jObj.SelectToken("teacher").Select(p => p["name"]).ToList();
        //string namestr = "";
        //foreach (var name in names)
        //    namestr += name + "#";
        context.Response.Write(jObj.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}