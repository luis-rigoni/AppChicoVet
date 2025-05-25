using System;
using System.Collections.ObjectModel;
using AppChicoVet.Models;

namespace AppChicoVet.Pages;

public partial class MyAccount : ContentPage
{
    ObservableCollection<Cliente> listCli = new ObservableCollection<Cliente>();

    public MyAccount()
    {
        InitializeComponent();
        searchBar.TextChanged += searchBarChanged;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await LoadingInfoCli();
    }

    private async Task LoadingInfoCli()
    {
        List<Cliente> temp = await App.Db.GetAllClientes();
        listCli.Clear();

        foreach (Cliente cliente in temp)
        {
            listCli.Add(cliente);
        }

        CarregarLista(listCli);
    }

    private void CarregarLista(IEnumerable<Cliente> clientes)
    {
        cardsContainer.Children.Clear();

        if (!clientes.Any())
        {
            cardsContainer.Children.Add(new Label
            {
                Text = "Sem registros.",
                FontSize = 16,
                TextColor = Colors.Gray,
                HorizontalOptions = LayoutOptions.Center,
                Margin = new Thickness(0, 20)
            });
            return;
        }

        var headerGrid = new Grid
        {
            BackgroundColor = Color.FromArgb("#826160"),
            Padding = new Thickness(10),
            ColumnDefinitions =
            {
                new ColumnDefinition { Width = 225 },
                new ColumnDefinition { Width = 200 },
                new ColumnDefinition { Width = 200 },
                new ColumnDefinition { Width = 200 },
                new ColumnDefinition { Width = 100 },
                new ColumnDefinition { Width = 200 },
                new ColumnDefinition { Width = 215 }
            }
        };

        var labelNome = new Label { Text = "Nome", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelNome, 0);
        Grid.SetRow(labelNome, 0);
        headerGrid.Children.Add(labelNome);

        var labelCpf = new Label { Text = "CPF", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelCpf, 1);
        Grid.SetRow(labelCpf, 0);
        headerGrid.Children.Add(labelCpf);

        var labelEmail = new Label { Text = "Email", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelEmail, 2);
        Grid.SetRow(labelEmail, 0);
        headerGrid.Children.Add(labelEmail);

        var labelTelefone = new Label { Text = "Telefone", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelTelefone, 3);
        Grid.SetRow(labelTelefone, 0);
        headerGrid.Children.Add(labelTelefone);

        var labelIdade = new Label { Text = "Idade", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelIdade, 4);
        Grid.SetRow(labelIdade, 0);
        headerGrid.Children.Add(labelIdade);

        var labelCadastro = new Label { Text = "Cadastro", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelCadastro, 5);
        Grid.SetRow(labelCadastro, 0);
        headerGrid.Children.Add(labelCadastro);

        var labelAcoes = new Label { Text = "Ações", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
        Grid.SetColumn(labelAcoes, 6);
        Grid.SetRow(labelAcoes, 0);
        headerGrid.Children.Add(labelAcoes);

        cardsContainer.Children.Add(headerGrid);

        foreach (var cliente in clientes)
        {
            int idade = DateTime.Now.Year - cliente.cliDataNascimento.Year;
            if (cliente.cliDataNascimento > DateTime.Now.AddYears(-idade)) idade--; 

            string dataFormatada = cliente.cliDataCadastro.ToString("dd/MM/yyyy HH:mm");

            var rowGrid = new Grid
            {
                Padding = new Thickness(5),
                BackgroundColor = Colors.White,
                ColumnDefinitions = headerGrid.ColumnDefinitions
            };



            var lblNome = new Label
            {
                Text = cliente.cliNome,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblNome, 0);
            Grid.SetRow(lblNome, 0);
            rowGrid.Children.Add(lblNome);



            var lblCpf = new Label
            {
                Text = cliente.cliCPF,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblCpf, 1);
            Grid.SetRow(lblCpf, 0);
            rowGrid.Children.Add(lblCpf);



            var lblEmail = new Label
            {
                Text = cliente.cliEmail,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblEmail, 2);
            Grid.SetRow(lblEmail, 0);
            rowGrid.Children.Add(lblEmail);



            var lblTelefone = new Label
            {
                Text = cliente.cliTelefone,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblTelefone, 3);
            Grid.SetRow(lblTelefone, 0);
            rowGrid.Children.Add(lblTelefone);



            var lblIdade = new Label
            {
                Text = idade + (idade > 1 ? " anos" : " ano"),
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblIdade, 4);
            Grid.SetRow(lblIdade, 0);
            rowGrid.Children.Add(lblIdade);



            var lblCadastro = new Label
            {
                Text = dataFormatada,
                FontSize = 13,
                LineBreakMode = LineBreakMode.TailTruncation
            };
            Grid.SetColumn(lblCadastro, 5);
            Grid.SetRow(lblCadastro, 0);
            rowGrid.Children.Add(lblCadastro);



            var btnDetalhes = new Button
            {
                Text = "Detalhes",
                BackgroundColor = Color.FromArgb("#513635"),
                TextColor = Colors.White,
                FontSize = 12,
                Padding = 2,
                HeightRequest = 10
            };
            btnDetalhes.Clicked += async (s, e) =>
            {
                await Navigation.PushAsync(new AccountConfiguration(cliente));
            };
            Grid.SetColumn(btnDetalhes, 6);
            Grid.SetRow(btnDetalhes, 0);
            rowGrid.Children.Add(btnDetalhes);

            cardsContainer.Children.Add(rowGrid);
        }
    }

    private async void searchBarChanged(object sender, TextChangedEventArgs e)
    {
        string p = e.NewTextValue;

        List<Cliente> temp = await App.Db.SearchCliente(p);
        listCli.Clear();

        foreach (Cliente cliente in temp)
        {
            listCli.Add(cliente);
        }

        CarregarLista(listCli);
    }

    private async void NewAccount(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new NewAccount());
    }

    private async void BackToAccounts(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new MyAccount());
    }
}
