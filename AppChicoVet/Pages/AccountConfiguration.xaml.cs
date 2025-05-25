using AppChicoVet.Models;

namespace AppChicoVet.Pages
{
    public partial class AccountConfiguration : ContentPage
    {
        private Cliente _clienteSelecionado;

        public AccountConfiguration()
        {
            InitializeComponent();
        }

        public AccountConfiguration(Cliente cliente) : this()
        {
            _clienteSelecionado = cliente;
            PreencherCampos();
        }

        private void PreencherCampos()
        {
            etrNome.Text = _clienteSelecionado.cliNome;
            etrCPF.Text = _clienteSelecionado.cliCPF;
            etrEmail.Text = _clienteSelecionado.cliEmail;
            etrTelefone.Text = _clienteSelecionado.cliTelefone;
            dpNasc.Date = _clienteSelecionado.cliDataNascimento;

            switch (_clienteSelecionado.cliGenero.ToLower())
            {
                case "feminino":
                    rbFeminino.IsChecked = true;
                    break;
                case "masculino":
                    rbMasculino.IsChecked = true;
                    break;
                default:
                    rbIndiferente.IsChecked = true;
                    break;
            }
        }

        private async void ChangingPageAccount(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MyAccount());
        }

        private async void btnConcluir_Clicked(object sender, EventArgs e)
        {
            _clienteSelecionado.cliNome = etrNome.Text;
            _clienteSelecionado.cliCPF = etrCPF.Text;
            _clienteSelecionado.cliEmail = etrEmail.Text;
            _clienteSelecionado.cliTelefone = etrTelefone.Text;
            _clienteSelecionado.cliDataNascimento = dpNasc.Date;
            _clienteSelecionado.cliGenero = rbFeminino.IsChecked ? "Feminino" : rbMasculino.IsChecked ? "Masculino" : "Não Binário";

            bool excluirConta = chkExcluirConta?.IsChecked ?? false;

            if (excluirConta)
            {
                var confirmacao = await DisplayAlert("Confirmação", "Você tem certeza? Essa ação é irreversível.", "OK", "Cancelar");
                if (confirmacao)
                {
                    await App.Db.DeleteCliente(_clienteSelecionado.cliId);
                    await Navigation.PopAsync();
                    return;
                }
            }

            await App.Db.Update(_clienteSelecionado);
            await DisplayAlert("Sucesso", "Informações atualizadas com sucesso.", "OK");
            await Navigation.PopAsync();
        }
    }
}
