using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft;
using Newtonsoft.Json;
using GoogleMap;
using System.Data;

public partial class index : System.Web.UI.Page
{
     public static string songID = "";
 static   String MusicEventkey = "";
 static String musickey = "";
//public static  string songID1 = "";
    //  CryptoServiceRef.ServiceClient cryptService = new CryptoServiceRef.ServiceClient();
    MusicEvent.ServiceClient meservice = new MusicEvent.ServiceClient();
    MusicInfoService.ServiceClient mws = new MusicInfoService.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MusicEventkey = meservice.GetKey();
            string json = meservice.GetCategories(MusicEventkey);
           Categories cl = JsonConvert.DeserializeObject <Categories> (json);
           musickey = mws.GetKey();
          // IDVal.Text = "27408463";
            var enumerator = cl.categories.GetEnumerator();
            ListItem m = new ListItem(" ", " ");
            CategoriesList.Items.Add(m);
           while (enumerator.MoveNext())
           {
               var a = enumerator.Current;
               ListItem l = new ListItem(a.categoryName, a.categoryName);
                   CategoriesList.Items.Add(l);
            
           }
            CategoriesList.DataBind();
        }
        else { MusicEventkey = meservice.GetKey(); }
    }



    protected void GetEventsButton_Click(object sender, EventArgs e)
    {
        string k = KeywordsTB.Text;
        string l = LocationTB.Text;
        string c = CategoriesList.SelectedValue;
        string w = WithinTB.Text;
        string d = DateTB.Text;
        string json = meservice.GetEvents(k, l, c, w, d, MusicEventkey);
        GoogleMap1.MapInfo.Zoom = 8;
        GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
        Events events = JsonConvert.DeserializeObject<Events>(json);
        var enumerator = events.events.GetEnumerator();
        Marker m = null;
        while (enumerator.MoveNext())
        {
            var a = enumerator.Current;
            m = new Marker();
            m.Latitude = Convert.ToDouble(a.eventLatitude);
            m.Longtitude = Convert.ToDouble(a.eventLongitude);
            m.Tooltip = a.eventTitle;
           // m.ImgSrc = a.eventImageUrl;
            m.InfoWindowOnClick = true;
            m.InfoWindowContentHtml = "<table class=" + "auto-style1" + ">" + "<tr><td>Title</td><td>" + a.eventTitle + "</td></tr> <tr><td>Venue</td><td>" + a.venueName + "</td></tr><tr><td>Address</td><td>" + a.venueAddress + "</td></tr><tr><td>City</td><td>" + a.eventCityName + "</td></tr><tr><td>State;</td><td>" + a.eventState + "</td></tr><tr><td>Event Url</td><td>" + "<a href=" + a.eventUrl + ">Go to Url</a>" + "</td></tr><tr><td>Venue Url</td><td>" + "<a href=" + a.venueUrl + ">Go to Url</a>" + "</td></tr><tr><td> Event Image</td><td><img src=" + a.eventImageUrl + " alt=" + " width=" + "150" + " height=" + "150" + "></td></tr></table>";
            
        
    
            m.MarkerId = Guid.NewGuid().ToString();

            GoogleMap1.Markers.Add(m);
        }
     //   GridView1.DataSource = events.events;
      //  GridView1.DataBind();
    }
    protected void PlaySongButton_Click(object sender, EventArgs e)
    {
        if (SongCheck.Checked)
        {
            myDiv.InnerHtml = "";
            string json = mws.singleSongMetadataSearch(UQTB.Text, musickey, "json");
            SingleSongMetadata sn = JsonConvert.DeserializeObject<SingleSongMetadata>(json);
            songID = sn.songID;
            // IDVal.Text = sn.songID;
            myDiv.InnerHtml = "<object width=" + "250" + "height=" + "40" + "classid=" + "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" + " id=" + "gsSong" + sn.songID + " name=" + "gsSong" + sn.songID + "><param name=" + "movie" + "value=" + "http://grooveshark.com/songWidget.swf" + " /><param name=" + "wmode" + "value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + sn.songID + "&style=metal&p=0" + " /><object type=" + "application/x-shockwave-flash" + " data=" + "http://grooveshark.com/songWidget.swf" + " width=" + "250" + " height=" + "40" + "><param name=" + "wmode" + " value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + sn.songID + "&style=metal&p=0" + "/><span><a href=" + "http://grooveshark.com/search/song?q=Love the Way you lie" + " title=" + "Ask About Me by Girl Talk on Grooveshark" + ">About Me by Girl Talk on Grooveshark</a></span></object></object>";
    
        }
        if (ArtistCheck.Checked)
        {
            string json = mws.multipleSongMetadataSearch(UQTB1.Text, "10", musickey, "json");
            MultipleSongMetadata msm = JsonConvert.DeserializeObject<MultipleSongMetadata>(json);

            DataTable dt = new DataTable();
            dt.Columns.Add("songID", typeof(string));
            dt.Columns.Add("songName", typeof(string));
            dt.Columns.Add("artistName", typeof(string));
            dt.Columns.Add("albumName", typeof(string));
             foreach (var c in msm.multipleSongMetadata)
            {
                dt.Rows.Add(c.songID, c.songName, c.artistName, c.albumName);
             }
            gvSearch.DataSource = dt;
            gvSearch.DataBind();

        }
    }
    protected void gvSearch_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].CssClass = "hide";
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#ceedfc'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");
            e.Row.Attributes.Add("style", "cursor:pointer;");
            //myDiv.InnerHtml = "<object width=" + "250" + "height=" + "40" + "classid=" + "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" + " id=" + "gsSong" + songID + " name=" + "gsSong" + songID + "><param name=" + "movie" + "value=" + "http://grooveshark.com/songWidget.swf" + " /><param name=" + "wmode" + "value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + songID + "&style=metal&p=0" + " /><object type=" + "application/x-shockwave-flash" + " data=" + "http://grooveshark.com/songWidget.swf" + " width=" + "250" + " height=" + "40" + "><param name=" + "wmode" + " value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + songID + "&style=metal&p=0" + "/><span><a href=" + "http://grooveshark.com/search/song?q=Love the Way you lie" + " title=" + "Ask About Me by Girl Talk on Grooveshark" + ">About Me by Girl Talk on Grooveshark</a></span></object></object>";
        }

    }
    protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr= gvSearch.SelectedRow;
        string sngID = gr.Cells[0].Text;
        myDiv.InnerHtml = "<object width=" + "250" + "height=" + "40" + "classid=" + "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" + " id=" + "gsSong" + sngID + " name=" + "gsSong" + sngID + "><param name=" + "movie" + "value=" + "http://grooveshark.com/songWidget.swf" + " /><param name=" + "wmode" + "value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + sngID + "&style=metal&p=0" + " /><object type=" + "application/x-shockwave-flash" + " data=" + "http://grooveshark.com/songWidget.swf" + " width=" + "250" + " height=" + "40" + "><param name=" + "wmode" + " value=" + "window" + " /><param name=" + "allowScriptAccess" + " value=" + "always" + "/><param name=" + "flashvars" + " value=" + "hostname=grooveshark.com&songID=" + sngID + "&style=metal&p=0" + "/><span><a href=" + "http://grooveshark.com/search/song?q=Love the Way you lie" + " title=" + "Ask About Me by Girl Talk on Grooveshark" + ">About Me by Girl Talk on Grooveshark</a></span></object></object>";
        
    }
}