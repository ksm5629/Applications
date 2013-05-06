using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoogleMap;
using Newtonsoft;
using Newtonsoft.Json;

public partial class index : System.Web.UI.Page
{
    GasService.ServiceClient gs = new GasService.ServiceClient();
    AirportService.ServiceClient aserv = new AirportService.ServiceClient(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GoogleMap1.MapInfo.Zoom = 6;
            GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
            Div1.Visible = false;
            Div2.Visible = false;
        }
        else
        {
            GoogleMap1.MapInfo.Zoom = 6;
            GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
        }
    

    }
    protected void GetGasStationsButton_Click(object sender, EventArgs e)
    {
        if (CityCheck.Checked)
        {
            string json = gs.GetGasStationswithCity(CityTB.Text);
            MultipleGasInstance mulgs = JsonConvert.DeserializeObject<MultipleGasInstance>(json);
            var enumerator = mulgs.multGasInst.GetEnumerator();
            Marker m = null;
            GoogleMap1.Markers.Clear();
            while (enumerator.MoveNext())
            {
               // GoogleMap1.Markers.Clear();
                var a = enumerator.Current;
                m = new Marker();
                if (a.latitude == "") { }
                else
                {
                    m.Latitude = Convert.ToDouble(a.latitude);
                }
                if (a.longitude == "") { }
                else
                {
                    m.Longtitude = Convert.ToDouble(a.longitude);
                }
                m.InfoWindowOnClick = true;
                m.InfoWindowContentHtml = "<table class=" + "auto-style1" + ">" + "<tr><td>Station Name</td><td>" + a.stationName + "</td></tr> <tr><td>Street Address</td><td>" + a.streetAddress+ "</td></tr><tr><td>City</td><td>" + a.city + "</td></tr><tr><td>State</td><td>" + a.state + "</td></tr><tr><td>Directions</td><td>" + a.intersectionDirections + "</td></tr><tr><td>Phone No.</td><td>" + a.phone + "</td></tr><tr><td>Access Time</td><td>" + a.accessDayTime+ "</td></tr></table>";
          
                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
        }
        if (StateCheck.Checked)
        {
            GoogleMap1.Markers.Clear();
            string json = gs.GetGasStationswithState(StateTB.Text);
            
            MultipleGasInstance mulgs = JsonConvert.DeserializeObject<MultipleGasInstance>(json);
            var enumerator = mulgs.multGasInst.GetEnumerator();
            Marker m = null;
            GoogleMap1.Markers.Clear();
            while (enumerator.MoveNext())
            {

                var a = enumerator.Current;
                m = new Marker();
                if (a.latitude == "") { }
                else
                {
                    m.Latitude = Convert.ToDouble(a.latitude);
                }
                if (a.longitude == "") { }
                else
                {
                    m.Longtitude = Convert.ToDouble(a.longitude);
                }
                m.InfoWindowOnClick = true;
                m.InfoWindowContentHtml = "<table class=" + "auto-style1" + ">" + "<tr><td>Station Name</td><td>" + a.stationName + "</td></tr> <tr><td>Street Address</td><td>" + a.streetAddress + "</td></tr><tr><td>City</td><td>" + a.city + "</td></tr><tr><td>State</td><td>" + a.state + "</td></tr><tr><td>Directions</td><td>" + a.intersectionDirections + "</td></tr><tr><td>Phone No.</td><td>" + a.phone + "</td></tr><tr><td>Access Time</td><td>" + a.accessDayTime + "</td></tr></table>";

                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
        }
    }
    protected void GetAirport_Click(object sender, EventArgs e)
    {
        if (StateAirCB.Checked)
        {
            string json = aserv.GetAirportswithCity(StateAirTB.Text, Convert.ToInt32(CountTB.Text));
            MultipleAirportInstance mulas = JsonConvert.DeserializeObject<MultipleAirportInstance>(json);
            var enumerator = mulas.mulAirInst.GetEnumerator();
            Marker m = null;
            GoogleMap1.Markers.Clear();
            while (enumerator.MoveNext())
            {

                var a = enumerator.Current;
                m = new Marker();
                if (a.latitude == "") { }
                else
                {
                    m.Latitude = Convert.ToDouble(a.latitude);
                }
                if (a.longitude == "") { }
                else
                {
                    m.Longtitude = Convert.ToDouble(a.longitude);
                }
                m.InfoWindowOnClick = true;
                m.InfoWindowContentHtml = "<table class=" + "auto-style1" + ">" + "<tr><td>Airport Name</td><td>" + a.airportname+ "</td></tr> <tr><td>Abbr</td><td>" + a.airportabbr1 + "</td></tr><tr><td>City</td><td>" + a.city + "</td></tr></table>";

                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
        }
        if (CountryCB.Checked)
        {
            GoogleMap1.Markers.Clear();
            string json = aserv.GetAirportswithCountry(CountryTB.Text, Convert.ToInt32(CountTB.Text));
            MultipleAirportInstance mulas = JsonConvert.DeserializeObject<MultipleAirportInstance>(json);
            var enumerator = mulas.mulAirInst.GetEnumerator();
            Marker m = null;
            while (enumerator.MoveNext())
            {

                var a = enumerator.Current;
                m = new Marker();
                if (a.latitude == "") { }
                else
                {
                    m.Latitude = Convert.ToDouble(a.latitude);
                }
                if (a.longitude == "") { }
                else
                {
                    m.Longtitude = Convert.ToDouble(a.longitude);
                }
                m.InfoWindowOnClick = true;
                m.InfoWindowContentHtml = "<table class=" + "auto-style1" + ">" + "<tr><td>Airport Name</td><td>" + a.airportname + "</td></tr> <tr><td>Abbr</td><td>" + a.airportabbr1 + "</td></tr><tr><td>City</td><td>" + a.city + "</td></tr></table>";

                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Div1.Visible = false;
        Div2.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Div1.Visible = true;
        Div2.Visible = false;
    }
}