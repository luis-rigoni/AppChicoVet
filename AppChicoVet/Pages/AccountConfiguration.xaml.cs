namespace AppChicoVet.Pages;

public partial class AccountConfiguration : ContentPage
{
	public AccountConfiguration()
	{
		InitializeComponent();
	}
    private async void ChangingPageAccount(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyAccount());
    }

}