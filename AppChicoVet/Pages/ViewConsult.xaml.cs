using AppChicoVet.Models;

namespace AppChicoVet.Pages
{
    public partial class ViewConsult : ContentPage
    {
        private Especie _especieSelecionada;

        public ViewConsult()
        {
            InitializeComponent();
        }

        public ViewConsult(Especie especie) : this()
        {
            _especieSelecionada = especie;
            PreencherCampos();
        }

        private void PreencherCampos()
        {
            etrEspecie.Text = _especieSelecionada.espNome;
        }

        private async void BackToSpecies(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

        private async void btnConcluir_Clicked(object sender, EventArgs e)
        {
            _especieSelecionada.espNome = etrEspecie.Text;

            bool excluirEspecie = chkExcluirConta?.IsChecked ?? false;

            if (excluirEspecie)
            {
                var confirmacao = await DisplayAlert("Confirmação", "Você tem certeza? Essa ação é irreversível.", "OK", "Cancelar");
                if (confirmacao)
                {
                    await App.Db.DeleteEspecie(_especieSelecionada.espId);
                    await Navigation.PopAsync();
                    return;
                }
            }

            await App.Db.Update(_especieSelecionada);
            await Navigation.PopAsync();
        }
    }
}
