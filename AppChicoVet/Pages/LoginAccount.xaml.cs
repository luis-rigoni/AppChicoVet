namespace AppChicoVet.Pages;

public partial class LoginAccount : ContentPage
{
	public LoginAccount()
	{
		InitializeComponent();
	}

	private async void ChangingPageNewAccount(Object sender, EventArgs e)
	{
		await Navigation.PushAsync(new NewAccount());
	}
    private async void GotoAccount(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyAccount());
    }

}