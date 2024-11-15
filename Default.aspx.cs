using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;

public partial class katzanya : System.Web.UI.Page
{
    public string Menu_Selection = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] == null)
        {
            Menu_Selection = "0";
        }
        else
        {
            Menu_Selection = Request.QueryString["Id"];
        }
        TransformarXML();
    }

    private void TransformarXML()
    {

        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "../xml/datos.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "../xslt/katzanya.xslt";

        XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);
        XmlUrlResolver resolver = new XmlUrlResolver();
        XsltSettings settings = new XsltSettings();
        XslCompiledTransform xslt = new XslCompiledTransform();
        XsltArgumentList xsltArgumentList = new XsltArgumentList();
        StringBuilder stringBuilder = new StringBuilder();
        TextWriter tWriter = new StringWriter(stringBuilder);
        
        resolver.Credentials = CredentialCache.DefaultCredentials;
        xslt.Load(xsltPath, settings, resolver);
        xsltArgumentList.AddParam("Menu_Selection", "", Menu_Selection);
        xslt.Transform(xmlTextReader, xsltArgumentList, tWriter);
        string resultado = stringBuilder.ToString();
        Response.Write(resultado);
    }
}