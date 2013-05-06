<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Assembly="GoogleMap" Namespace="GoogleMap" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Music Events and Music Application</title>
    <link href="DOTLUVTHEME/css/dot-luv/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
     <script src="carhartl-jquery-cookie-bf24a03/jquery.cookie.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
      <style type="text/css">
    .hide{
      display:none;
    }
  </style>
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
      .auto-style7 {
          height: 23px;
          width: 212px;
      }
      .auto-style8 {
          width: 212px;
      }
  </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
   <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Home</a></li>
    <li><a href="#tabs-2">Music Events</a></li>
    <li><a href="#tabs-3">Grooveshark Music</a></li>
  </ul>
  <div id="tabs-1">
    <p>
        This Application gives Us ability to search for music events and songs.
    </p>
  </div>
  <div id="tabs-2" style="height: 602px">
   <div style="float:left">
      <table class="auto-style1">
          <tr>
              <td class="auto-style5">Categories</td>
              <td class="auto-style6">
                  <asp:DropDownList ID="CategoriesList" runat="server" Height="40px" Width="124px">
                  </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td class="auto-style3">Keywords</td>
              <td class="auto-style4">
                  <asp:TextBox ID="KeywordsTB" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="auto-style2">Location</td>
              <td>
                  <asp:TextBox ID="LocationTB" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="auto-style3">Within (miles)</td>
              <td class="auto-style4">
                  <asp:TextBox ID="WithinTB" runat="server" TextMode="Number"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="auto-style2">Date</td>
              <td>
                  <asp:TextBox ID="DateTB" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="auto-style2">&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style2">&nbsp;</td>
              <td>
                  <asp:Button ID="GetEventsButton" runat="server" Text="Get Events" Width="126px" OnClick="GetEventsButton_Click" />
              </td>
          </tr>
      </table>
      </div>
      <div style="float:right">
      <cc1:GoogleMap ID="GoogleMap1" runat="server"></cc1:GoogleMap>
  </div>
      
      </div>
  <div id="tabs-3" style="height: 548px">
   

      <div style="float:left">
       <table class="auto-style1">
           <tr>
               <td class="auto-style7">Song</td>
               <td class="auto-style4">
                   <asp:TextBox ID="UQTB" runat="server" Width="230px"></asp:TextBox>
                   <asp:CheckBox ID="SongCheck" runat="server" />
               </td>
           </tr>
           <tr>
               <td class="auto-style8">Artist or Album</td>
               <td>
                   <asp:TextBox ID="UQTB1" runat="server"  Wrap="False"></asp:TextBox>
                   <asp:CheckBox ID="ArtistCheck" runat="server" />
               </td>
           </tr>
           <tr>
               <td class="auto-style8">&nbsp;</td>
               <td>
                   <asp:Button ID="PlaySongButton" runat="server" Text="Play Song" Width="238px" OnClick="PlaySongButton_Click" />
               </td>
           </tr>
       </table>
      </div>
           <div runat ="server" id="myDiv" style="float:right"></div> 
           
      <asp:GridView ID="gvSearch" runat="server" OnRowDataBound="gvSearch_RowDataBound" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
  <Columns>
    <asp:BoundField DataField="songID" HeaderText="song ID" />
    <asp:BoundField DataField="songName" HeaderText="song Name" />
    <asp:BoundField DataField="artistName" HeaderText="Artist Name" />
    <asp:BoundField DataField="albumName" HeaderText="Album Name" />
   
      <asp:CommandField ShowSelectButton="True" />
   
  </Columns>
          <FooterStyle BackColor="#CCCCCC" />
          <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
          <RowStyle BackColor="White" />
          <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#808080" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
       </div>
</div>
    </form>
</body>
</html>
