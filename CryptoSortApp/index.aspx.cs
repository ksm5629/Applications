
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    static Boolean? whichCipher = null;
    static Boolean? whichSort = null;
    static String key = "";
    CryptoServiceRef.ServiceClient cryptService = new CryptoServiceRef.ServiceClient();
    SortService.ServiceClient sortserv = new SortService.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            toggleValues(false);
            toggleTBSort(false);
            key = sortserv.GetKey();
        }
        else { }
    }
    protected void AffCiph_Click(object sender, EventArgs e)
    {
        ClearTBs();
        whichCipher = false;
        toggleSubstitution(false);
        toggleAffine(true); 

    }

    protected void toggleValues(Boolean b)
    { 
       Valueofa.Visible = b;
        LValueofa.Visible = b;
        Valueofb.Visible = b;
        LValueofb.Visible = b;
        ValueofDisposition.Visible = b;
        LValueofDisposition.Visible = b;
        LPlainText.Visible = b;
        PlainText.Visible = b;
        LCipherText.Visible = b;
        CipherText.Visible = b;
        Encrypt.Visible = b;
        Decrypt.Visible = b;
    }

    protected void toggleAffine(Boolean b)
    {
        Valueofa.Visible = b;
        LValueofa.Visible = b;
        Valueofb.Visible = b;
        LValueofb.Visible = b;
        LPlainText.Visible = b;
        PlainText.Visible = b;
        LCipherText.Visible = b;
        CipherText.Visible = b;
        Encrypt.Visible = b;
        Decrypt.Visible = b;
    }

    protected void toggleSubstitution(Boolean b)
    { 
        ValueofDisposition.Visible = b;
        LValueofDisposition.Visible = b;
        LPlainText.Visible = b;
        PlainText.Visible = b;
        LCipherText.Visible = b;
        CipherText.Visible = b;
        Encrypt.Visible = b;
        Decrypt.Visible = b;
    }
    protected void SubCiph_Click(object sender, EventArgs e)
    {
        ClearTBs();
        whichCipher = true;
        toggleAffine(false);
        toggleSubstitution(true);
        

    }

    protected void ClearTBs()
    {
        CipherText.Text = "";
        PlainText.Text = "";
        Valueofa.Text = "";
        Valueofb.Text = "";
        ValueofDisposition.Text = "";
    }
    protected void Encrypt_Click(object sender, EventArgs e)
    {
        if (whichCipher == true)
        {
            String output = cryptService.EncryptCaeserCipher(PlainText.Text, Convert.ToInt32(ValueofDisposition.Text));
            CipherText.Text = output;
            
        }
        else if(whichCipher == false)
        {
            String output = cryptService.EncryptAffineCipher(PlainText.Text, Convert.ToInt32(Valueofa.Text), Convert.ToInt32(Valueofb.Text));
            CipherText.Text = output;
        }
        PlainText.Text = "";
    }
    protected void Decrypt_Click(object sender, EventArgs e)
    {
        if (whichCipher == true)
        {
            String output = cryptService.DecryptCaeserCipher(CipherText.Text, Convert.ToInt32(ValueofDisposition.Text));
            PlainText.Text = output;
        }
        else if (whichCipher == false)
        {
            String output = cryptService.DecryptAffineCipher(CipherText.Text, Convert.ToInt32(Valueofa.Text), Convert.ToInt32(Valueofb.Text));
            PlainText.Text = output;
        }
        CipherText.Text = "";
    }
    protected void ClearAll_Click(object sender, EventArgs e)
    {
        toggleValues(false);
        whichCipher = null;
    }

    protected void toggleTBSort(Boolean b)
    {
        LUNSort.Visible = b;
        Lsorted.Visible = b;
        SortB.Visible = b;
        sortedTB.Visible = b;
        UnsortedTB.Visible = b;
    }


    protected void LButtonforMergeSort_Click(object sender, EventArgs e)
    {
        toggleTBSort(true);
        whichSort = true;
    }
    protected void LButtonforSelectionSort_Click(object sender, EventArgs e)
    {
        toggleTBSort(true);
        whichSort = false;
    }
    protected void LButtonforClear_Click(object sender, EventArgs e)
    {
        toggleTBSort(false);
        whichSort = null;
    }
    protected void SortB_Click(object sender, EventArgs e)
    {
        if (whichSort == true)
        {
            String output = sortserv.mergeSort(UnsortedTB.Text, key);
            sortedTB.Text = output;
        }
        else if (whichSort == false)
        { 
        String output = sortserv.selectionSort(UnsortedTB.Text, key);
        sortedTB.Text = output;
        }
    }
}
