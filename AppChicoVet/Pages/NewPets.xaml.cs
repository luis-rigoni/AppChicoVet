using SQLite;
using System;
using System.IO;
using Microsoft.Maui.Storage;
using AppChicoVet.Models;

namespace AppChicoVet.Pages
{
    public partial class NewPets : ContentPage
    {
        private string _caminhoImagemSelecionada = string.Empty;

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

            if (!string.IsNullOrEmpty(_caminhoImagemSelecionada))
            {
                imagemDoPet = _caminhoImagemSelecionada;
            }
            else
            {
                switch (especieSelecionada)
                {
                    case "Cachorro":
                        imagemDoPet = "canine.png";
                        break;
                    case "Gato":
                        imagemDoPet = "feline.png";
                        break;
                    case "Pássaro":
                        imagemDoPet = "bird.png";
                        break;
                    case "Hamster":
                        imagemDoPet = "roedor.png";
                        break;
                    case "Tartaruga":
                        imagemDoPet = "turtle.png";
                        break;
                    case "Lagarto":
                        imagemDoPet = "lizard.png";
                        break;
                    case "Cobra":
                        imagemDoPet = "snake.png";
                        break;
                    default:
                        imagemDoPet = "default.png";
                        break;
                }
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

        private async void SelecionarFotoClicked(object sender, EventArgs e)
        {
            try
            {
                var resultado = await FilePicker.PickAsync(new PickOptions
                {
                    FileTypes = FilePickerFileType.Images,
                    PickerTitle = "Escolha uma imagem (.png ou .jpg)"
                });

                if (resultado != null)
                {
                    var extensao = Path.GetExtension(resultado.FileName).ToLower();

                    if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".png")
                    {
                        _caminhoImagemSelecionada = resultado.FullPath;
                        imgPreview.Source = ImageSource.FromFile(_caminhoImagemSelecionada);
                        imgPreview.IsVisible = true;
                        btnRemoverImagem.IsVisible = true;
                    }
                    else
                    {
                        await DisplayAlert("Formato inválido", "Por favor, selecione uma imagem PNG ou JPG.", "OK");
                    }
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Erro", $"Erro ao selecionar imagem: {ex.Message}", "OK");
            }
        }

        private void RemoverImagemClicked(object sender, EventArgs e)
        {
            _caminhoImagemSelecionada = string.Empty;
            imgPreview.Source = null;
            imgPreview.IsVisible = false;
            btnRemoverImagem.IsVisible = false;
        }
    }
}