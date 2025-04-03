namespace AppChicoVet.Pages;

public partial class PetsConsult : ContentPage
{
	public PetsConsult()
	{
		InitializeComponent();
	}
    private async void ChangingPageNewConsult(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewConsult());
    }
    private async void ChangingPageViewConsult(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new ViewConsult());
    }

}