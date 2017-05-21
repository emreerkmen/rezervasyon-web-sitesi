using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI.HtmlControls;

namespace eatMe
{
    public partial class restoranlar1 : System.Web.UI.Page
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

            if (Request.QueryString["restid"] != null)//restoran sayfasina mi gidecek 
            {
                int restoranID = Convert.ToInt32(Request.QueryString["restid"]);
                bosYerSayisi(restoranID);
                masaGetir(restoranID);
                menuDoldur(restoranID);
            }
            else//yoksa tum restoranlari mi getirecek
            {
                restoranlariGetir();
            }
        }

        protected void restoranlariGetir()
        {
            List<sp_getRestoran_Result> lst_restoran = new List<sp_getRestoran_Result>();
            lst_restoran = ent.sp_getRestoran().ToList();
            foreach (sp_getRestoran_Result rest in lst_restoran)
            {
                HtmlGenericControl ctr = new HtmlGenericControl("div");
                HtmlGenericControl ctr2 = new HtmlGenericControl("div");
                Label lb = new Label();
                Label lb2 = new Label();
                ctr.Attributes["class"] = "restItem";
                lb.ID = "rest-" + rest.ID.ToString() + ".";
                lb.Text = rest.Isim;
                lb.Attributes["class"] = "restaurantName";
                lb2.Attributes["class"] = "anlikKapasite";
                lb2.Text = rest.AnlikKapasite.ToString();
                lb2.ToolTip = rest.AnlikKapasite + " kişilik boş yer mevcut";
                ctr2.Controls.Add(lb2);
                ctr2.Controls.Add(lb);
                ctr.Controls.Add(ctr2);

                ph_restoranlar.Controls.Add(ctr);
            }
        }

        protected void bosYerSayisi(int restoranID)
        {
            List<sp_getTekRestoran_Result> lst_restoran = new List<sp_getTekRestoran_Result>();
            lst_restoran = ent.sp_getTekRestoran(restoranID).ToList();
            HtmlGenericControl ctrl = new HtmlGenericControl("div");
            ctrl.Attributes["class"] = "head";
            ctrl.InnerHtml = lst_restoran.First().Isim + " mekanında şu anda " + lst_restoran.First().AnlikKapasite + " kişilik boş yer bulunmaktadır.";
            ph_tekMasaHead.Controls.Add(ctrl);
        }

        protected void masaGetir(int restoranID)
        {
            List<sp_getMasa_Result> lst_masa = new List<sp_getMasa_Result>();
            lst_masa = ent.sp_getMasa(restoranID).ToList();

            HtmlGenericControl masa_ctrEk = new HtmlGenericControl("div");
            masa_ctrEk.InnerText = "Kişi sayısı: ";
            masa_ctrEk.Attributes["style"] = "float:left;margin-left: 20px;margin-top:4px;";

            HtmlGenericControl masa_ctrEk2 = new HtmlGenericControl("input");
            masa_ctrEk2.ID = "kisiSayisi";
            masa_ctrEk2.Attributes["name"] = "kisiSayisi";
            masa_ctrEk2.Attributes["type"] = "text";
            masa_ctrEk2.Attributes["style"] = "float: left;width: 30px;margin-left: 5px;padding: 5px;border-radius: 3px;border-style: groove;";

            HtmlGenericControl masa_ctr = new HtmlGenericControl("div");
            HtmlGenericControl masa_ctrEk3 = new HtmlGenericControl("div");

            masa_ctr.Attributes["style"] = "padding-top:30px;padding-left:18px;padding-bottom:10px;";
            masa_ctrEk3.InnerHtml = "Rezervasyon saati: ";
            masa_ctrEk3.Attributes["style"] = "float: left;margin-top:4px;";
            HtmlGenericControl masa_ctrEk4 = new HtmlGenericControl("div");

            masa_ctrEk4.Attributes["class"] = "rezBilgi";
            ddl_saat.Visible = true;
            btn_rezervasyonYap.Visible = true;

            masa_ctrEk4.Controls.Add(masa_ctrEk3);
            masa_ctrEk4.Controls.Add(ddl_saat);

            masa_ctrEk4.Controls.Add(masa_ctrEk);
            masa_ctrEk4.Controls.Add(masa_ctrEk2);
            masa_ctr.Controls.Add(masa_ctrEk4);
            masa_ctr.Controls.Add(btn_rezervasyonYap);

            ph_tekMasa.Controls.Add(masa_ctr);
            int bosMasa = 0;
            int i = 0;
            int toplamMasaSayisi = Convert.ToInt32(lst_masa.Count);
            foreach (sp_getMasa_Result masa in lst_masa)
            {
                if (masa.Bos)
                {
                    i++;
                    bosMasa += masa.Kapasite;
                    HtmlGenericControl masa_ctr2 = new HtmlGenericControl("div");
                    masa_ctr2.Attributes["class"] = "tekMasa";

                    HtmlGenericControl masa_ctr3 = new HtmlGenericControl("div");
                    masa_ctr3.Attributes["class"] = "kapasite";
                    masa_ctr3.InnerHtml = masa.Kapasite.ToString() + " kişilik";

                    HtmlGenericControl masa_ctr4 = new HtmlGenericControl("div");
                    masa_ctr4.Attributes["class"] = "masaNo";
                    masa_ctr4.InnerHtml = "Masa " + masa.No.ToString();
                    masa_ctr2.Controls.Add(masa_ctr3);
                    masa_ctr2.Controls.Add(masa_ctr4);

                    ph_tekMasa.Controls.Add(masa_ctr2);

                    if (i % 4 == 0 || i == toplamMasaSayisi)
                    {
                        HtmlGenericControl masa_ctr5 = new HtmlGenericControl("div");
                        masa_ctr5.Attributes["style"] = "clear: both;";

                        if (i == toplamMasaSayisi)
                            masa_ctr5.Attributes["style"] = "clear:both;border:1px solid black";
                        ph_tekMasa.Controls.Add(masa_ctr5);
                    }
                }
                else
                    toplamMasaSayisi--;
            }
        }

        protected void menuDoldur(int restoranID)
        {
            HtmlGenericControl menu_ctr = new HtmlGenericControl("div");
            menu_ctr.Attributes["class"] = "siparis";

            HtmlGenericControl menu_ctr2 = new HtmlGenericControl("span");
            menu_ctr2.Attributes["class"] = "siparisVer";
            menu_ctr2.InnerHtml = "Restorana gitmeden önce sipariş ver";

            HtmlGenericControl menu_ctr3 = new HtmlGenericControl("div");
            menu_ctr3.Attributes["class"] = "menuWithHeader";
            menu_ctr3.Attributes["style"] = "display:none;";

            HtmlGenericControl menu_ctr4 = new HtmlGenericControl("div");
            menu_ctr4.Attributes["class"] = "menuBaslik";
            menu_ctr4.InnerHtml = "Menü";

            HtmlGenericControl menu_ctr5 = new HtmlGenericControl("div");
            menu_ctr5.Attributes["class"] = "menu";

            List<sp_getMenu_Result> lst_menu = new List<sp_getMenu_Result>();
            lst_menu = ent.sp_getMenu(restoranID).ToList();

            foreach (sp_getMenu_Result urun in lst_menu)
            {
                HtmlGenericControl menu_ctr6 = new HtmlGenericControl("div");
                menu_ctr6.Attributes["class"] = "item";

                CheckBox chcbox = new CheckBox();
                chcbox.ID = "item" + urun.ID;
                chcbox.Text = urun.Isim;

                HtmlGenericControl menu_ctr8 = new HtmlGenericControl("input");
                menu_ctr8.Attributes["class"] = "adet";
                menu_ctr8.ID = "adet" + urun.ID;
                menu_ctr8.Attributes["name"] = "adet" + urun.ID;
                menu_ctr8.Attributes["type"] = "text";

                menu_ctr6.Controls.Add(chcbox);
                menu_ctr6.Controls.Add(menu_ctr8);

                menu_ctr5.Controls.Add(menu_ctr6);
            }
            menu_ctr3.Controls.Add(menu_ctr4);
            menu_ctr3.Controls.Add(menu_ctr5);

            menu_ctr.Controls.Add(menu_ctr2);
            menu_ctr.Controls.Add(menu_ctr3);

            ph_siparis.Controls.Add(menu_ctr);

            Session["siparis"] = ph_siparis;
        }

        [WebMethod]
        public static string gotoRest(int ID)
        {
            return "restoranlar.aspx?restid=" + ID;
        }

        [WebMethod]
        public static void masaSec(int masaNo, int kapasite)
        {
            HttpContext.Current.Session["masaNo"] = masaNo;
            HttpContext.Current.Session["masaKapasite"] = kapasite;
        }

        protected void btn_rezervasyonYap_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["userid"]);
            if (userID != 0)//kullanici giris yapmissa
            {

                if (Request.Form["kisiSayisi"] != "")
                {
                    if (Session["masaNo"] != null)//masa secimi yapilmissa
                    {
                        int masaNo;
                        masaNo = (int)Session["masaNo"];
                        int kapasite;
                        kapasite = (int)Session["masaKapasite"];

                        if (kapasite < Convert.ToInt32(Request.Form["kisiSayisi"]))
                        {
                            Page.ClientScript.RegisterStartupScript(
                                GetType(),
                                "kapasiteErr",
                                "alert('Masa kapasitesini asmayacak sekilde giris yapiniz.');",
                                true);
                            return;
                        }

                        PlaceHolder ph = new PlaceHolder();
                        ph = (PlaceHolder)Session["siparis"];

                        int kisiSayisi = Convert.ToInt32(Request.Form["kisiSayisi"]);
                        int restoranID = Convert.ToInt32(Request.QueryString["restid"]);

                        ent.sp_rezervasyonYap(restoranID, userID, kisiSayisi, DateTime.Today, masaNo);//rezervasyon yapiliyor...
                        ent.sp_masaAyarla(masaNo, restoranID, false, Convert.ToInt32(ddl_saat.Text));//masa dolduruluyor...
                        ent.sp_anlikKapasiteAyarla(restoranID, kapasite, false);

                        int rezervasyonID = ent.sp_getRezervasyonID().ToList().First().ID;
                        bool urunSecilmemis = false;

                        foreach (HtmlGenericControl hgc in ph.Controls)
                        {
                            int i = 0;
                            foreach (HtmlGenericControl hgc2 in hgc.Controls)
                            {
                                i++;
                                if (i == 2)
                                    foreach (HtmlGenericControl hgc3 in hgc2.Controls)
                                    {
                                        i++;
                                        if (i == 4)
                                        {
                                            i = 0;
                                            foreach (HtmlGenericControl hgc4 in hgc3.Controls)
                                            {
                                                i++;
                                                string id = "item" + i;
                                                Control ctr = new Control();
                                                ctr = hgc4.FindControl(id);
                                                if (((CheckBox)ctr).Checked)
                                                {
                                                    id = "adet" + i;
                                                    if (Request.Form[id] != "")
                                                    {
                                                        string val = Request.Form[id];
                                                        int adet = Convert.ToInt32(Request.Form[id]);

                                                        ent.sp_siparisAl(rezervasyonID, restoranID, userID, i, adet);//siparisler aliniyor...
                                                    }
                                                    else
                                                    {
                                                        urunSecilmemis = true;
                                                    }
                                                }
                                            }

                                        }
                                    }
                            }
                        }
                        if (urunSecilmemis)
                        {
                            Page.ClientScript.RegisterStartupScript(
                                GetType(),
                                "masaSecReq",
                                "alert('Rezervasyon yapilamadi. Sectiginiz urunler icin adet girmelisiniz.');",
                                true);
                            ent.sp_masaAyarla(masaNo, restoranID, true, null);//masa tekrar bosaltiliyor...
                            ent.sp_rezervasyonIptal(rezervasyonID);//rezervasyon iptal ediliyor...
                            ent.sp_anlikKapasiteAyarla(restoranID, kapasite, true);//anlik kapasite degisimi geri aliniyor...
                            return;
                        }
                        
                        Response.Redirect("restoranlar.aspx?restid=" + restoranID);
                    }
                    else//masa secimi yapilmamissa
                    {
                        Page.ClientScript.RegisterStartupScript(
                        GetType(),
                        "masaSecReq",
                        "alert('Lutfen masa seciniz.');",
                        true);
                    }
                }
                else//kisi sayisi girilmemisse
                {
                    Page.ClientScript.RegisterStartupScript(
                        GetType(),
                        "kisiSayisiReq",
                        "alert('Kisi sayisi girilmelidir.');",
                        true);
                }
            }
            else//kullanici giris yapmamissa
            {
                Page.ClientScript.RegisterStartupScript(
                    GetType(),
                    "girisReq",
                    "alert('Kullanici girisi yapmadan rezervasyon yapilamaz.');",
                    true);
            }
        }

        protected void lb_profil_Click(object sender, EventArgs e)
        {
            Response.Redirect("profil.aspx");
        }

        protected void lb_restoranlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("restoranlar.aspx");
        }

        protected void lb_menuler_Click(object sender, EventArgs e)
        {
            Response.Redirect("menuler.aspx");
        }
    }
}