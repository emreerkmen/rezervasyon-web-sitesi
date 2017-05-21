<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yeniKayit.aspx.cs" Inherits="eatMe.yeniKayit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eat Me! - Yeni Kayıt</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="App_Themes/REDTheme/red.css">
	<link rel="shortcut icon" href="Images/adam.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script charset="utf-8" src="script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <header class="top">
		    <a href="anasayfa.aspx">
			    <img alt="EAT ME!" src="Images/adam.png" style="height:190px;margin-left:90px;float:left;">
		    </a>
            
		    <h1 class="header">EAT ME!</h1>
	    </header>
        <div class="aslindaBurasiesasKayit">
                <div class="panel-kutu">
                    <div class="bilgi">
                        <asp:Label ID="lbl_kullaniciAdi" CssClass="lbl" runat="server" Text="Kullanıcı Adı:"></asp:Label>
                        <asp:TextBox ID="txt_kullaniciAdi" CssClass="text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_kullaniciAdi" ErrorMessage="Bu alan boş bırakılamaz" 
                            Font-Size="Smaller"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lbl_kullaniciAdiUyari" CssClass="uyari" runat="server" Text="Kullanıcı adı daha önce alınmış!"></asp:Label>
                    </div>
                    <div class="bilgi">
                        <asp:Label ID="lbl_sifre" CssClass="lbl" runat="server" Text="Şifre:"></asp:Label>
                        <asp:TextBox ID="txt_sifre" CssClass="text" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txt_sifre" ErrorMessage="Bu alan boş bırakılamaz" 
                            Font-Size="Smaller"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="bilgi">
                        <asp:Label ID="lbl_sifreTekrar" CssClass="lbl" runat="server" Text="Şifre(Tekrar):"></asp:Label>
                        <asp:TextBox ID="txt_sifreTekrar" CssClass="text" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txt_sifre" ControlToValidate="txt_sifreTekrar" 
                            ErrorMessage="Şifreler uyuşmuyor      " Font-Size="Smaller"></asp:CompareValidator>
                        <br />
                    </div>
                    <div class="bilgi">
                        <asp:Label ID="lbl_isim" CssClass="lbl" runat="server" Text="İsim:"></asp:Label>
                        <asp:TextBox ID="txt_isim" CssClass="text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_isim" ErrorMessage="Bu alan boş bırakılamaz" 
                            Font-Size="Smaller"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="bilgi">
                        <asp:Label ID="lbl_soyisim" CssClass="lbl" runat="server" Text="Soyisim:"></asp:Label>
                        <asp:TextBox ID="txt_soyisim" CssClass="text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txt_isim" ErrorMessage="Bu alan boş bırakılamaz" 
                            Font-Size="Smaller"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="bilgi">
                        <asp:Label ID="lbl_telefonNo" CssClass="lbl" runat="server" Text="Telefon:"></asp:Label>
                        <asp:TextBox ID="txt_telefonNo" CssClass="text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txt_telefonNo" ErrorMessage="Bu alan boş bırakılamaz" 
                            Font-Size="Smaller"></asp:RequiredFieldValidator>
                        <br />
                    </div>
            
                    <asp:Button ID="btn_KayitOl" CssClass="btn" style="background-color:#5ea9c9" 
                        runat="server" Text="Kayıt Ol" onclick="btn_KayitOl_Click" />
                </div>
            </div>
    </div>
    </form>
</body>
</html>


