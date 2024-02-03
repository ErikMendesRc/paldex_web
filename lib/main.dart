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
      child: const Paltable(),
    ),
  );
}

class Paltable extends StatelessWidget {
  const Paltable({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      title: 'Paltable Brasil',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/detalhes') {
          final args = settings.arguments as Map<String, dynamic>?;

          return MaterialPageRoute(
            builder: (context) => PalDetailsScreen(palID: args?['palID']),
          );
        }
        return null;
      },
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}