<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/master.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="eatMe.profil1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="kayit">
        <div class="panel-kutu">
            <div class="bilgi">
                <asp:Label ID="lbl_kullaniciAdi" CssClass="lbl" runat="server" Text="Kullanıcı Adı:"></asp:Label>
                <asp:TextBox ID="txt_kullaniciAdi" CssClass="text" runat="server"></asp:TextBox><br />
                <asp:Label ID="lbl_kullaniciAdiUyari" CssClass="uyari" runat="server" Text="Kullanıcı adı daha önce alınmış!"></asp:Label>
            </div>
            <div class="bilgi">
                <asp:Label ID="lbl_sifre" CssClass="lbl" runat="server" Text="Şifre:"></asp:Label>
                <asp:TextBox ID="txt_sifre" CssClass="text" TextMode="Password" runat="server"></asp:TextBox><br />
            </div>
            <div class="bilgi">
                <asp:Label ID="lbl_sifreTekrar" CssClass="lbl" runat="server" Text="Şifre(Tekrar):"></asp:Label>
                <asp:TextBox ID="txt_sifreTekrar" CssClass="text" TextMode="Password" runat="server"></asp:TextBox><br />
            </div>
            <div class="bilgi">
                <asp:Label ID="lbl_isim" CssClass="lbl" runat="server" Text="İsim:"></asp:Label>
                <asp:TextBox ID="txt_isim" CssClass="text" runat="server"></asp:TextBox><br />
            </div>
            <div class="bilgi">
                <asp:Label ID="lbl_soyisim" CssClass="lbl" runat="server" Text="Soyisim:"></asp:Label>
                <asp:TextBox ID="txt_soyisim" CssClass="text" runat="server"></asp:TextBox><br />
            </div>
            <div class="bilgi">
                <asp:Label ID="lbl_telefonNo" CssClass="lbl" runat="server" Text="Telefon:"></asp:Label>
                <asp:TextBox ID="txt_telefonNo" CssClass="text" runat="server"></asp:TextBox><br />
            </div>
            
            <asp:Button ID="btn_Kaydet" CssClass="btn" style="background-color:#5ea9c9" 
                runat="server" Text="Kaydet" />
        </div>
    </div>
</asp:Content>
