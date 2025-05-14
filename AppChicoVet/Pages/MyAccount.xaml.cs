using AppChicoVet.Models;
using System.Collections.ObjectModel;

namespace AppChicoVet.Pages;

public partial class MyAccount : ContentPage
{
	public MyAccount()
	{
		InitializeComponent();
	}
    private async void GotoConfig(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AccountConfiguration());
    }
    private async void GotoPets(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }
    private async void GotoConsults(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConsult());
    }

}