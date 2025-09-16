# pokedex

A new Flutter project about pokemons.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Libraries

# Cupertino Icons
This is an asset repo containing the default set of icon assets used by Flutter's Cupertino widgets.

dependencies:
  cupertino_icons: ^<latest-version>

# Dio
A powerful HTTP networking package for Dart/Flutter, makes api calls, supports Global configuration, Interceptors, FormData, Request cancellation, File uploading/downloading, Timeout, Custom adapters, Transformers, etc.

dependencies:
  dio: ^5.9.0

final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://dart.dev');
  print(response);
}

# Flutter Screen Util
A flutter plugin for adapting screen and font size.Let your UI display a reasonable layout on different screen sizes!

Usage:
dependencies:
  flutter:
    sdk: flutter
  flutter_screenutil: ^{latest version}

Add the following imports to your Dart code #
import 'package:flutter_screenutil/flutter_screenutil.dart';

# Google Fonts
A Flutter package to use fonts from fonts.google.com.

Text('This is Google Fonts', style: GoogleFonts.lato()),

# Cached Network Image
A flutter library to show images from the internet and keep them in the cache directory.

CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
