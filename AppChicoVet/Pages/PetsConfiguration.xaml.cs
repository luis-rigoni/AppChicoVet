using AppChicoVet.Models;
using AppChicoVet.Helpers;
using System;
using SQLite;
using System.IO;
using System.Linq;
using Microsoft.Maui.Storage;

namespace AppChicoVet.Pages
{
    public partial class PetsConfiguration : ContentPage
    {
        private Animal _animalSelecionado;
        private string _especieSelecionada;
        private string _donoSelecionado;

        public PetsConfiguration()
        {
            InitializeComponent();
            pkEspecie.SelectedIndexChanged += PkEspecie_SelectedIndexChanged;
            CarregarEspecies();
            CarregarClientes();
        }

        public PetsConfiguration(Animal animal, string especie, string dono) : this()
        {
            _animalSelecionado = animal;
            _especieSelecionada = especie;
            _donoSelecionado = dono;
            PreencherCampos();
        }

        private void CarregarEspecies()
        {
            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            var db = new SQLiteConnection(path);
            var especies = db.Table<Especie>().ToList();
            pkEspecie.ItemsSource = especies.Select(e => e.espNome).ToList();
        }

        private void CarregarClientes()
        {
            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            var db = new SQLiteConnection(path);
            var clientes = db.Table<Cliente>().ToList();
            pkDono.ItemsSource = clientes.Select(c => c.cliNome).ToList();
        }

        private void PreencherCampos()
        {
            etrNome.Text = _animalSelecionado.aniNome;
            etrApelido.Text = _animalSelecionado.aniApelido;

            switch (_animalSelecionado.aniGenero.ToLower())
            {
                case "feminino":
                    rbFeminino.IsChecked = true;
                    break;
                case "masculino":
                    rbMasculino.IsChecked = true;
                    break;
            }

            try
            {
                string dataStr = _animalSelecionado.aniDataNasc.ToString();
                if (DateTime.TryParseExact(dataStr, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None, out var data))
                {
                    dpNasc.Date = data;
                }
            }
            catch
            { }

            pkEspecie.SelectedItem = _especieSelecionada;
            pkDono.SelectedItem = _donoSelecionado;

            if (!string.IsNullOrEmpty(_animalSelecionado.aniImagem))
            {
                imgPet.Source = ImageSource.FromFile(_animalSelecionado.aniImagem);
                imgPet.IsVisible = true;
                btnRemoverImagem.IsVisible = true;
            }
            else
            {
                imgPet.IsVisible = false;
                btnRemoverImagem.IsVisible = false;
            }
        }

        private async void OnSaveClick(object sender, EventArgs e)
        {
            _animalSelecionado.aniNome = etrNome.Text;
            _animalSelecionado.aniApelido = etrApelido.Text;
            _animalSelecionado.aniDataNasc = dpNasc.Date;

            _animalSelecionado.aniEspecie = pkEspecie.SelectedItem.ToString();
            _animalSelecionado.aniDono = pkDono.SelectedItem.ToString();

            if (chkExcluirPet.IsChecked)
            {
                var confirmacao = await DisplayAlert("Confirmação", "Você tem certeza? Essa ação é irreversível.", "OK", "Cancelar");

                if (confirmacao)
                {
                    await App.Db.Delete(_animalSelecionado.aniId);
                    await Navigation.PopAsync();
                    return;
                }
            }

            await App.Db.Update(_animalSelecionado);
            await Navigation.PopAsync();
        }

        private async void BackToPets(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
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
                        _animalSelecionado.aniImagem = resultado.FullPath;
                        imgPet.Source = ImageSource.FromFile(_animalSelecionado.aniImagem);
                        imgPet.IsVisible = true;
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
            _animalSelecionado.aniImagem = string.Empty;
            imgPet.Source = null;
            imgPet.IsVisible = false;
            btnRemoverImagem.IsVisible = false;
        }

        private void PkEspecie_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especieSelecionada = pkEspecie.SelectedItem?.ToString() ?? "empty";
            string imagemAtual = _animalSelecionado.aniImagem?.ToLower() ?? "";
            string imagemDoPet = string.Empty;

            bool imagemPadrao = imagemAtual.EndsWith("canine.png") ||
                                imagemAtual.EndsWith("feline.png") ||
                                imagemAtual.EndsWith("bird.png") ||
                                imagemAtual.EndsWith("roedor.png") ||
                                imagemAtual.EndsWith("turtle.png") ||
                                imagemAtual.EndsWith("lizard.png") ||
                                imagemAtual.EndsWith("snake.png") ||
                                imagemAtual.EndsWith("defaultimg.png") ||
                                string.IsNullOrWhiteSpace(imagemAtual);

            if (imagemPadrao)
            {
                switch (especieSelecionada.ToLower())
                {
                    case "cachorro":
                        imagemDoPet = "canine.png";
                        break;
                    case "gato":
                        imagemDoPet = "feline.png";
                        break;
                    case "pássaro":
                        imagemDoPet = "bird.png";
                        break;
                    case "roedor":
                        imagemDoPet = "roedor.png";
                        break;
                    case "tartaruga":
                        imagemDoPet = "turtle.png";
                        break;
                    case "lagarto":
                        imagemDoPet = "lizard.png";
                        break;
                    case "cobra":
                        imagemDoPet = "snake.png";
                        break;
                    default:
                        imagemDoPet = "defaultimg.png";
                        break;
                }

                _animalSelecionado.aniImagem = imagemDoPet;
            }

            if (!string.IsNullOrEmpty(_animalSelecionado.aniImagem))
            {
                imgPet.Source = ImageSource.FromFile(_animalSelecionado.aniImagem);
                imgPet.IsVisible = true;
                btnRemoverImagem.IsVisible = true;
            }
            else
            {
                imgPet.Source = null;
                imgPet.IsVisible = false;
                btnRemoverImagem.IsVisible = false;
            }
        }
    }
}