<%@ Page Language="C#"  MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="Aplikacija.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Kalkulator</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel  ID="panel1" runat="server"><ContentTemplate>
        <div class="kalkulator">
            <asp:Label ID="lblNaslov" runat="server" Text="ŠPORTNI KALKULATOR" CssClass="naslov"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            Izračunajte si Indeks telesne mase (ITM), bazalni metabolizem (BMR/BM), dnevno porabo energije, makronutriente ter ugotovite, koliko kalorij porabite pri nekaterih športnih aktivnostih.<br />
            <br />
            Podatki na podlagi katerih kalkulator opravlja izračune, so pridobiljeni s primerjanjem in usklajevanjem vrednosti različnih strokovnih virov. Rezultati so zgolj informativne narave.<br />
            <br />
            Vpišite in izberite vaše podatke pri posamezni kategoriji.<br />
            <br />
            <asp:TextBox ID="txtNapaka" runat="server" Width="360px" CssClass="napaka"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblVisina" runat="server" Text="Višina:" CssClass="oznaka" Height="25px" Width="40px"></asp:Label>
            &nbsp;
            <asp:TextBox CssClass="textbox" ID="visina" runat="server" Width="40px" Height="25px"></asp:TextBox>
            <asp:Label ID="lblCm" runat="server" Text="cm" CssClass="enota" Height="25px" Width="30px"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="lvlTeza" runat="server" Text="Teža:" CssClass="oznaka" Height="25px" Width="40px"></asp:Label>
            <asp:TextBox ID="teza" runat="server" Width="40px" CssClass="textbox" Height="25px"></asp:TextBox>
            <asp:Label ID="lblKg" runat="server" Text="kg" CssClass="enota" Height="25px" Width="30px"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblStarost" runat="server" Text="Starost:" CssClass="oznaka" Height="25px" Width="40px"></asp:Label>
