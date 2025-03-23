namespace AppChicoVet.Pages;

public partial class NewConsult : ContentPage
{
	public NewConsult()
	{
		InitializeComponent();
	}
    private async void ChangingPageConsults(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConsult());
    }

}