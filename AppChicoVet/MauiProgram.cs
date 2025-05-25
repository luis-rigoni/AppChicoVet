using Microsoft.Extensions.Logging;
using Microsoft.Maui.Platform;

namespace AppChicoVet;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

#if DEBUG
        builder.Logging.AddDebug();
#endif

        Microsoft.Maui.Handlers.WindowHandler.Mapper.AppendToMapping("StatusBarColor", static (handler, view) =>
        {
#if ANDROID
            var activity = (Android.App.Activity)handler.PlatformView;
            var window = activity.Window;
#pragma warning disable CS8602 
            window.SetStatusBarColor(Android.Graphics.Color.ParseColor("#513635"));
#pragma warning restore CS8602 
#endif
        });

        return builder.Build();
    }
}