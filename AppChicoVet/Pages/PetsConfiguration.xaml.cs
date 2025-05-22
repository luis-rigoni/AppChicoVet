using AppChicoVet.Models;
using AppChicoVet.Helpers;
using System;

namespace AppChicoVet.Pages
{
    public partial class PetsConfiguration : ContentPage
    {
        private Animal _animalSelecionado;

        public PetsConfiguration()
        {
            InitializeComponent();
            pkEspecie.SelectedIndexChanged += PkEspecie_SelectedIndexChanged;
        }

        public PetsConfiguration(Animal animal) : this()
        {
            _animalSelecionado = animal;
            PreencherCampos();
        }

        private void PreencherCampos()
        {
            etrNome.Text = _animalSelecionado.aniNome;
            etrApelido.Text = _animalSelecionado.aniApelido;

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

            pkEspecie.SelectedItem = _animalSelecionado.aniEspecie;

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
                    case "Roedor":
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