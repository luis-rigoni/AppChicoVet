using SQLite;
using System;
using System.IO;

using AppChicoVet.Models;

namespace AppChicoVet.Pages
{
    public partial class NewPets : ContentPage
    {
        public NewPets()
        {
            InitializeComponent();
        }

        private async void ChangingPagePet(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MyPets());
        }

        private async void btnSalvarClicked(object sender, EventArgs e)
        {
            string especieSelecionada = pkEspecie.SelectedItem?.ToString() ?? "empty";
            string imagemDoPet = string.Empty;

            switch (especieSelecionada)
            {
                case "Cachorro":
                    imagemDoPet = "canine.png";
                    break;
                case "Gato":
                    imagemDoPet = "feline.png";
                    break;
                case "Papagaio":
                    imagemDoPet = "bird.png";
                    break;
                case "Hamster":
                    imagemDoPet = "roedor.png";
                    break;
                case "Tartaruga":
                    imagemDoPet = "turtle.png";
                    break;
                default:
                    imagemDoPet = "default.png";
                    break;
            }

            Animal novoPet = new Animal
            {
                aniNome = etrNome.Text,
                aniApelido = etrApelido.Text, 
                aniDataNasc = dpNasc.Date, 
                aniGenero = rbFeminino.IsChecked ? "Feminino" : (rbMasculino.IsChecked ? "Masculino" : "Indefinido"),
                aniEspecie = especieSelecionada, 
                aniObservacoes = edSobre.Text, 
                aniStatus = "Ativo",
                aniImagem = imagemDoPet 
            };

            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            var db = new SQLiteConnection(path);
            db.CreateTable<Animal>();
            db.Insert(novoPet);

            await DisplayAlert("Sucesso", "Pet adicionado com sucesso!", "OK");
            await Navigation.PushAsync(new MyPets());
        }

    }
}