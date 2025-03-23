using AppChicoVet.Pages;

namespace AppChicoVet
{
    public partial class MainPage : ContentPage
    {

        public MainPage()
        {
            InitializeComponent();
        }

        private async void GotoAccount(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new LoginAccount());
        }

        private async void GotoPets(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MyPets());
        }

        private async void GotoConsult(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new PetsConsult());
        }

    }

}