&nbsp;&nbsp; <asp:TextBox ID="starost" runat="server" Width="40px" CssClass="textbox" Height="25px"></asp:TextBox>
            <asp:Label ID="lblLet" runat="server" Text="let" CssClass="enota" Height="25px" Width="30px"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="izracunITM" runat="server" CssClass="izracun" OnClick="IzracunITM_Click" Text="Izračun" />
            <br />
            <br />
            <hr />
            <br />
            <asp:Label ID="lblITM" runat="server" Text="Indeks telesne mase (ITM)" CssClass="naslov"></asp:Label>
            <br />
            <br />
            ITM oziroma Indeks telesne mase je mera, definirana kot telesna masa v kg, deljena s kvadratom telesne višine v metrih. V spodnji tabeli lahko preverite, v kateri kategoriji se nahajate.<br />
            <br />
            <br />
            Vaš ITM je&nbsp; <asp:TextBox ID="itmIzracun" runat="server" Width="40px" CssClass="textbox" Height="25px" ReadOnly="true"></asp:TextBox>
            .<br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="pod 18.5" CssClass="tabela" Height="25px" Width="180px" ></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="prenizka telesna teža" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="18.5 - 24.9" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="normalna telesna teža" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="25 - 29.9" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text="prekomerna telesna teža" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="nad 30" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text="debelost" CssClass="tabela" Height="25px" Width="180px"></asp:Label>
            <br />
            <br />
            <hr />
            <br />
            <asp:Label ID="lblBmr" runat="server" Text="Bazalni metabolizem (BMR)" CssClass="naslov"></asp:Label>
            &nbsp;<br />
            <br />
            Bazalni metabolizem (ang. Basal Metabolic rate) je minimalna količina energije (kalorij), ki jo oseba dnevno potrebuje za vzdrževanje osnovnih življenjskih procesov. Za izračun je uporabljena Mifflin St Jeor formula.
            <br/>
            <br />
            <asp:Label ID="lblSpol" runat="server" Text="Spol:"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="ddlSpol" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSpol_SelectedIndexChanged" CssClass="dropdown">
                <asp:ListItem Value="0">--izberite--</asp:ListItem>
                <asp:ListItem>Moški</asp:ListItem>
                <asp:ListItem>Ženski</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;<br />
            <br />
            Vaš BMR je&nbsp; <asp:TextBox ID="bmrIzracun" runat="server" Width="50px" CssClass="textbox" Height="25px" ReadOnly="true"></asp:TextBox>
            .<br />
            <br />
            <hr />
            <br />
            <asp:Label ID="lblTDEE" runat="server" Text="Dnevna poraba energije (TDEE)" CssClass="naslov"></asp:Label>
            <br />
            <br />
            Dnevno porabo energije (ang Total Daily Energy Expenditure) temelji na izračunu bazalnega metabolizma in uporabo stopnje telesne aktivnosti posameznika. Ta nam določa, s kolikšnim faktorjem pomnožimo bazalni metabolizem, da dobimo predvideno dnevno porabo energije v kalorijah.<br />
            <br />
            <asp:Label ID="lblStopnjaAktivnosti" runat="server" Text="Stopnja aktivnosti:"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlAktivnost" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAktivnost_SelectedIndexChanged" CssClass="dropdown">
                <asp:ListItem Value="0">--izberite--</asp:ListItem>
                <asp:ListItem>Sedeča (malo/brez športne aktivnosti)</asp:ListItem>
                <asp:ListItem>Nizka (športne aktivnosti 1-2 dni/teden)</asp:ListItem>
                <asp:ListItem>Zmerna (športne aktivnosti 3-5 dni/teden)</asp:ListItem>
                <asp:ListItem>Visoka (športne aktivnosti 6-7 dni/teden)</asp:ListItem>
                <asp:ListItem>Ekstremna (profesionalni športniki, športna aktivnost 2x/dan)</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Vaša poraba kalorij znaša
            <asp:TextBox ID="tdeeIzracun" runat="server" Width="50px" CssClass="textbox" Height="25px" ReadOnly="true"></asp:TextBox>
            .<br />
            <br />
            &nbsp;<asp:Label ID="lblZelim" runat="server" Text="Želim"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="ddlTeza" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTeza_SelectedIndexChanged" CssClass="dropdown">
                <asp:ListItem>--izberite--</asp:ListItem>
                <asp:ListItem>zgubiti 1 kg/teden</asp:ListItem>
                <asp:ListItem>zgubiti 0.75 kg/teden</asp:ListItem>
                <asp:ListItem>zgubiti 0.5 kg/teden</asp:ListItem>
                <asp:ListItem>zgubiti 0.25 kg/teden</asp:ListItem>
                <asp:ListItem>ostati na isti teži</asp:ListItem>
                <asp:ListItem>pridobiti 0.25 kg/teden</asp:ListItem>
                <asp:ListItem>pridobiti 0.5 kg/teden</asp:ListItem>
                <asp:ListItem>pridobiti 0.75 kg/teden</asp:ListItem>
                <asp:ListItem>pridobiti 1 kg/teden</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Vaš dnevni vnos kalorij mora biti <asp:TextBox ID="kalorijeIzracun" runat="server" Width="50px" CssClass="textbox" Height="25px" ReadOnly="true"></asp:TextBox>
            .<br />
            <br />
            <hr />
            <br />
            <asp:Label ID="lblMakro" runat="server" Text="MAKRONUTRIENTI" CssClass="naslov"></asp:Label>
            <br />
            <br />
            Makronutrienti so hranila, ki jih potrebujemo v velikih količinah in predstavljajo naš vir energije. Potrebujemo jih za rast, metabolizem in druge telesne funkcije. Med makronutriente sodijo:<br />
            <br />
            <asp:Label ID="Label15" runat="server" Text="Ogljikovi hidrati (1 gram = 4kcal)" CssClass="labelkalorije" Height="20px" Width="300px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Beljakovine (1 gram = 4 kcal)" CssClass="labelkalorije" Height="20px" Width="300px"></asp:Label>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Maščobe (1 gram = 9 kcal)" CssClass="labelkalorije" Height="20px" Width="300px"></asp:Label>
            <br />
            <p class="subtitle">Priporočila:</p>
            <asp:Label ID="Label9" runat="server" Text="Ogljikovi hidrati" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <asp:Label ID="Label10" runat="server" Text="45%-65%" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Beljakovine" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <asp:Label ID="Label12" runat="server" Text="10%-35%" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Maščobe" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <asp:Label ID="Label14" runat="server" Text="20%-35%" CssClass="tabelamakro" Height="20px" Width="170px"></asp:Label>
            <br />
            <br />
            Spodaj so predstavljeni primeri različnih vrednosti.<br />
