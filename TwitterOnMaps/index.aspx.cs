using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft;
using Newtonsoft.Json;
using GoogleMap;

public partial class index : System.Web.UI.Page
{
    
    Twitter.ServiceClient twitter = new Twitter.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GoogleMap1.MapInfo.Zoom = 6;
            GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
        }
        else {
            GoogleMap1.MapInfo.Zoom = 6;
            GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
        }
    
    }
    protected void GetEventsButton_Click(object sender, EventArgs e)
    {
        GoogleMap1.MapInfo.Zoom = 6;
        GoogleMap1.MapInfo.MapType = MapTypes.ROADMAP;
        GoogleMap1.Markers.Clear();
        if (HashCheck.Checked)
        {
            string hashtags = hashtagTB.Text;
            string json = twitter.GetTweetsOnHashTags(hashtags);
            MulTweetInstance mul = JsonConvert.DeserializeObject<MulTweetInstance>(json);
            var enumerator = mul.mulTweet.GetEnumerator();
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
                m.Tooltip = a.tweet;
                if (a.UserImage == "") { }
                else
                {
                    m.ImgSrc = a.UserImage;
                }
                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
           
        }
        if (PhraseCheck.Checked)
        {
            string phrase = phraseTB.Text;
            string json = twitter.GetTweetsFromPhrase(phrase);
            MulTweetInstance mul = JsonConvert.DeserializeObject<MulTweetInstance>(json);
            var enumerator = mul.mulTweet.GetEnumerator();
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
                m.Tooltip = a.tweet;
                if (a.UserImage == "") { }
                else
                {
                    m.ImgSrc = a.UserImage;
                }
                m.MarkerId = Guid.NewGuid().ToString();

                GoogleMap1.Markers.Add(m);
            }
        }
        }
}