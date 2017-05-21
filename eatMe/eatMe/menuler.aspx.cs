using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eatMe
{
    public partial class menuler : System.Web.UI.Page
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
    }
}