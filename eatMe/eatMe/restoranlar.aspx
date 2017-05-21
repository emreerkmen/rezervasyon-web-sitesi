<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/master.Master" AutoEventWireup="true" CodeBehind="restoranlar.aspx.cs" Inherits="eatMe.restoranlar1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid cornflowerblue;">
    <div class="list">
        <div class="listBody">
            <div class="listBodyInside">
                <asp:Button ID="btn_rezervasyonYap" style="float:none;margin-left: 345px; width:auto;" 
                        CssClass="btn" runat="server" Text="Rezervasyon Yap" Visible="false" 
                    onclick="btn_rezervasyonYap_Click"/>
                <asp:DropDownList ID="ddl_saat" runat="server" style="padding:5px;border-radius:3px;float: left;
                            margin-left: 5px;" Visible="false">
                    <asp:ListItem Text="13.00" Value="13" Selected="true"></asp:ListItem>
                    <asp:ListItem Text="14.00" Value="14" ></asp:ListItem>
                    <asp:ListItem Text="15.00" Value="15" ></asp:ListItem>
                    <asp:ListItem Text="16.00" Value="16" ></asp:ListItem>
                    <asp:ListItem Text="17.00" Value="17" ></asp:ListItem>
                    <asp:ListItem Text="18.00" Value="18" ></asp:ListItem>
                    <asp:ListItem Text="19.00" Value="19" ></asp:ListItem>
                    <asp:ListItem Text="20.00" Value="20" ></asp:ListItem>
                </asp:DropDownList>
                
                <asp:PlaceHolder ID="ph_restoranlar" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="ph_tekMasaHead" runat="server"></asp:PlaceHolder>
                <div class="masalar">
                    <asp:PlaceHolder ID="ph_tekMasa" runat="server"></asp:PlaceHolder>
                </div>
                <asp:PlaceHolder ID="ph_siparis" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
