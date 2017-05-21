using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eatMe.MasterPage
{
    public partial class master : System.Web.UI.MasterPage
    {
        EatMeEntities2 ent = new EatMeEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                pnl_girisYapilmamis.Visible = false;
                pnl_girisYapilmis.Visible = true;

                List<sp_getKullaniciBilgisi_Result> lst = new List<sp_getKullaniciBilgisi_Result>();
                string id = Session["userid"].ToString();
                lst = ent.sp_getKullaniciBilgisi(Convert.ToInt32(id)).ToList();

                lbl_kullaniciIsim.Text = "Merhaba " + lst.First().Isim + " " + lst.First().Soyisim;
            }
            else
            {

            }
        }

        protected void btn_girisYap_Click(object sender, EventArgs e)
        {
            List<sp_girisYap_Result> lst = new List<sp_girisYap_Result>();
            lst = ent.sp_girisYap(txt_kullaniciAdi.Text, txt_sifre.Text).ToList();

            if (lst.Count == 1)//giris basarili
            {
                Session["userid"] = lst.First().ID;
                pnl_girisYapilmamis.Visible = false;
                pnl_girisYapilmis.Visible = true;

                lbl_kullaniciIsim.Text = "Merhaba " + lst.First().Isim + " " + lst.First().Soyisim;
            }
            else
            {
                Session["userid"] = null;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "basarisizGiris", "alert('Kullanici adi veya parola hatali.')", true);
            }
        }

        protected void btn_cikisYap_Click(object sender, EventArgs e)
        {
            Session["userid"] = null;
            Session["siparis"] = null;
            Session["masaNo"] = null;
            Session["masaKapasite"] = null;
            pnl_girisYapilmamis.Visible = true;
            pnl_girisYapilmis.Visible = false;
            Response.Redirect("anasayfa.aspx");
        }

        protected void lb_profil_Click(object sender, EventArgs e)
        {
            Response.Redirect("profil.aspx");
        }

        protected void lb_temaDegis_Click(object sender, EventArgs e)
        {
            HttpCookie preftheme = new HttpCookie("preftheme");
            preftheme.Expires = DateTime.Now.AddMonths(3);
            preftheme.Value = Session["theme"].ToString();
            Response.Cookies.Add(preftheme);
            Response.Redirect(Request.Url.ToString());
        }
    }
}