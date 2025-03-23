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

}