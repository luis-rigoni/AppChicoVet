using System;
using System.Collections.ObjectModel;
using AppChicoVet.Models;

namespace AppChicoVet.Pages;

public partial class MyPets : ContentPage
{
    ObservableCollection<Animal> listAni = new ObservableCollection<Animal>();

    public MyPets()
    {
        InitializeComponent();
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await LoadingInfoAni();
    }

    private async Task LoadingInfoAni()
    {
        List<Animal> temp = await App.Db.GetAll();
        listAni.Clear();

        foreach (Animal animal in temp)
        {
            listAni.Add(animal);
        }

        CarregarCards(listAni);
    }

    private void CarregarCards(IEnumerable<Animal> animais)
    {
        cardsContainer.Children.Clear();

        foreach (var animal in animais)
        {

            string imageSource = animal.aniImagem;

            if (string.IsNullOrEmpty(imageSource))
            {
                switch (animal.aniEspecie.ToLower())
                {
                    case "cachorro":
                        imageSource = "canine.png";
                        break;
                    case "gato":
                        imageSource = "feline.png";
                        break;
                    case "pássaro":
                        imageSource = "bird.png";
                        break;
                    case "hamster":
                        imageSource = "roedor.png";
                        break;
                    case "tartaruga":
                        imageSource = "turtle.png";
                        break;
                    case "lagarto":
                        imageSource = "lizard.png";
                        break;
                    case "cobra":
                        imageSource = "snake.png";
                        break;
                    default:
                        imageSource = "defaultimg.png";
                        break;
                }
            }

            var frame = new Frame
            {
                BackgroundColor = Color.FromArgb("#826160"),
                Padding = 10,
                WidthRequest = 350,
                HeightRequest = 185,
                CornerRadius = 10,
                Margin = new Thickness(10),
                HasShadow = true,
                Content = new StackLayout
                {
                    Spacing = 10,
                    Children =
                    {
                        new Image
                        {
                            Source = ImageSource.FromFile(imageSource),
                            Aspect = Aspect.Fill,
                            HeightRequest = 150,
                            WidthRequest = 150,
                            TranslationX = -80,
                            TranslationY = 5
                        },
                        new Label
                        {
                            Text = animal.aniNome,
                            TextColor = Colors.White,
                            FontAttributes = FontAttributes.Bold,
                            FontSize = 16,
                            HorizontalOptions = LayoutOptions.Center,
                            TranslationY = -145,
                            TranslationX = 80
                        },
                        new Label
                        {
                            Text = $"Status: {animal.aniStatus}",
                            TextColor = Colors.White,
                            FontSize = 15,
                            HorizontalTextAlignment = TextAlignment.Center,
                            HorizontalOptions = LayoutOptions.Center,
                            TranslationY = -145,
                            TranslationX = 80,
                            WidthRequest = 100
                        },
                        new Button
                        {
                            Text = "Detalhes",
                            BackgroundColor = Color.FromArgb("#513635"),
                            TextColor = Colors.White,
                            WidthRequest = 100,
                            TranslationY = -120,
                            TranslationX = 80,
                            Command = new Command(async () =>
                            {
                                await Navigation.PushAsync(new PetsConfiguration(animal));
                            })
                        }
                    }
                }
            };

            cardsContainer.Children.Add(frame);
        }
    }

    private async void searchBarChanged(object sender, TextChangedEventArgs e)
    {
        string p = e.NewTextValue;

        List<Animal> temp = await App.Db.Search(p);
        listAni.Clear();

        foreach (Animal animal in temp)
        {
            listAni.Add(animal);
        }

        CarregarCards(listAni);
    }

    private async void ChangingPageNewPet(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewPets());
    }

    private async void ChangingPagePetConfiguration(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConfiguration());
    }

    private async void BackToPets(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }
}