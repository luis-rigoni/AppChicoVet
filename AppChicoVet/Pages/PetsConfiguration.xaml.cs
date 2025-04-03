namespace AppChicoVet.Pages;

public partial class PetsConfiguration : ContentPage
{
	public PetsConfiguration()
	{
		InitializeComponent();
	}
    private async void BackToPets(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }

}