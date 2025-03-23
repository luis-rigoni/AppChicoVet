namespace AppChicoVet.Pages;

public partial class NewPets : ContentPage
{
	public NewPets()
	{
		InitializeComponent();
	}
    private async void ChangingPagePet(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }

}