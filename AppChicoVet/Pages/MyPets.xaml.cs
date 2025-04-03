namespace AppChicoVet.Pages;

public partial class MyPets : ContentPage
{
    public MyPets()
    {
        InitializeComponent();
    }
    private async void ChangingPageNewPet(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewPets());
    }

    private async void ChangingPagePetConfiguration(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConfiguration());
    }

    private async void BackToPets(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }

}