using AppChicoVet.Models;

namespace AppChicoVet.Pages;

public partial class NewAccount : ContentPage
{
	public NewAccount()
	{
		InitializeComponent();
	}
    private async void ConcludeAccount(Object sender, EventArgs e)
    {

        Cliente cli = new Cliente();
        cli.cliNome = etrNome.Text;
        cli.cliCPF = etrCPF.Text;
        cli.cliEmail = etrEmail.Text;
        cli.cliSenha = etrSenha.Text;

        App.Db.Insert(cli);
        DisplayAlert("Sucesso!", "Registro inserido com êxito", "Ok");

        await Navigation.PushAsync(new LoginAccount());
    }

}