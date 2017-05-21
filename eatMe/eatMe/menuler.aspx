<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menuler.aspx.cs" Inherits="eatMe.menuler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eat Me! - Menüler</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="shortcut icon" href="Images/adam.ico">
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <header class="top">
		    <a href="defaultPage.aspx">
			    <img alt="EAT ME!" src="Images/adam.png" style="height:190px;margin-left:90px;float:left;">
		    </a>
            <div class="login-signin" style="margin-right: 212px;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnl_girisYapilmamis" runat="server">
                            <asp:Label ID="lbl_kullaniciAdi" CssClass="lbl" runat="server" Text="Kullanıcı Adı:"></asp:Label>
                            <asp:TextBox ID="txt_kullaniciAdi" CssClass="text" runat="server"></asp:TextBox><br />
                            <asp:Label ID="lbl_sifre" CssClass="lbl" runat="server" Text="Şifre:"></asp:Label>
                            <asp:TextBox ID="txt_sifre" TextMode="Password" CssClass="text" runat="server"></asp:TextBox><br />
                            <asp:Button ID="btn_girisYap" CssClass="btn" runat="server" Text="Giriş Yap" />
                            <div class="signin">
                                <span style="font-size:13px; font-family:Tahoma;">Üye değil misin?</span>
                                <a id="kayitol" onclick="yeniKayit()" class="lbl" style="text-decoration:underline;margin-left:0;vertical-align:inherit;">Kayıt Ol!</a>
                            </div>
                        </asp:Panel>
                   
                        <asp:Panel ID="pnl_girisYapilmis" runat="server" Visible="false">
                            <div style="width: 297.63px; height: 117px; text-align:left;">
                                <div id="profil-ekrani" style="float:left">
                                    <asp:Label ID="lbl_kullaniciIsim" runat="server" CssClass="profil isim" Text=""></asp:Label><br />
                                    <a href="profil.aspx">
                                        <asp:LinkButton ID="lb_profil" CssClass="profil" runat="server" >Profil</asp:LinkButton><br />
                                    </a>
                                    <a href="#">
                                        <asp:Label ID="lbl_restoranlar" runat="server" CssClass="profil" Text="Restoranlarım"></asp:Label><br />
                                    </a>
                                    <a href="#">
                                        <asp:Label ID="lbl_rezervasyonlar" runat="server" CssClass="profil" Text="Rezervasyonlar"></asp:Label><br />
                                    </a>
                                    <asp:Button ID="btn_cikisYap" runat="server" CssClass="btn cikisbtn" 
                                        Text="Çıkış Yap" />
                                </div>
                                <img alt="Profil Resmi" src="Images/adam.png" style="float:right; height: 115px;"/>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        
                    </Triggers>
                </asp:UpdatePanel>
            </div>
		    <h1 class="header">EAT ME!</h1>
	    </header>
	    <nav class="nav">
		    <div class="nav-wrapper">
			    <ul class="doors">
				    <li><a href="#">Restoranlar</a></li>
				    <li><a href="menuler.aspx">Menüler</a></li>
				    <li><a href="#">Avantajlar</a></li>
				    <li><a href="#">Eat ME!</a></li>
                    <li><a href="#">Profil</a></li>
			    </ul>
		    </div>
	    </nav>
        <div class="content">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
	    </div>
        <footer class="footer">
        
        </footer>
        </div>
    </form>
</body>
</html>
