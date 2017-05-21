using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eatMe
{
    public partial class yeniKayit : System.Web.UI.Page
    {
        EatMeEntities2 ent = new EatMeEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_KayitOl_Click(object sender, EventArgs e)
        {
            try
            {
                ent.sp_yeniKullanici(txt_kullaniciAdi.Text, txt_sifre.Text,
                txt_isim.Text, txt_soyisim.Text, txt_telefonNo.Text);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "basariliKayit", "basariliKayit()", true);

                txt_isim.Text = string.Empty;
                txt_kullaniciAdi.Text = string.Empty;
                txt_sifre.Text = string.Empty;
                txt_sifreTekrar.Text = string.Empty;
                txt_soyisim.Text = string.Empty;
                txt_telefonNo.Text = string.Empty;
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }

        //protected void txt_kullaniciAdi_TextChanged(object sender, EventArgs e)
        //{
        //    List<sp_kullaniciAdiKontrol_Result> lst = new List<sp_kullaniciAdiKontrol_Result>();
        //    lst = ent.sp_kullaniciAdiKontrol(txt_kullaniciAdi.Text).ToList();
        //    if (lst.Count == 1)
        //    {
        //        //string script = "<script type='text/javascript'>uyari();</script>";
        //        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uyari()", true);
        //    }
        //    else
        //    {
                
        //    }
        //}
    }
}