; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [318 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [630 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 235
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 269
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 310
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 188
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 253
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 253
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 273
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 209
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 255
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 307
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 308
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 207
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 229
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 35: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 212
	i32 276479776, ; 36: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 37: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 231
	i32 280482487, ; 38: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 228
	i32 280992041, ; 39: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 279
	i32 291076382, ; 40: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 41: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 42: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 307
	i32 318968648, ; 43: Xamarin.AndroidX.Activity.dll => 0x13031348 => 198
	i32 321597661, ; 44: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 45: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 292
	i32 342366114, ; 46: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 230
	i32 356389973, ; 47: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 291
	i32 360082299, ; 48: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 49: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 50: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 51: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 52: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 53: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 54: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 55: _Microsoft.Android.Resource.Designer => 0x17969339 => 314
	i32 403441872, ; 56: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 57: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 303
	i32 441335492, ; 58: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 213
	i32 442565967, ; 59: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 60: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 226
	i32 451504562, ; 61: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 62: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 63: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 64: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 65: System.dll => 0x1bff388e => 164
	i32 476646585, ; 66: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 228
	i32 486930444, ; 67: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 241
	i32 498788369, ; 68: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 69: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 290
	i32 503918385, ; 70: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 284
	i32 513247710, ; 71: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 182
	i32 526420162, ; 72: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 73: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 273
	i32 530272170, ; 74: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 75: Microsoft.Extensions.Logging => 0x20216150 => 178
	i32 540030774, ; 76: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 77: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 78: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 79: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 80: Jsr305Binding => 0x213954e7 => 266
	i32 569601784, ; 81: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 264
	i32 577335427, ; 82: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 83: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 298
	i32 601371474, ; 84: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 85: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 86: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 87: Xamarin.AndroidX.CustomView => 0x2568904f => 218
	i32 627931235, ; 88: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 296
	i32 639843206, ; 89: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 224
	i32 643868501, ; 90: System.Net => 0x2660a755 => 81
	i32 662205335, ; 91: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 92: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 260
	i32 666292255, ; 93: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 205
	i32 672442732, ; 94: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 95: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 96: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 278
	i32 690569205, ; 97: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 98: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 275
	i32 693804605, ; 99: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 100: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 101: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 270
	i32 700358131, ; 102: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 103: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 293
	i32 709557578, ; 104: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 281
	i32 720511267, ; 105: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 274
	i32 722857257, ; 106: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 107: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 108: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 190
	i32 752232764, ; 109: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 110: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 195
	i32 759454413, ; 111: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 112: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 113: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 114: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 302
	i32 789151979, ; 115: Microsoft.Extensions.Options => 0x2f0980eb => 181
	i32 790371945, ; 116: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 219
	i32 804715423, ; 117: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 118: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 233
	i32 823281589, ; 119: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 120: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 121: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 122: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 123: Xamarin.AndroidX.Print => 0x3246f6cd => 246
	i32 873119928, ; 124: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 125: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 126: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 127: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 128: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 129: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 305
	i32 928116545, ; 130: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 269
	i32 952186615, ; 131: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 132: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 274
	i32 966729478, ; 133: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 267
	i32 967690846, ; 134: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 230
	i32 975236339, ; 135: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 136: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 137: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 138: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 139: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 140: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 141: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 142: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 250
	i32 1019214401, ; 143: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 144: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 177
	i32 1029334545, ; 145: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 280
	i32 1031528504, ; 146: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 268
	i32 1035644815, ; 147: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 203
	i32 1036536393, ; 148: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 149: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 150: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 237
	i32 1055979864, ; 151: SQLitePCLRaw.lib.e_sqlcipher.android.dll => 0x3ef0f958 => 192
	i32 1067306892, ; 152: GoogleGson => 0x3f9dcf8c => 173
	i32 1075584133, ; 153: SQLitePCLRaw.lib.e_sqlcipher.android => 0x401c1c85 => 192
	i32 1078116993, ; 154: AppChicoVet => 0x4042c281 => 0
	i32 1082857460, ; 155: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 156: Xamarin.Kotlin.StdLib => 0x409e66d8 => 271
	i32 1098259244, ; 157: System => 0x41761b2c => 164
	i32 1118262833, ; 158: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 293
	i32 1121599056, ; 159: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 236
	i32 1127624469, ; 160: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 180
	i32 1149092582, ; 161: Xamarin.AndroidX.Window => 0x447dc2e6 => 263
	i32 1168523401, ; 162: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 299
	i32 1170634674, ; 163: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 164: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 259
	i32 1178241025, ; 165: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 244
	i32 1203215381, ; 166: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 297
	i32 1204270330, ; 167: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 205
	i32 1208641965, ; 168: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 169: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 170: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 295
	i32 1243150071, ; 171: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 264
	i32 1253011324, ; 172: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 173: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 279
	i32 1264511973, ; 174: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 254
	i32 1267360935, ; 175: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 258
	i32 1273260888, ; 176: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 210
	i32 1275534314, ; 177: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 275
	i32 1278448581, ; 178: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 202
	i32 1292207520, ; 179: SQLitePCLRaw.core.dll => 0x4d0585a0 => 191
	i32 1293217323, ; 180: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 221
	i32 1309188875, ; 181: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 182: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 263
	i32 1324164729, ; 183: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 184: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 185: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 186: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 309
	i32 1376866003, ; 187: Xamarin.AndroidX.SavedState => 0x52114ed3 => 250
	i32 1379779777, ; 188: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 189: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 190: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 214
	i32 1408764838, ; 191: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 192: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 193: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 194: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 277
	i32 1434145427, ; 195: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 196: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 267
	i32 1439761251, ; 197: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 198: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 199: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 200: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 201: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 202: es\Microsoft.Maui.Controls.resources => 0x57152abe => 283
	i32 1461234159, ; 203: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 204: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 205: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 206: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 204
	i32 1470490898, ; 207: Microsoft.Extensions.Primitives => 0x57a5e912 => 182
	i32 1479771757, ; 208: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 209: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 210: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 211: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 251
	i32 1493001747, ; 212: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 287
	i32 1514721132, ; 213: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 282
	i32 1536373174, ; 214: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 215: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 216: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 217: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 218: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 302
	i32 1564802854, ; 219: SQLitePCLRaw.provider.e_sqlcipher.dll => 0x5d44ff26 => 193
	i32 1565862583, ; 220: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 221: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 222: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 223: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 224: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 220
	i32 1592978981, ; 225: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 226: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 268
	i32 1601112923, ; 227: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 228: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 311
	i32 1604827217, ; 229: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 230: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 231: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 240
	i32 1622358360, ; 232: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 233: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 262
	i32 1635184631, ; 234: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 224
	i32 1636350590, ; 235: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 217
	i32 1639515021, ; 236: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 237: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 238: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 239: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 240: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 256
	i32 1658251792, ; 241: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 265
	i32 1670060433, ; 242: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 212
	i32 1675553242, ; 243: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 244: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 245: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 246: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 247: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 248: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 249: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 272
	i32 1701541528, ; 250: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 251: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 233
	i32 1726116996, ; 252: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 253: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 254: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 208
	i32 1736233607, ; 255: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 300
	i32 1743415430, ; 256: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 278
	i32 1744735666, ; 257: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 258: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 259: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 260: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 261: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 262: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 263: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 255
	i32 1770582343, ; 264: Microsoft.Extensions.Logging.dll => 0x6988f147 => 178
	i32 1776026572, ; 265: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 266: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 267: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 268: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 294
	i32 1788241197, ; 269: Xamarin.AndroidX.Fragment => 0x6a96652d => 226
	i32 1793755602, ; 270: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 286
	i32 1808609942, ; 271: Xamarin.AndroidX.Loader => 0x6bcd3296 => 240
	i32 1813058853, ; 272: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 271
	i32 1813201214, ; 273: Xamarin.Google.Android.Material => 0x6c13413e => 265
	i32 1818569960, ; 274: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 245
	i32 1818787751, ; 275: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 276: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 277: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 278: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 313
	i32 1828688058, ; 279: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 179
	i32 1842015223, ; 280: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 306
	i32 1847515442, ; 281: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 195
	i32 1853025655, ; 282: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 303
	i32 1858542181, ; 283: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 284: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 285: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 285
	i32 1879696579, ; 286: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 287: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 206
	i32 1885918049, ; 288: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 313
	i32 1888955245, ; 289: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 290: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 291: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 292: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 293: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 294: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 295: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 296: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 252
	i32 1968388702, ; 297: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 174
	i32 1983156543, ; 298: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 272
	i32 1985761444, ; 299: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 197
	i32 2003115576, ; 300: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 282
	i32 2011961780, ; 301: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 302: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 237
	i32 2025202353, ; 303: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 277
	i32 2031763787, ; 304: Xamarin.Android.Glide => 0x791a414b => 194
	i32 2041304461, ; 305: AppChicoVet.dll => 0x79abd58d => 0
	i32 2045470958, ; 306: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 307: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 232
	i32 2060060697, ; 308: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 309: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 281
	i32 2070888862, ; 310: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 311: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 312: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 313: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 314: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 315: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 316: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 317: Microsoft.Maui => 0x80bd55ad => 186
	i32 2169148018, ; 318: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 289
	i32 2181898931, ; 319: Microsoft.Extensions.Options.dll => 0x820d22b3 => 181
	i32 2192057212, ; 320: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 179
	i32 2193016926, ; 321: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 322: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 276
	i32 2201231467, ; 323: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 324: it\Microsoft.Maui.Controls.resources => 0x839595db => 291
	i32 2217644978, ; 325: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 259
	i32 2222056684, ; 326: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 327: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 241
	i32 2252106437, ; 328: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 329: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 330: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 331: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 175
	i32 2267999099, ; 332: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 196
	i32 2270573516, ; 333: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 285
	i32 2279755925, ; 334: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 248
	i32 2293034957, ; 335: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 336: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 337: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 338: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 295
	i32 2305521784, ; 339: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 340: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 200
	i32 2320631194, ; 341: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 342: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 343: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 344: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 345: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 346: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 174
	i32 2378619854, ; 347: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 348: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 349: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 290
	i32 2401565422, ; 350: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 351: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 223
	i32 2409983638, ; 352: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 312
	i32 2421380589, ; 353: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 354: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 210
	i32 2427813419, ; 355: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 287
	i32 2435356389, ; 356: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 357: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 358: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 359: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 360: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 361: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 190
	i32 2465532216, ; 362: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 213
	i32 2471841756, ; 363: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 364: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 365: Microsoft.Maui.Controls => 0x93dba8a1 => 184
	i32 2483903535, ; 366: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 367: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 368: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 369: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 370: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 235
	i32 2522472828, ; 371: Xamarin.Android.Glide.dll => 0x9659e17c => 194
	i32 2538310050, ; 372: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 373: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 288
	i32 2562349572, ; 374: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 375: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 376: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 236
	i32 2581819634, ; 377: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 258
	i32 2585220780, ; 378: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 379: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 380: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 381: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 297
	i32 2605712449, ; 382: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 276
	i32 2615233544, ; 383: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 227
	i32 2616218305, ; 384: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 180
	i32 2617129537, ; 385: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 386: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 387: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 217
	i32 2624644809, ; 388: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 222
	i32 2626831493, ; 389: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 292
	i32 2627185994, ; 390: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 391: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 392: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 231
	i32 2663391936, ; 393: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 196
	i32 2663698177, ; 394: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 395: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 396: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 397: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 398: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 399: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 400: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 256
	i32 2715334215, ; 401: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 402: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 403: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 404: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 405: Xamarin.AndroidX.Activity => 0xa2e0939b => 198
	i32 2735172069, ; 406: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 407: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 204
	i32 2740948882, ; 408: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 409: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 410: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 298
	i32 2758225723, ; 411: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 185
	i32 2764765095, ; 412: Microsoft.Maui.dll => 0xa4caf7a7 => 186
	i32 2765824710, ; 413: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 414: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 270
	i32 2778768386, ; 415: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 261
	i32 2779977773, ; 416: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 249
	i32 2785988530, ; 417: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 304
	i32 2788224221, ; 418: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 227
	i32 2801831435, ; 419: Microsoft.Maui.Graphics => 0xa7008e0b => 188
	i32 2803228030, ; 420: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 421: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 283
	i32 2810250172, ; 422: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 214
	i32 2819470561, ; 423: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 424: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 425: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 249
	i32 2824502124, ; 426: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 427: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 296
	i32 2838993487, ; 428: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 238
	i32 2849599387, ; 429: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 430: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 261
	i32 2855708567, ; 431: Xamarin.AndroidX.Transition => 0xaa36a797 => 257
	i32 2861098320, ; 432: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 433: Microsoft.Maui.Essentials => 0xaa8a4878 => 187
	i32 2870099610, ; 434: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 199
	i32 2875164099, ; 435: Jsr305Binding.dll => 0xab5f85c3 => 266
	i32 2875220617, ; 436: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 437: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 225
	i32 2887636118, ; 438: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 439: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 440: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 441: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 442: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 443: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 444: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 262
	i32 2919462931, ; 445: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 446: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 201
	i32 2936416060, ; 447: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 448: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 449: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 450: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 451: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 452: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 453: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 221
	i32 2987532451, ; 454: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 252
	i32 2996846495, ; 455: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 234
	i32 3016983068, ; 456: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 254
	i32 3023353419, ; 457: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 458: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 229
	i32 3038032645, ; 459: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 314
	i32 3056245963, ; 460: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 251
	i32 3057625584, ; 461: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 242
	i32 3059408633, ; 462: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 463: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 464: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 465: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 289
	i32 3090735792, ; 466: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 467: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 468: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 469: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 470: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 471: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 472: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 473: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 474: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 475: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 476: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 477: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 243
	i32 3192346100, ; 478: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 479: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 480: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 481: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 482: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 220
	i32 3220365878, ; 483: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 484: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 485: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 486: Xamarin.AndroidX.CardView => 0xc235e84d => 208
	i32 3265493905, ; 487: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 488: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 489: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 490: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 491: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 492: SQLite-net.dll => 0xc3e9b3a2 => 189
	i32 3290767353, ; 493: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 494: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 495: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 496: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 284
	i32 3316684772, ; 497: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 498: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 218
	i32 3317144872, ; 499: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 500: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 206
	i32 3345895724, ; 501: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 247
	i32 3346324047, ; 502: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 244
	i32 3357674450, ; 503: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 301
	i32 3358260929, ; 504: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 505: SQLitePCLRaw.core => 0xc849ca45 => 191
	i32 3362336904, ; 506: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 199
	i32 3362522851, ; 507: Xamarin.AndroidX.Core => 0xc86c06e3 => 215
	i32 3366347497, ; 508: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 509: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 248
	i32 3381016424, ; 510: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 280
	i32 3395150330, ; 511: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 512: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 513: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 219
	i32 3428513518, ; 514: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 176
	i32 3429136800, ; 515: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 516: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 517: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 222
	i32 3445260447, ; 518: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 519: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 183
	i32 3463511458, ; 520: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 288
	i32 3471940407, ; 521: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 522: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 523: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 301
	i32 3484440000, ; 524: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 300
	i32 3485117614, ; 525: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 526: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 527: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 211
	i32 3509114376, ; 528: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 529: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 530: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 531: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 532: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 533: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 534: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 308
	i32 3597029428, ; 535: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 197
	i32 3598340787, ; 536: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 537: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 538: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 539: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 246
	i32 3633644679, ; 540: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 201
	i32 3638274909, ; 541: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 542: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 232
	i32 3643446276, ; 543: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 305
	i32 3643854240, ; 544: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 243
	i32 3645089577, ; 545: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 546: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 175
	i32 3660523487, ; 547: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 548: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676670898, ; 549: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 311
	i32 3682565725, ; 550: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 207
	i32 3684561358, ; 551: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 211
	i32 3697841164, ; 552: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 310
	i32 3700866549, ; 553: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 554: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 216
	i32 3716563718, ; 555: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 556: Xamarin.AndroidX.Annotation => 0xdda814c6 => 200
	i32 3724971120, ; 557: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 242
	i32 3732100267, ; 558: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 559: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 560: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 561: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 562: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 209
	i32 3792276235, ; 563: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 564: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 183
	i32 3802395368, ; 565: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 566: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 567: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 568: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 569: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 177
	i32 3844307129, ; 570: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 571: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 572: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 573: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 574: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 575: SQLite-net => 0xe70c9739 => 189
	i32 3885497537, ; 576: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 577: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 257
	i32 3888767677, ; 578: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 247
	i32 3889960447, ; 579: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 309
	i32 3896106733, ; 580: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 581: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 215
	i32 3901907137, ; 582: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 583: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 584: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 260
	i32 3928044579, ; 585: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 586: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 587: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 245
	i32 3945713374, ; 588: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 589: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 590: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 203
	i32 3959773229, ; 591: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 234
	i32 3980434154, ; 592: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 304
	i32 3987592930, ; 593: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 286
	i32 4003436829, ; 594: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 595: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 202
	i32 4025784931, ; 596: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 597: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 185
	i32 4054681211, ; 598: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 599: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 600: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 601: Microsoft.Maui.Essentials.dll => 0xf40add04 => 187
	i32 4099507663, ; 602: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 603: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 604: Xamarin.AndroidX.Emoji2 => 0xf479582c => 223
	i32 4102112229, ; 605: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 299
	i32 4125707920, ; 606: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 294
	i32 4126470640, ; 607: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 176
	i32 4127667938, ; 608: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 609: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 610: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 611: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 306
	i32 4151237749, ; 612: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 613: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 614: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 615: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 616: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 617: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 239
	i32 4182880526, ; 618: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 312
	i32 4185676441, ; 619: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 620: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 621: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4254412227, ; 622: SQLitePCLRaw.provider.e_sqlcipher => 0xfd952dc3 => 193
	i32 4256097574, ; 623: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 216
	i32 4258378803, ; 624: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 238
	i32 4260525087, ; 625: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 626: Microsoft.Maui.Controls.dll => 0xfea12dee => 184
	i32 4274976490, ; 627: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 628: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 239
	i32 4294763496 ; 629: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 225
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [630 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 235, ; 3
	i32 269, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 310, ; 9
	i32 124, ; 10
	i32 188, ; 11
	i32 102, ; 12
	i32 253, ; 13
	i32 107, ; 14
	i32 253, ; 15
	i32 139, ; 16
	i32 273, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 209, ; 21
	i32 132, ; 22
	i32 255, ; 23
	i32 151, ; 24
	i32 307, ; 25
	i32 308, ; 26
	i32 18, ; 27
	i32 207, ; 28
	i32 26, ; 29
	i32 229, ; 30
	i32 1, ; 31
	i32 59, ; 32
	i32 42, ; 33
	i32 91, ; 34
	i32 212, ; 35
	i32 147, ; 36
	i32 231, ; 37
	i32 228, ; 38
	i32 279, ; 39
	i32 54, ; 40
	i32 69, ; 41
	i32 307, ; 42
	i32 198, ; 43
	i32 83, ; 44
	i32 292, ; 45
	i32 230, ; 46
	i32 291, ; 47
	i32 131, ; 48
	i32 55, ; 49
	i32 149, ; 50
	i32 74, ; 51
	i32 145, ; 52
	i32 62, ; 53
	i32 146, ; 54
	i32 314, ; 55
	i32 165, ; 56
	i32 303, ; 57
	i32 213, ; 58
	i32 12, ; 59
	i32 226, ; 60
	i32 125, ; 61
	i32 152, ; 62
	i32 113, ; 63
	i32 166, ; 64
	i32 164, ; 65
	i32 228, ; 66
	i32 241, ; 67
	i32 84, ; 68
	i32 290, ; 69
	i32 284, ; 70
	i32 182, ; 71
	i32 150, ; 72
	i32 273, ; 73
	i32 60, ; 74
	i32 178, ; 75
	i32 51, ; 76
	i32 103, ; 77
	i32 114, ; 78
	i32 40, ; 79
	i32 266, ; 80
	i32 264, ; 81
	i32 120, ; 82
	i32 298, ; 83
	i32 52, ; 84
	i32 44, ; 85
	i32 119, ; 86
	i32 218, ; 87
	i32 296, ; 88
	i32 224, ; 89
	i32 81, ; 90
	i32 136, ; 91
	i32 260, ; 92
	i32 205, ; 93
	i32 8, ; 94
	i32 73, ; 95
	i32 278, ; 96
	i32 155, ; 97
	i32 275, ; 98
	i32 154, ; 99
	i32 92, ; 100
	i32 270, ; 101
	i32 45, ; 102
	i32 293, ; 103
	i32 281, ; 104
	i32 274, ; 105
	i32 109, ; 106
	i32 129, ; 107
	i32 190, ; 108
	i32 25, ; 109
	i32 195, ; 110
	i32 72, ; 111
	i32 55, ; 112
	i32 46, ; 113
	i32 302, ; 114
	i32 181, ; 115
	i32 219, ; 116
	i32 22, ; 117
	i32 233, ; 118
	i32 86, ; 119
	i32 43, ; 120
	i32 160, ; 121
	i32 71, ; 122
	i32 246, ; 123
	i32 3, ; 124
	i32 42, ; 125
	i32 63, ; 126
	i32 16, ; 127
	i32 53, ; 128
	i32 305, ; 129
	i32 269, ; 130
	i32 105, ; 131
	i32 274, ; 132
	i32 267, ; 133
	i32 230, ; 134
	i32 34, ; 135
	i32 158, ; 136
	i32 85, ; 137
	i32 32, ; 138
	i32 12, ; 139
	i32 51, ; 140
	i32 56, ; 141
	i32 250, ; 142
	i32 36, ; 143
	i32 177, ; 144
	i32 280, ; 145
	i32 268, ; 146
	i32 203, ; 147
	i32 35, ; 148
	i32 58, ; 149
	i32 237, ; 150
	i32 192, ; 151
	i32 173, ; 152
	i32 192, ; 153
	i32 0, ; 154
	i32 17, ; 155
	i32 271, ; 156
	i32 164, ; 157
	i32 293, ; 158
	i32 236, ; 159
	i32 180, ; 160
	i32 263, ; 161
	i32 299, ; 162
	i32 153, ; 163
	i32 259, ; 164
	i32 244, ; 165
	i32 297, ; 166
	i32 205, ; 167
	i32 29, ; 168
	i32 52, ; 169
	i32 295, ; 170
	i32 264, ; 171
	i32 5, ; 172
	i32 279, ; 173
	i32 254, ; 174
	i32 258, ; 175
	i32 210, ; 176
	i32 275, ; 177
	i32 202, ; 178
	i32 191, ; 179
	i32 221, ; 180
	i32 85, ; 181
	i32 263, ; 182
	i32 61, ; 183
	i32 112, ; 184
	i32 57, ; 185
	i32 309, ; 186
	i32 250, ; 187
	i32 99, ; 188
	i32 19, ; 189
	i32 214, ; 190
	i32 111, ; 191
	i32 101, ; 192
	i32 102, ; 193
	i32 277, ; 194
	i32 104, ; 195
	i32 267, ; 196
	i32 71, ; 197
	i32 38, ; 198
	i32 32, ; 199
	i32 103, ; 200
	i32 73, ; 201
	i32 283, ; 202
	i32 9, ; 203
	i32 123, ; 204
	i32 46, ; 205
	i32 204, ; 206
	i32 182, ; 207
	i32 9, ; 208
	i32 43, ; 209
	i32 4, ; 210
	i32 251, ; 211
	i32 287, ; 212
	i32 282, ; 213
	i32 31, ; 214
	i32 138, ; 215
	i32 92, ; 216
	i32 93, ; 217
	i32 302, ; 218
	i32 193, ; 219
	i32 49, ; 220
	i32 141, ; 221
	i32 112, ; 222
	i32 140, ; 223
	i32 220, ; 224
	i32 115, ; 225
	i32 268, ; 226
	i32 157, ; 227
	i32 311, ; 228
	i32 76, ; 229
	i32 79, ; 230
	i32 240, ; 231
	i32 37, ; 232
	i32 262, ; 233
	i32 224, ; 234
	i32 217, ; 235
	i32 64, ; 236
	i32 138, ; 237
	i32 15, ; 238
	i32 116, ; 239
	i32 256, ; 240
	i32 265, ; 241
	i32 212, ; 242
	i32 48, ; 243
	i32 70, ; 244
	i32 80, ; 245
	i32 126, ; 246
	i32 94, ; 247
	i32 121, ; 248
	i32 272, ; 249
	i32 26, ; 250
	i32 233, ; 251
	i32 97, ; 252
	i32 28, ; 253
	i32 208, ; 254
	i32 300, ; 255
	i32 278, ; 256
	i32 149, ; 257
	i32 169, ; 258
	i32 4, ; 259
	i32 98, ; 260
	i32 33, ; 261
	i32 93, ; 262
	i32 255, ; 263
	i32 178, ; 264
	i32 21, ; 265
	i32 41, ; 266
	i32 170, ; 267
	i32 294, ; 268
	i32 226, ; 269
	i32 286, ; 270
	i32 240, ; 271
	i32 271, ; 272
	i32 265, ; 273
	i32 245, ; 274
	i32 2, ; 275
	i32 134, ; 276
	i32 111, ; 277
	i32 313, ; 278
	i32 179, ; 279
	i32 306, ; 280
	i32 195, ; 281
	i32 303, ; 282
	i32 58, ; 283
	i32 95, ; 284
	i32 285, ; 285
	i32 39, ; 286
	i32 206, ; 287
	i32 313, ; 288
	i32 25, ; 289
	i32 94, ; 290
	i32 89, ; 291
	i32 99, ; 292
	i32 10, ; 293
	i32 87, ; 294
	i32 100, ; 295
	i32 252, ; 296
	i32 174, ; 297
	i32 272, ; 298
	i32 197, ; 299
	i32 282, ; 300
	i32 7, ; 301
	i32 237, ; 302
	i32 277, ; 303
	i32 194, ; 304
	i32 0, ; 305
	i32 88, ; 306
	i32 232, ; 307
	i32 154, ; 308
	i32 281, ; 309
	i32 33, ; 310
	i32 116, ; 311
	i32 82, ; 312
	i32 20, ; 313
	i32 11, ; 314
	i32 162, ; 315
	i32 3, ; 316
	i32 186, ; 317
	i32 289, ; 318
	i32 181, ; 319
	i32 179, ; 320
	i32 84, ; 321
	i32 276, ; 322
	i32 64, ; 323
	i32 291, ; 324
	i32 259, ; 325
	i32 143, ; 326
	i32 241, ; 327
	i32 157, ; 328
	i32 41, ; 329
	i32 117, ; 330
	i32 175, ; 331
	i32 196, ; 332
	i32 285, ; 333
	i32 248, ; 334
	i32 131, ; 335
	i32 75, ; 336
	i32 66, ; 337
	i32 295, ; 338
	i32 172, ; 339
	i32 200, ; 340
	i32 143, ; 341
	i32 106, ; 342
	i32 151, ; 343
	i32 70, ; 344
	i32 156, ; 345
	i32 174, ; 346
	i32 121, ; 347
	i32 127, ; 348
	i32 290, ; 349
	i32 152, ; 350
	i32 223, ; 351
	i32 312, ; 352
	i32 141, ; 353
	i32 210, ; 354
	i32 287, ; 355
	i32 20, ; 356
	i32 14, ; 357
	i32 135, ; 358
	i32 75, ; 359
	i32 59, ; 360
	i32 190, ; 361
	i32 213, ; 362
	i32 167, ; 363
	i32 168, ; 364
	i32 184, ; 365
	i32 15, ; 366
	i32 74, ; 367
	i32 6, ; 368
	i32 23, ; 369
	i32 235, ; 370
	i32 194, ; 371
	i32 91, ; 372
	i32 288, ; 373
	i32 1, ; 374
	i32 136, ; 375
	i32 236, ; 376
	i32 258, ; 377
	i32 134, ; 378
	i32 69, ; 379
	i32 146, ; 380
	i32 297, ; 381
	i32 276, ; 382
	i32 227, ; 383
	i32 180, ; 384
	i32 88, ; 385
	i32 96, ; 386
	i32 217, ; 387
	i32 222, ; 388
	i32 292, ; 389
	i32 31, ; 390
	i32 45, ; 391
	i32 231, ; 392
	i32 196, ; 393
	i32 109, ; 394
	i32 158, ; 395
	i32 35, ; 396
	i32 22, ; 397
	i32 114, ; 398
	i32 57, ; 399
	i32 256, ; 400
	i32 144, ; 401
	i32 118, ; 402
	i32 120, ; 403
	i32 110, ; 404
	i32 198, ; 405
	i32 139, ; 406
	i32 204, ; 407
	i32 54, ; 408
	i32 105, ; 409
	i32 298, ; 410
	i32 185, ; 411
	i32 186, ; 412
	i32 133, ; 413
	i32 270, ; 414
	i32 261, ; 415
	i32 249, ; 416
	i32 304, ; 417
	i32 227, ; 418
	i32 188, ; 419
	i32 159, ; 420
	i32 283, ; 421
	i32 214, ; 422
	i32 163, ; 423
	i32 132, ; 424
	i32 249, ; 425
	i32 161, ; 426
	i32 296, ; 427
	i32 238, ; 428
	i32 140, ; 429
	i32 261, ; 430
	i32 257, ; 431
	i32 169, ; 432
	i32 187, ; 433
	i32 199, ; 434
	i32 266, ; 435
	i32 40, ; 436
	i32 225, ; 437
	i32 81, ; 438
	i32 56, ; 439
	i32 37, ; 440
	i32 97, ; 441
	i32 166, ; 442
	i32 172, ; 443
	i32 262, ; 444
	i32 82, ; 445
	i32 201, ; 446
	i32 98, ; 447
	i32 30, ; 448
	i32 159, ; 449
	i32 18, ; 450
	i32 127, ; 451
	i32 119, ; 452
	i32 221, ; 453
	i32 252, ; 454
	i32 234, ; 455
	i32 254, ; 456
	i32 165, ; 457
	i32 229, ; 458
	i32 314, ; 459
	i32 251, ; 460
	i32 242, ; 461
	i32 170, ; 462
	i32 16, ; 463
	i32 144, ; 464
	i32 289, ; 465
	i32 125, ; 466
	i32 118, ; 467
	i32 38, ; 468
	i32 115, ; 469
	i32 47, ; 470
	i32 142, ; 471
	i32 117, ; 472
	i32 34, ; 473
	i32 173, ; 474
	i32 95, ; 475
	i32 53, ; 476
	i32 243, ; 477
	i32 129, ; 478
	i32 153, ; 479
	i32 24, ; 480
	i32 161, ; 481
	i32 220, ; 482
	i32 148, ; 483
	i32 104, ; 484
	i32 89, ; 485
	i32 208, ; 486
	i32 60, ; 487
	i32 142, ; 488
	i32 100, ; 489
	i32 5, ; 490
	i32 13, ; 491
	i32 189, ; 492
	i32 122, ; 493
	i32 135, ; 494
	i32 28, ; 495
	i32 284, ; 496
	i32 72, ; 497
	i32 218, ; 498
	i32 24, ; 499
	i32 206, ; 500
	i32 247, ; 501
	i32 244, ; 502
	i32 301, ; 503
	i32 137, ; 504
	i32 191, ; 505
	i32 199, ; 506
	i32 215, ; 507
	i32 168, ; 508
	i32 248, ; 509
	i32 280, ; 510
	i32 101, ; 511
	i32 123, ; 512
	i32 219, ; 513
	i32 176, ; 514
	i32 163, ; 515
	i32 167, ; 516
	i32 222, ; 517
	i32 39, ; 518
	i32 183, ; 519
	i32 288, ; 520
	i32 17, ; 521
	i32 171, ; 522
	i32 301, ; 523
	i32 300, ; 524
	i32 137, ; 525
	i32 150, ; 526
	i32 211, ; 527
	i32 155, ; 528
	i32 130, ; 529
	i32 19, ; 530
	i32 65, ; 531
	i32 147, ; 532
	i32 47, ; 533
	i32 308, ; 534
	i32 197, ; 535
	i32 79, ; 536
	i32 61, ; 537
	i32 106, ; 538
	i32 246, ; 539
	i32 201, ; 540
	i32 49, ; 541
	i32 232, ; 542
	i32 305, ; 543
	i32 243, ; 544
	i32 14, ; 545
	i32 175, ; 546
	i32 68, ; 547
	i32 171, ; 548
	i32 311, ; 549
	i32 207, ; 550
	i32 211, ; 551
	i32 310, ; 552
	i32 78, ; 553
	i32 216, ; 554
	i32 108, ; 555
	i32 200, ; 556
	i32 242, ; 557
	i32 67, ; 558
	i32 63, ; 559
	i32 27, ; 560
	i32 160, ; 561
	i32 209, ; 562
	i32 10, ; 563
	i32 183, ; 564
	i32 11, ; 565
	i32 78, ; 566
	i32 126, ; 567
	i32 83, ; 568
	i32 177, ; 569
	i32 66, ; 570
	i32 107, ; 571
	i32 65, ; 572
	i32 128, ; 573
	i32 122, ; 574
	i32 189, ; 575
	i32 77, ; 576
	i32 257, ; 577
	i32 247, ; 578
	i32 309, ; 579
	i32 8, ; 580
	i32 215, ; 581
	i32 2, ; 582
	i32 44, ; 583
	i32 260, ; 584
	i32 156, ; 585
	i32 128, ; 586
	i32 245, ; 587
	i32 23, ; 588
	i32 133, ; 589
	i32 203, ; 590
	i32 234, ; 591
	i32 304, ; 592
	i32 286, ; 593
	i32 29, ; 594
	i32 202, ; 595
	i32 62, ; 596
	i32 185, ; 597
	i32 90, ; 598
	i32 87, ; 599
	i32 148, ; 600
	i32 187, ; 601
	i32 36, ; 602
	i32 86, ; 603
	i32 223, ; 604
	i32 299, ; 605
	i32 294, ; 606
	i32 176, ; 607
	i32 50, ; 608
	i32 6, ; 609
	i32 90, ; 610
	i32 306, ; 611
	i32 21, ; 612
	i32 162, ; 613
	i32 96, ; 614
	i32 50, ; 615
	i32 113, ; 616
	i32 239, ; 617
	i32 312, ; 618
	i32 130, ; 619
	i32 76, ; 620
	i32 27, ; 621
	i32 193, ; 622
	i32 216, ; 623
	i32 238, ; 624
	i32 7, ; 625
	i32 184, ; 626
	i32 110, ; 627
	i32 239, ; 628
	i32 225 ; 629
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
