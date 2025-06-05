using System.Text.RegularExpressions;
using AppChicoVet.Models;
using SQLite;

namespace AppChicoVet.Pages;

public partial class NewUser : ContentPage
{
	public NewUser()
	{
		InitializeComponent();
	}
    private async void ChangingPageUser(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyUsers());
    }

    private async void btnConcluirClicked(object sender, EventArgs e)
    {
        string nome = etrNome.Text?.Trim();
        string senha = etrSenha.Text?.Trim();

        var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
        var db = new SQLiteConnection(path);
        db.CreateTable<Usuario>();

        Usuario novoUsuario = new Usuario
        {
            userNome = nome,
            userSenha = senha
        };

        db.Insert(novoUsuario);

        await DisplayAlert("Sucesso", "Usuário cadastrado com sucesso.", "OK");
        await Navigation.PushAsync(new MyUsers());
    }

}