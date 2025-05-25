using AppChicoVet.Helpers;
using AppChicoVet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppChicoVet.Pages
{
    public partial class PetsConsult : ContentPage
    {
        private SQLiteDatabaseHelpers _db;

        public PetsConsult()
        {
            InitializeComponent();
            var path = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            _db = new SQLiteDatabaseHelpers(path);
            this.Appearing += async (s, e) => await LoadSpecies();
        }

        private async Task LoadSpecies()
        {
            var especies = await _db.GetAllEspecies();
            DisplaySpecies(especies);
        }

        private void DisplaySpecies(IEnumerable<Especie> especies)
        {
            cardsContainer.Children.Clear();

            if (!especies.Any())
            {
                cardsContainer.Children.Add(new Label
                {
                    Text = "Sem registros.",
                    TextColor = Colors.Gray,
                    FontSize = 18,
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
                    new ColumnDefinition { Width = 400 },
                    new ColumnDefinition { Width = 175 },
                }
            };

            var labelNome = new Label { Text = "Nome da Espécie", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
            Grid.SetColumn(labelNome, 0);
            Grid.SetRow(labelNome, 0);
            headerGrid.Children.Add(labelNome);

            var labelAcoes = new Label { Text = "Ações", TextColor = Colors.White, FontAttributes = FontAttributes.Bold };
            Grid.SetColumn(labelAcoes, 1);
            Grid.SetRow(labelAcoes, 0);
            headerGrid.Children.Add(labelAcoes);

            cardsContainer.Children.Add(headerGrid);

            foreach (var especie in especies)
            {
                var rowGrid = new Grid
                {
                    Padding = new Thickness(5),
                    BackgroundColor = Colors.White,
                    ColumnDefinitions = headerGrid.ColumnDefinitions
                };

                var labelEspNome = new Label
                {
                    Text = especie.espNome,
                    FontSize = 13,
                    LineBreakMode = LineBreakMode.TailTruncation
                };
                Grid.SetColumn(labelEspNome, 0);
                Grid.SetRow(labelEspNome, 0);
                rowGrid.Children.Add(labelEspNome);

                var btnDetalhes = new Button
                {
                    Text = "Detalhes",
                    BackgroundColor = Color.FromArgb("#513635"),
                    TextColor = Colors.White,
                    FontSize = 12,
                    Padding = new Thickness(5),
                    HeightRequest = 40
                };

                btnDetalhes.Clicked += async (s, e) =>
                {
                    await Navigation.PushAsync(new ViewConsult(especie));
                };

                Grid.SetColumn(btnDetalhes, 1);
                Grid.SetRow(btnDetalhes, 0);
                rowGrid.Children.Add(btnDetalhes);

                cardsContainer.Children.Add(rowGrid);
            }
        }

        private async void searchBarChanged(object sender, TextChangedEventArgs e)
        {
            string pesquisa = e.NewTextValue;

            var especies = await _db.SearchEspecie(pesquisa);
            DisplaySpecies(especies);
        }

        private async void NewSpecie(Object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NewConsult());
        }
    }
}