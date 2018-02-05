using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        double stTeza; // teža
        double stVisina; // višina
        double stITM; //  indeks telesne mase
        double stStarost; // starost
        double stBMR; // bazalni metabolizem
        double stTDEE; // število pretvorjeno iz bmr za izračun tdee
        double stTDEEIzracun; // dnevna poraba kalorij
        double stKalorije; // dnevni vnos kalorij
        double stOH; // ogljikovi hidrati
        double stBel; // beljakovine
        double stMasc; // maščobe
        double stAktivnost; // poraba kalorij pri športnih aktivnostih
        double stCas; // čas
        double stevilo; // uporaba pri izjemah

        protected void Page_Load(object sender, EventArgs e)
        {
            // skrije tekst napak
         
            txtNapaka.Visible = false;
            txtNapaka.BorderStyle = BorderStyle.None;
            txtNapaka.ReadOnly = true;
            txtNapaka.ForeColor = System.Drawing.Color.Red;

            txtNapaka2.Visible = false;
            txtNapaka2.BorderStyle = BorderStyle.None;
            txtNapaka2.ReadOnly = true;
            txtNapaka2.ForeColor = System.Drawing.Color.Red;

            txtNapaka3.Visible = false;
            txtNapaka3.BorderStyle = BorderStyle.None;
            txtNapaka3.ReadOnly = true;
            txtNapaka3.ForeColor = System.Drawing.Color.Red;

        }

        protected void IzracunITM_Click(object sender, EventArgs e)
        {
            bool vnosTeza = double.TryParse(teza.Text, out stevilo);          // primerjanje spremenljivk vnosa teže in višine, če je število ali besedilo : out stevilo?
            bool vnosVisina = double.TryParse(visina.Text, out stevilo);
            bool vnosStarost = double.TryParse(starost.Text, out stevilo);
            

            if (vnosTeza) { stTeza = Double.Parse(teza.Text); }               // pretvori v število, če se da
            if (vnosVisina) { stVisina = Double.Parse(visina.Text); }
            if (vnosStarost) { stStarost = Double.Parse(starost.Text); }

            if (vnosTeza && vnosVisina)
            {
                stITM = stTeza / ((stVisina / 100) * (stVisina / 100));        // operacija se izvede, če sta spremenljivki števili
                stITM = Math.Round(stITM, 1);
                itmIzracun.Text = stITM.ToString(); // pretvorba št v tekst in izpis v txtbox
                txtNapaka.Visible = false;
            }

            if (vnosTeza == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!";  teza.Text = String.Empty; itmIzracun.Text = String.Empty; }
            if (vnosVisina == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!"; visina.Text = String.Empty; itmIzracun.Text = String.Empty; }
            if (vnosStarost == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!"; starost.Text = String.Empty; itmIzracun.Text = String.Empty; }

        }
              // če je vnešeno besedilo, se uporabniku izpiše sporočilo

        protected void ddlSpol_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool vnosTeza = double.TryParse(teza.Text, out stevilo);
            bool vnosVisina = double.TryParse(visina.Text, out stevilo);
            bool vnosStarost = double.TryParse(starost.Text, out stevilo);

            if (vnosTeza) { stTeza = Double.Parse(teza.Text); }
            if (vnosVisina) { stVisina = Double.Parse(visina.Text); }
            if (vnosStarost) { stStarost = Double.Parse(starost.Text); }

            if (vnosTeza && vnosVisina && vnosStarost)
            {
                switch (ddlSpol.Text)
                {

                    case "Moški":
                        {
                            stBMR = 10 * stTeza + 6.25 * stVisina - 5 * stStarost + 5;
                            break;
                        }

                    case "Ženski":
                        {
                            stBMR = 10 * stTeza + 6.25 * stVisina - 5 * stStarost - 161;
                            break;
                        }
                }

                stBMR = Math.Round(stBMR, 0);
                bmrIzracun.Text = stBMR.ToString();
                txtNapaka.Visible = false;
            }
            if (vnosTeza == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!"; teza.Text = String.Empty; bmrIzracun.Text = String.Empty; }
            if (vnosVisina == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!"; visina.Text = String.Empty; bmrIzracun.Text = String.Empty; }
            if (vnosStarost == false) { txtNapaka.Visible = true; txtNapaka.Text = "Prosimo vnesite veljavne podatke!"; starost.Text = String.Empty; bmrIzracun.Text = String.Empty; }
        }

        protected void ddlAktivnost_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (string.IsNullOrWhiteSpace(bmrIzracun.Text))
            {
                txtNapaka.Text = "Prosimo izpolnite prejšnje kategorije!";
                txtNapaka.Visible = true;
            }

            else {

                stTDEE = double.Parse(bmrIzracun.Text);
                switch (ddlAktivnost.Text)
            {

                case "Sedeča (malo/brez športne aktivnosti)":
                    {
                        
                        stTDEEIzracun = stTDEE * 1.2;
                        break;
                    }

                case "Nizka (športne aktivnosti 1-2 dni/teden)":
                    {
                        
                        stTDEEIzracun = stTDEE * 1.375;
                        break;
                    }

                case "Zmerna (športne aktivnosti 3-5 dni/teden)":
                    {
                        
                        stTDEEIzracun = stTDEE * 1.55;
                        break;
                    }

                case "Visoka (športne aktivnosti 6-7 dni/teden)":
                    {
                        
                        stTDEEIzracun = stTDEE * 1.725;
                        break;
                    }

                case "Ekstremna (profesionalni športniki, športna aktivnost 2x/dan)":
                    {
                        
                        stTDEEIzracun = stTDEE * 1.9;
                        break;
                    }

            }

            stTDEEIzracun = Math.Round(stTDEEIzracun, 0);
            tdeeIzracun.Text = stTDEEIzracun.ToString();
        }

       }

        protected void ddlTeza_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(tdeeIzracun.Text))
            {
                txtNapaka.Text = "Prosimo izpolnite prejšnje kategorije!";
                txtNapaka.Visible = true;
            }

            else { 

            stTDEE = double.Parse(tdeeIzracun.Text);

            switch (ddlTeza.Text)
            {

                case "zgubiti 1 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 - 7700) / 7;
                        break;
                    }

                case "zgubiti 0.75 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 - 7700 * 0.75) / 7;
                        break;
                    }

                case "zgubiti 0.5 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 - 7700 * 0.5) / 7;
                        break;
                    }

                case "zgubiti 0.25 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 - 7700 * 0.25) / 7;
                        break;
                    }

                case "ostati na isti teži":
                    {
                        
                        stKalorije = (stTDEE * 7) / 7;
                        break;
                    }

                case "pridobiti 0.25 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 + 7700 * 0.25) / 7;
                        break;
                    }

                case "pridobiti 0.5 kg/teden":
                    {
                      
                        stKalorije = (stTDEE * 7 + 7700 * 0.5) / 7;
                        break;
                    }

                case "pridobiti 0.75 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 + 7700 * 0.75) / 7;
                        break;
                    }

                case "pridobiti 1 kg/teden":
                    {
                        
                        stKalorije = (stTDEE * 7 + 7700) / 7;
                        break;
                    }
            }

            stKalorije = Math.Round(stKalorije, 0);
            kalorijeIzracun.Text = stKalorije.ToString();
        }

       }

        protected void btnVOH_Click(object sender, EventArgs e)
        {
          if (string.IsNullOrWhiteSpace(kalorijeIzracun.Text))
            {
                txtNapaka3.Text = "Prosimo izpolnite prejšnje kategorije!";
                txtNapaka3.Visible = true;
            }

          else
            {
                stTDEEIzracun = double.Parse(kalorijeIzracun.Text);
                stOH = (stTDEEIzracun * 0.6) / 4;
                stOH = Math.Round(stOH, 0);
                ohIzracun.Text = stOH.ToString();

                stBel = (stTDEEIzracun * 0.2) / 4;
                stBel = Math.Round(stBel, 0);
                beljIzracun.Text = stBel.ToString();

                stMasc = (stTDEEIzracun * 0.2) / 9;
                stMasc = Math.Round(stMasc, 0);
                mascIzracun.Text = stMasc.ToString();
            }
 
        }

        protected void btnZOH_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(kalorijeIzracun.Text))
            {
                txtNapaka3.Text = "Prosimo izpolnite prejšnje kategorije!";
                txtNapaka3.Visible = true;
            }

            else
            {
                stTDEEIzracun = double.Parse(kalorijeIzracun.Text);
                stOH = (stTDEEIzracun * 0.5) / 4;
                stOH = Math.Round(stOH, 0);
                ohIzracun.Text = stOH.ToString();

                stBel = (stTDEEIzracun * 0.3) / 4;
                stBel = Math.Round(stBel, 0);
                beljIzracun.Text = stBel.ToString();

                stMasc = (stTDEEIzracun * 0.2) / 9;
                stMasc = Math.Round(stMasc, 0);
                mascIzracun.Text = stMasc.ToString();
            }

        }

        protected void btnNOH_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(kalorijeIzracun.Text))
            {
                txtNapaka3.Text = "Prosimo izpolnite prejšnje kategorije!";
                txtNapaka3.Visible = true;
            }

            else
            {
                stTDEEIzracun = double.Parse(kalorijeIzracun.Text);
                stOH = (stTDEEIzracun * 0.45) / 4;
                stOH = Math.Round(stOH, 0);
                ohIzracun.Text = stOH.ToString();

                stBel = (stTDEEIzracun * 0.25) / 4;
                stBel = Math.Round(stBel, 0);
                beljIzracun.Text = stBel.ToString();

                stMasc = (stTDEEIzracun * 0.3) / 9;
                stMasc = Math.Round(stMasc, 0);
                mascIzracun.Text = stMasc.ToString();
            }

        }

        protected void ddlSport_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool vnosTeza = double.TryParse(teza.Text, out stevilo);
            bool vnosCas = double.TryParse(stMinut.Text, out stevilo);

            if (vnosTeza) { stTeza = Double.Parse(teza.Text); }
            if (vnosCas) { stCas = Double.Parse(stMinut.Text); }

            if (vnosTeza && vnosCas)
            {
                switch (ddlSport.Text)
                {
                    case "hoja (počasna, 3 km/h)":
                        {

                            stAktivnost = stTeza * 2.8 * stCas / 60;
                            break;
                        }

                    case "hoja (zmerna, do 4 km/h)":
                        {

                            stAktivnost = stTeza * 3 * stCas / 60;
                            break;
                        }

                    case "hoja (hitra, do 6 km/h)":
                        {

                            stAktivnost = stTeza * 4.3 * stCas / 60;
                            break;
                        }

                    case "jogging":
                        {

                            stAktivnost = stTeza * 7 * stCas / 60;
                            break;
                        }

                    case "tek (zmeren, do 10 km/h)":
                        {

                            stAktivnost = stTeza * 9.8 * stCas / 60;
                            break;
                        }

                    case "tek (hiter, do 15 km/h)":
                        {

                            stAktivnost = stTeza * 12.8 * stCas / 60;
                            break;
                        }

                    case "kolesarjenje (lažje, po mestu, do 16 km/h)":
                        {

                            stAktivnost = stTeza * 4 * stCas / 60;
                            break;
                        }

                    case "kolesarjenje (hitro, do 22 km/h)":
                        {

                            stAktivnost = stTeza * 8 * stCas / 60;
                            break;
                        }

                    case "vadba v fitnesu (vaje z obremenitvijo, 8 - 15 ponovitev)":
                        {

                            stAktivnost = stTeza * 3.5 * stCas / 60;
                            break;
                        }

                    case "dvigovanje uteži (visok napor)":
                        {

                            stAktivnost = stTeza * 6 * stCas / 60;
                            break;
                        }

                    case "košarka":
                        {

                            stAktivnost = stTeza * 6.5 * stCas / 60;
                            break;
                        }

                    case "nogomet":
                        {

                            stAktivnost = stTeza * 7 * stCas / 60;
                            break;
                        }

                    case "plezanje":
                        {

                            stAktivnost = stTeza * 8 * stCas / 60;
                            break;
                        }

                    case "rolanje":
                        {

                            stAktivnost = stTeza * 7 * stCas / 60;
                            break;
                        }

                    case "tenis":
                        {

                            stAktivnost = stTeza * 7.3 * stCas / 60;
                            break;
                        }

                    case "odbojka":
                        {

                            stAktivnost = stTeza * 4 * stCas / 60;
                            break;
                        }

                    case "hoja v hribe":
                        {

                            stAktivnost = stTeza * 7 * stCas / 60;
                            break;
                        }

                    case "plavanje (ležerno, v morju)":
                        {

                            stAktivnost = stTeza * 6 * stCas / 60;
                            break;
                        }

                    case "plavanje (rekreativno)":
                        {

                            stAktivnost = stTeza * 9.8 * stCas / 60;
                            break;
                        }

                    case "smučanje":
                        {

                            stAktivnost = stTeza * 7 * stCas / 60;
                            break;
                        }

                }
                stAktivnost = Math.Round(stAktivnost, 0);
                stPorabaKalorij.Text = stAktivnost.ToString();
                txtNapaka2.Visible = false;
            }
            if (vnosTeza == false) { txtNapaka2.Visible = true; txtNapaka2.Text = "Prosimo vnesite veljavne podatke!"; teza.Text = String.Empty; stPorabaKalorij.Text = String.Empty; }
            if (vnosCas == false) { txtNapaka2.Visible = true; txtNapaka2.Text = "Prosimo vnesite veljavne podatke!"; stMinut.Text = String.Empty; stPorabaKalorij.Text = String.Empty; }
        }

    }
}
    