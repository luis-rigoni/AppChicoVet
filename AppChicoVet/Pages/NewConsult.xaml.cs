using AppChicoVet.Helpers;
using AppChicoVet.Models;
using System;
using System.IO;
using System.Linq;

namespace AppChicoVet.Pages
{
    public partial class NewConsult : ContentPage
    {
        private SQLiteDatabaseHelpers _db;

        public NewConsult()
        {
            InitializeComponent();

            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            _db = new SQLiteDatabaseHelpers(path);
        }

        private async void btnConcluir_Clicked(object sender, EventArgs e)
        {
            string nomeEspecie = etrEspecie.Text?.Trim();

            if (string.IsNullOrWhiteSpace(nomeEspecie))
            {
                await DisplayAlert("Erro", "Informe o nome da espécie.", "OK");
                return;
            }

            var especiesExistentes = await _db.GetAllEspecies();
            bool especieJaExiste = especiesExistentes.Any(e => e.espNome.Equals(nomeEspecie, StringComparison.OrdinalIgnoreCase));

            if (especieJaExiste)
            {
                await DisplayAlert("Atenção", "Espécie já está cadastrada.", "OK");
                return;
            }

            Especie novaEspecie = new Especie
            {
                espNome = nomeEspecie
            };

            await _db.Insert(novaEspecie);
            await DisplayAlert("Sucesso", "Espécie cadastrada com sucesso.", "OK");
            await Navigation.PushAsync(new PetsConsult());
        }

        private async void ChangingPageSpecies(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new PetsConsult());
        }
    }
}
