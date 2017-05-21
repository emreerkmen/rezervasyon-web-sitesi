using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eatMe
{
    public partial class profil1 : System.Web.UI.Page
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

        EatMeEntities2 ent = new EatMeEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string selectedTheme = Page.Theme;
                HttpCookie preftheme = Request.Cookies.Get("preftheme");
                if (preftheme != null)
                    selectedTheme = preftheme.Value;
            }

            if (Session["userid"] != null)//kullanici giris yapmissa
            {
                string id = Session["userid"].ToString();

                List<sp_getKullaniciBilgisi_Result> userlst = new List<sp_getKullaniciBilgisi_Result>();
                userlst = ent.sp_getKullaniciBilgisi(Convert.ToInt32(id)).ToList();
                
                txt_kullaniciAdi.Text = userlst.First().KullaniciAdi;

                txt_isim.Text = userlst.First().Isim;
                txt_soyisim.Text = userlst.First().Soyisim;
                txt_telefonNo.Text = userlst.First().TelefonNo;
            }
            else//kullanici giris yapmamissa
            {
                Response.Redirect("anasayfa.aspx");
                //yeniKullanici.aspx sayfasinin acilmasi lazım ama kucuk pencerede
            }
        }
    }
}