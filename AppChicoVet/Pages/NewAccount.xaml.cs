using AppChicoVet.Models;

namespace AppChicoVet.Pages;

public partial class NewAccount : ContentPage
{
	public NewAccount()
	{
		InitializeComponent();
	}
    private async void ChangingPageLoginAccount(Object sender, EventArgs e)
    {

        await Navigation.PushAsync(new LoginAccount());
    }

}