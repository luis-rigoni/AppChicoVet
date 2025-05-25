using System;
using System.IO;
using System.Text.RegularExpressions;
using AppChicoVet.Models;
using SQLite;

namespace AppChicoVet.Pages
{
    public partial class NewAccount : ContentPage
    {
        public NewAccount()
        {
            InitializeComponent();
        }

        private async void ChangingPageLoginAccount(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MyAccount());
        }

        private string ValidarTelefone(string telefone)
        {
            telefone = Regex.Replace(telefone, "[^0-9]", "");

            if (telefone.Length != 10 && telefone.Length != 11)
            {
                return null;
            }

            return telefone.Length == 10
                ? Convert.ToUInt64(telefone).ToString(@"\(00\) 0000\-0000")
                : Convert.ToUInt64(telefone).ToString(@"\(00\) 00000\-0000");
        }

        private async void btnConcluirClicked(object sender, EventArgs e)
        {
            string nome = etrNome.Text?.Trim();
            string cpf = etrCPF.Text?.Trim();
            string email = etrEmail.Text?.Trim().ToLower();
            string telefone = etrTelefone.Text?.Trim();
            string genero = rbFeminino.IsChecked ? "Feminino" :
                            rbMasculino.IsChecked ? "Masculino" : "Não binário";
            DateTime nascimento = dpNasc.Date;

            if (string.IsNullOrWhiteSpace(nome) || string.IsNullOrWhiteSpace(cpf) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(telefone))
            {
                await DisplayAlert("Erro", "Preencha todos os campos obrigatórios.", "OK");
                return;
            }

            cpf = Regex.Replace(cpf, "[^0-9]", "");
            if (cpf.Length != 11)
            {
                await DisplayAlert("Erro", "CPF inválido.", "OK");
                return;
            }
            string cpfFormatado = Convert.ToUInt64(cpf).ToString(@"000\.000\.000\-00");

            string telefoneFormatado = ValidarTelefone(telefone);
            if (telefoneFormatado == null)
            {
                await DisplayAlert("Erro", "Telefone inválido.", "OK");
                return;
            }

            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                await DisplayAlert("Erro", "Informe um email válido.", "OK");
                return;
            }

            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "db_veterinario.db3");
            var db = new SQLiteConnection(path);
            db.CreateTable<Cliente>();

            var emailExiste = db.Table<Cliente>().FirstOrDefault(c => c.cliEmail.ToLower() == email);
            if (emailExiste != null)
            {
                await DisplayAlert("Erro", "Email já cadastrado.", "OK");
                return;
            }

            var telefoneExiste = db.Table<Cliente>().FirstOrDefault(c => c.cliTelefone == telefoneFormatado);
            if (telefoneExiste != null)
            {
                await DisplayAlert("Erro", "Telefone já cadastrado.", "OK");
                return;
            }

            var cpfExiste = db.Table<Cliente>().FirstOrDefault(c => c.cliCPF == cpfFormatado);
            if (cpfExiste != null)
            {
                await DisplayAlert("Erro", "CPF já cadastrado.", "OK");
                return;
            }

            Cliente novoCliente = new Cliente
            {
                cliNome = nome,
                cliCPF = cpfFormatado,
                cliEmail = email,
                cliTelefone = telefoneFormatado,
                cliGenero = genero,
                cliDataNascimento = nascimento,
                cliDataCadastro = DateTime.Now
            };

            db.Insert(novoCliente);

            await DisplayAlert("Sucesso", "Cliente cadastrado com sucesso.", "OK");
            await Navigation.PushAsync(new MyAccount());
        }
    }
}
