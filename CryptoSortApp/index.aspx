<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
  <title>Application for Cryptography and Sorting</title>
    <link href="jquery-ui-1.10.2.custom123/css/dark-hive/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
     <script src="carhartl-jquery-cookie-bf24a03/jquery.cookie.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
      $(function () {
          $("#tabs").tabs({
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
  </style>
</head>
<body>
    
    <form id="form1" runat="server">
   <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
        <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Home</a></li>
    <li><a href="#tabs-2">Cryptology</a></li>
    <li><a href="#tabs-3">Sorting</a></li>
  </ul>
  <div id="tabs-1">
    <h2>About us</h2>
    <p>Tool for Cryptography snd sorting</p>
  </div>
  <div id="tabs-2" style="height: 634px">
    <h2>Cryptography</h2>
      <asp:Label ID="Label1" runat="server" Text="Choose Cipher" Font-Bold="True" Font-Italic="True"></asp:Label>

      <br />
      <asp:LinkButton ID="AffCiph" runat="server" OnClick="AffCiph_Click">Affine Cipher</asp:LinkButton>
&nbsp;&nbsp;
      <asp:LinkButton ID="SubCiph" runat="server" OnClick="SubCiph_Click">Substitution Cipher</asp:LinkButton>
      &nbsp;
      <asp:LinkButton ID="ClearAll" runat="server" OnClick="ClearAll_Click">Clear</asp:LinkButton>
      <br />
      <br />
      <asp:Label ID="LValueofa" runat="server" Text="Value of a"></asp:Label>
&nbsp;<asp:TextBox ID="Valueofa" runat="server" Height="18px" Width="57px" TextMode="Number"></asp:TextBox>
&nbsp;<asp:Label ID="LValueofb" runat="server" Text="value of b"></asp:Label>
&nbsp;<asp:TextBox ID="Valueofb" runat="server" Height="18px" Width="58px" TextMode="Number"></asp:TextBox>
&nbsp;<asp:Label ID="LValueofDisposition" runat="server" Text="Value of Disposition"></asp:Label>
&nbsp;<asp:TextBox ID="ValueofDisposition" runat="server" TextMode="Number"></asp:TextBox>

      <br />
      <br />
      <br />
      <asp:Label ID="LPlainText" runat="server" Text="Plain Text"></asp:Label>
      <br />
      <br />
      <asp:TextBox ID="PlainText" runat="server" Height="78px" TextMode="MultiLine" Width="491px"></asp:TextBox>
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="Encrypt" runat="server" OnClick="Encrypt_Click" Text="Encrypt" Width="98px" />
&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
      <br />
      <asp:Label ID="LCipherText" runat="server" Text="Cipher Text"></asp:Label>
      <br />
      <br />
      <asp:TextBox ID="CipherText" runat="server" Height="78px" TextMode="MultiLine" Width="491px"></asp:TextBox>
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="Decrypt" runat="server" OnClick="Decrypt_Click" Text="Decrypt" Width="107px" />
&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
      <br />

  </div>
  <div id="tabs-3" style="height: 404px">
    <h2>Sorting</h2>
      <asp:LinkButton ID="LButtonforMergeSort" runat="server" OnClick="LButtonforMergeSort_Click">MergeSort</asp:LinkButton>
     &nbsp;  <asp:LinkButton ID="LButtonforSelectionSort" runat="server" OnClick="LButtonforSelectionSort_Click">Selection Sort</asp:LinkButton>
       &nbsp;<asp:LinkButton ID="LButtonforClear" runat="server" OnClick="LButtonforClear_Click">Clear </asp:LinkButton>
      <br />
      <br />
      <asp:Label ID="LUNSort" runat="server" Text="Unsorted Numbers"></asp:Label>
      <br />
      <br />
      <asp:TextBox ID="UnsortedTB" runat="server" Height="42px" TextMode="MultiLine" Width="478px"></asp:TextBox>
      <br />
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="SortB" runat="server" OnClick="SortB_Click" Text="Sort" Width="98px" />
      <br />
      <br />
      <asp:Label ID="Lsorted" runat="server" Text="Sorted Numbers"></asp:Label>
      <br />
      <br />
      <asp:TextBox ID="sortedTB" runat="server" Height="37px" TextMode="MultiLine" Width="470px"></asp:TextBox>
  </div>
</div>
    </form>
</body>
</html>
