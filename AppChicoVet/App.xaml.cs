using AppChicoVet.Helpers;

namespace AppChicoVet
{
    public partial class App : Application
    {

        static SQLiteDatabaseHelpers _db;
        public static SQLiteDatabaseHelpers Db
        {

            get
            {

                if (_db == null)
                {

                    string path = Path.Combine(
                            Environment.GetFolderPath(
                                Environment.SpecialFolder.LocalApplicationData),
                                "db_veterinario.db3");

                    _db = new SQLiteDatabaseHelpers(path);

                }

                return _db;

            }

        }

        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}
