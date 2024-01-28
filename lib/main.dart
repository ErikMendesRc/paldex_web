import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paldex/config/api_client.dart';
import 'package:paldex/config/api_config.dart';
import 'package:provider/provider.dart';
import 'package:paldex/provider/pal_provider.dart';

import 'screens/homescreen.dart';
import 'screens/pal_details.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PalProvider(apiClient: ApiClient(baseUrl: ApiConfig.baseUrl))),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      title: 'Paldex - Encontre seu Pal Favorito',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homescreen',
      onGenerateRoute: (settings) {
        if (settings.name == '/palDetails') {
          final args = settings.arguments as Map<String, dynamic>?;

          return MaterialPageRoute(
            builder: (context) => PalDetailsScreen(palID: args?['palID']),
          );
        }
        return null;
      },
      routes: {
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}