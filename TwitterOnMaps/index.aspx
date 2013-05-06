<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Assembly="GoogleMap" Namespace="GoogleMap" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Twitter on Maps</title>
    <link href="jquery-ui/css/redmond/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
     <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
     <script src="carhartl-jquery-cookie-bf24a03/jquery.cookie.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
      $(function () {
          $("#tabs").tabs({
              collapsible: true,
              activate: function() {
                  var selectedTab = $('#tabs').tabs('option', 'active');
                  $("#<%= hdnSelectedTab.ClientID %>").val(selectedTab);
              },
              active: <%= hdnSelectedTab.Value %>
              });
      });
  </script>
  <style>
  .ui-tabs-vertical { width: 55em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
      .auto-style1 {
          width: 100%;
      }
      .auto-style2 {
          width: 133px;
      }
      .auto-style3 {
          width: 133px;
          height: 23px;
      }
      .auto-style4 {
          height: 23px;
      }
      .auto-style5 {
          width: 133px;
          height: 26px;
      }
      .auto-style6 {
          height: 26px;
      }
  </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
   <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Home</a></li>
    <li><a href="#tabs-2">Twitter On Maps</a></li>
  </ul>
  <div id="tabs-1" style="height: 504px">
    <div style="float:left; height: 914px; width: 726px;">
      <p>
        This Application gives Us ability to search for Tweets based on hastags and phrases. Also we display it on Google Maps.
        
    </p>
      </div>
       <div style="float:right">
           <asp:Image ID="Image1" src="http://25.media.tumblr.com/tumblr_m7cebdFlNl1r88fkfo1_400.png" runat="server" />

       </div>
  </div>
  <div id="tabs-2" style="height: 602px">
   <div style="float:left">
      <table class="auto-style1">
          <tr>
              <td class="auto-style5">&nbsp;</td>
              <td class="auto-style6">
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style3">HashTags</td>
              <td class="auto-style4">
                  <asp:TextBox ID="hashtagTB" runat="server"></asp:TextBox>
                  <asp:CheckBox ID="HashCheck" runat="server" />
              </td>
          </tr>
          <tr>
              <td class="auto-style2">Phrase</td>
              <td>
                  <asp:TextBox ID="phraseTB" runat="server"></asp:TextBox>
                  <asp:CheckBox ID="PhraseCheck" runat="server" />
              </td>
          </tr>
          <tr>
              <td class="auto-style3">&nbsp;</td>
              <td class="auto-style4">
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style2">&nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style2">&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style2">&nbsp;</td>
              <td>
                  <asp:Button ID="GetTweetsButton" runat="server" Text="Get Tweets" Width="126px" OnClick="GetEventsButton_Click" />
              </td>
          </tr>
      </table>
      </div>
      <div style="float:right">
      <cc1:GoogleMap ID="GoogleMap1" runat="server"></cc1:GoogleMap>
  </div>
      </div>
 
</div>
    </form>
</body>
</html>
