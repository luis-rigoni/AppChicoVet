namespace AppChicoVet.Pages;
using System.Collections.ObjectModel;
using AppChicoVet.Models;

public partial class MyUsers : ContentPage
{

    ObservableCollection<Usuario> listUser = new ObservableCollection<Usuario>();

    public MyUsers()
	{
		InitializeComponent();
        searchBar.TextChanged += searchBarChanged;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await LoadingInfoUser();
    }

    private async Task LoadingInfoUser()
    {
        List<Usuario> temp = await App.Db.GetAllUsuarios();
        listUser.Clear();

        foreach (Usuario usuario in temp)
        {
            listUser.Add(usuario);
        }

        CarregarLista(listUser);
    }

    private void CarregarLista(IEnumerable<Usuario> usuarios)
    {
        cardsContainer.Children.Clear();

        if (!usuarios.Any())
        {
            cardsContainer.Children.Add(new Label
            {
                Text = "Sem registros.",
                TextColor = Colors.Gray,
                FontSize = 18,
                HorizontalOptions = LayoutOptions.Center,
                Margin = new Thickness(0, 20),
                WidthRequest = 300,
                TranslationX = 105
            });
            return;
        }

        var headerGrid = new Grid
        {
            BackgroundColor = Color.FromArgb("#826160"),
            Padding = new Thickness(10),
            ColumnDefinitions =
            {
                new ColumnDefinition { Width = 220 },
                new ColumnDefinition { Width = 80 }
            }
        };

        var labelNome = new Label { Text = "Nome", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelNome, 0);
        Grid.SetRow(labelNome, 0);
        headerGrid.Children.Add(labelNome);

        var labelAcoes = new Label { Text = "Ações", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelAcoes, 1);
        Grid.SetRow(labelAcoes, 0);
        headerGrid.Children.Add(labelAcoes);

        cardsContainer.Children.Add(headerGrid);

        foreach (var usuario in usuarios)
        {

            var rowGrid = new Grid
            {
                Padding = new Thickness(5),
                BackgroundColor = Colors.White,
                ColumnDefinitions = headerGrid.ColumnDefinitions
            };


            var lblNome = new Label
            {
                Text = usuario.userNome,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblNome, 0);
            Grid.SetRow(lblNome, 0);
            rowGrid.Children.Add(lblNome);

            var btnDetalhes = new Button
            {
                Text = "Detalhes",
                BackgroundColor = Color.FromArgb("#513635"),
                TextColor = Colors.White,
                FontSize = 12,
                Padding = 2,
                HeightRequest = 40
            };
            btnDetalhes.Clicked += async (s, e) =>
            {
                await Navigation.PushAsync(new UserConfiguration(usuario));
            };
            Grid.SetColumn(btnDetalhes, 3);
            Grid.SetRow(btnDetalhes, 0);
            rowGrid.Children.Add(btnDetalhes);

            cardsContainer.Children.Add(rowGrid);
        }
    }

    private async void searchBarChanged(object sender, TextChangedEventArgs e)
    {
        string p = e.NewTextValue;

        List<Usuario> temp = await App.Db.SearchUsuario(p);
        listUser.Clear();

        foreach (Usuario usuario in temp)
        {
            listUser.Add(usuario);
        }

        CarregarLista(listUser);
    }

    private async void NewUser(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewUser());
    }

}