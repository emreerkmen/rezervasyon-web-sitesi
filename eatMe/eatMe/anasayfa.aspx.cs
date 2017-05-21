using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eatMe
{
    public partial class mastercontent : System.Web.UI.Page
    {
        protected void Page_PreInit(Object sender, EventArgs e)
        {
            HttpCookie preftheme = Request.Cookies.Get("preftheme");
            if (preftheme != null)
                if (preftheme.Value == "OTHERTheme")
                {
                    Page.Theme = "REDTheme";
                    preftheme.Value = Page.Theme;
                    Session["theme"] = preftheme.Value;
                }
                else
                {
                    Page.Theme = "OTHERTheme";
                    preftheme.Value = Page.Theme;
                    Session["theme"] = preftheme.Value;
                }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string selectedTheme = Page.Theme;
                HttpCookie preftheme = Request.Cookies.Get("preftheme");
                if (preftheme != null)
                    selectedTheme = preftheme.Value;
            }
        }
    }
}