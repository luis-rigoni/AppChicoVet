using AppChicoVet.Models;

namespace AppChicoVet.Pages;

public partial class UserConfiguration : ContentPage
{

    private Usuario _usuarioSelecionado;

    public UserConfiguration()
	{
		InitializeComponent();
	}

    private async void ChangingPageUser(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyUsers());
    }

    public UserConfiguration(Usuario usuario) : this()
    {
        _usuarioSelecionado = usuario;
        PreencherCampos();
    }

    private void PreencherCampos()
    {
        etrNome.Text = _usuarioSelecionado.userNome;
        etrSenha.Text = _usuarioSelecionado.userSenha;
    }

    private async void btnConcluir_Clicked(object sender, EventArgs e)
    {
        _usuarioSelecionado.userNome = etrNome.Text;
        _usuarioSelecionado.userSenha = etrSenha.Text;

        bool excluirUsuario = chkExcluirUser?.IsChecked ?? false;

        if (excluirUsuario)
        {
            var confirmacao = await DisplayAlert("Confirmação", "Você tem certeza? Essa ação é irreversível.", "OK", "Cancelar");
            if (confirmacao)
            {
                await App.Db.DeleteUsuario(_usuarioSelecionado.userId);
                await Navigation.PopAsync();
                return;
            }
        }

        await App.Db.Update(_usuarioSelecionado);
        await Navigation.PopAsync();
    }

}