&nbsp;<asp:Label ID="Label18" runat="server" CssClass="labelrazlaga" Text="60/20/20 = 60% OH, 20% beljakovin in 20% maščob dnevnih kalorij. "></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtNapaka3" runat="server" CssClass="napaka" Width="360px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnVOH" runat="server" OnClick="btnVOH_Click" Text="Visoki OH (60/20/20)" Width="150px" CssClass="gumb" Height="35px" />
            <asp:Button ID="btnZOH" runat="server" Height="35px" OnClick="btnZOH_Click" Text="Zmerni OH (50/30/20)" Width="150px" CssClass="gumb" />
            <asp:Button ID="btnNOH" runat="server" Height="35px" OnClick="btnNOH_Click" Text="Nizki OH (45/25/30)" Width="150px" CssClass="gumb" />
            <br />
            <br />
            <br />
            Vaš vnos makronutrentov mora biti:<br />
            <br />
            <asp:TextBox ID="ohIzracun" runat="server" Width="40px" CssClass="makro" Height="25px" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="lblOH" runat="server" Text="g OH" CssClass="enota" Height="25px" Width="40px"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="beljIzracun" runat="server" Width="40px" CssClass="makro" Height="25px" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="lblBel" runat="server" Text="g beljakovin" CssClass="enota" Height="25px" Width="90px"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="mascIzracun" runat="server" Width="40px" CssClass="makro" Height="25px" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="lblMasc" runat="server" Text="g maščob" CssClass="enota" Height="25px" Width="70px"></asp:Label>
            &nbsp; 
            <br />
            <br />
            <hr />
            <br />
            <asp:Label ID="lblKalorije" runat="server" Text="PORABA KALORIJ" CssClass="naslov"></asp:Label>
            <br />
            <br />
            Vpišite čas in si izračunajte, koliko kalorij porabite pri nekaterih športnih aktivnostih.<br />
            <br />
            <asp:TextBox ID="txtNapaka2" runat="server" Width="360px" CssClass="napaka"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblCas" runat="server" Text="Čas aktivnosti:"></asp:Label>
&nbsp;
            <asp:TextBox ID="stMinut" runat="server" Width="40px" CssClass="textbox" Height="25px"></asp:TextBox>
            <asp:Label ID="lblMin" runat="server" Text="min" CssClass="enota" Height="25px" Width="40px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblAktivnost" runat="server" Text="Aktivnost:"></asp:Label>
            &nbsp;   
            <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSport_SelectedIndexChanged" CssClass="dropdown">
                <asp:ListItem>--izberite--</asp:ListItem>
                <asp:ListItem>hoja (počasna, 3 km/h)</asp:ListItem>
                <asp:ListItem>hoja (zmerna, do 4 km/h)</asp:ListItem>
                <asp:ListItem>hoja (hitra, do 6 km/h)</asp:ListItem>
                <asp:ListItem>jogging</asp:ListItem>
                <asp:ListItem>tek (zmeren, do 10 km/h)</asp:ListItem>
                <asp:ListItem>tek (hiter, do 15 km/h)</asp:ListItem>
                <asp:ListItem>kolesarjenje (lažje, po mestu, do 16 km/h)</asp:ListItem>
                <asp:ListItem>kolesarjenje (hitro, do 22 km/h)</asp:ListItem>
                <asp:ListItem>vadba v fitnesu (vaje z obremenitvijo, 8 - 15 ponovitev)</asp:ListItem>
                <asp:ListItem>dvigovanje uteži (visok napor)</asp:ListItem>
                <asp:ListItem>košarka</asp:ListItem>
                <asp:ListItem>nogomet</asp:ListItem>
                <asp:ListItem>plezanje</asp:ListItem>
                <asp:ListItem>rolanje</asp:ListItem>
                <asp:ListItem>tenis</asp:ListItem>
                <asp:ListItem>odbojka</asp:ListItem>
                <asp:ListItem>hoja v hribe</asp:ListItem>
                <asp:ListItem>plavanje (ležerno, v morju)</asp:ListItem>
                <asp:ListItem>plavanje (rekreativno)</asp:ListItem>
                <asp:ListItem>smučanje</asp:ListItem>
            </asp:DropDownList>
&nbsp;
            <br />
            <br />
            Porabili boste <asp:TextBox ID="stPorabaKalorij" runat="server" Width="50px" CssClass="textbox" Height="25px" ReadOnly="true"></asp:TextBox>
&nbsp;kalorij.<br />
        </div>
            </ContentTemplate></asp:UpdatePanel>
    </form>
</body>
<script src="JavaScript.js"></script>
</html>
