namespace AppChicoVet.Pages;

public partial class ViewConsult : ContentPage
{
	public ViewConsult()
	{
		InitializeComponent();
	}
    private async void BackToConsults(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConsult());
    }

}