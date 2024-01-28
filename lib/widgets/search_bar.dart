import 'package:flutter/material.dart';
import 'package:paldex/utils/fonts/fonts.dart';
import 'package:paldex/utils/texts/app_texts.dart';
import 'package:provider/provider.dart';

import '../provider/pal_provider.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({Key? key}) : super(key: key);

  @override
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pesquisarPal = AppFonts.pesquisarPal(context);

    return Container(
      margin: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(maxWidth: 800.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          Provider.of<PalProvider>(context, listen: false).searchPals(value);
                },
        style: pesquisarPal,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          hintText: AppTexts.pesquisarPal,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}