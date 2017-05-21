using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace eatMe
{
    public partial class rezervasyonlarim1 : System.Web.UI.Page
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

            if (Session["userid"] != null)//kullanici giris yapmis mi?, kontrolu
            {
                rezervasyonListele();
            }
            else
            {
                Response.Redirect("anasayfa.aspx");
            }

        }

        protected void rezervasyonListele()
        {
            List<sp_getKullaniciRezervasyonlari_Result> lst_restoran = new List<sp_getKullaniciRezervasyonlari_Result>();
            int kullaniciID = Convert.ToInt32(Session["userid"]);
            lst_restoran = ent.sp_getKullaniciRezervasyonlari(kullaniciID).ToList();

            foreach (sp_getKullaniciRezervasyonlari_Result rez in lst_restoran)
            {
                HtmlGenericControl ctr = new HtmlGenericControl("div");
                HtmlGenericControl ctr2 = new HtmlGenericControl("div");
                Label lb = new Label();
                Label lb2 = new Label();
                ctr.Attributes["class"] = "rezItem";
                lb.ID = "rezv-" + rez.RestoranID + "." + rez.ID.ToString();
                lb.Text = ent.sp_getRestoranAdi(rez.RestoranID).ToList().First().Isim;
                lb.Attributes["class"] = "restaurantName";
                lb2.Attributes["class"] = "rezTarih";
                lb2.Text = rez.Tarih.ToShortDateString();
                ctr2.Controls.Add(lb2);
                ctr2.Controls.Add(lb);
                ctr.Controls.Add(ctr2);

                ph_rezervasyonlar.Controls.Add(ctr);
            }
        }
    }
}