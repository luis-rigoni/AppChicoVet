using AppChicoVet.Models;
using System.Collections.ObjectModel;

namespace AppChicoVet.Pages;

public partial class MyPets : ContentPage
{


    ObservableCollection<Animal> listAni = new ObservableCollection<Animal>();
    public MyPets()
    {
        InitializeComponent();
        viewAni.ItemsSource = listAni;
    }

    protected override async void OnAppearing()
    {
        await LoadingInfoAni();
    }

    private async Task LoadingInfoAni()
    {
        List<Animal> temp = await App.Db.GetAllAni();
        listAni.Clear();

        foreach (Animal animal in temp)
        {
            listAni.Add(animal);
        }

    }
    private async void searchBarChanged(object sender, TextChangedEventArgs e)
    {
        string query = e.NewTextValue;

        listAni.Clear();
        List<Animal> temp = await App.Db.SearchAni(query);

        foreach (Animal animal in temp)
        {
            listAni.Add(animal);
        }

    }

    private async void ChangingPageNewPet(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewPets());
    }

    private async void ChangingPagePetConfiguration(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PetsConfiguration());
    }

    private async void BackToPets(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyPets());
    }

}