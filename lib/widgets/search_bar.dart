import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/pal_provider.dart';
import '../../utils/elements/elements_const.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({Key? key}) : super(key: key);

  @override
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  final TextEditingController _searchController = TextEditingController();
  // ignore: unused_field
  String? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(maxWidth: 800.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              Provider.of<PalProvider>(context, listen: false).searchPals(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              hintText: 'Pesquisar',
              prefixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.filter_list),
                onSelected: (String result) {
                  _applyFilter(result);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Raridade Crescente',
                    child: Text('Raridade Crescente'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Raridade Decrescente',
                    child: Text('Raridade Decrescente'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Número Crescente',
                    child: Text('Número Crescente'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Número Decrescente',
                    child: Text('Número Decrescente'),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<String>(
                    value: 'Elemento',
                    child: Text('Elemento'),
                  ),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _applyFilter(String filter) {
  setState(() {
    _selectedFilter = filter;
  });

  switch (filter) {
    case 'Raridade Crescente':
      Provider.of<PalProvider>(context, listen: false).getPalsByRarityAscending();
      break;
    case 'Raridade Decrescente':
      Provider.of<PalProvider>(context, listen: false).getPalsByRarityDescending();
      break;
    case 'Número Crescente':
      Provider.of<PalProvider>(context, listen: false).getPalsByNumberAscending();
      break;
    case 'Número Decrescente':
      Provider.of<PalProvider>(context, listen: false).getPalsByNumberDescending();
      break;
    case 'Elemento':
      _showElementPicker(context);
      break;
    default:
      break;
  }
}

  void _showElementPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecionar Elemento'),
          content: SingleChildScrollView(
            child: Column(
              children: ElementsConstants.elements.entries
                  .map(
                    (entry) => ListTile(
                      title: Text(entry.key),
                      onTap: () {
                        Provider.of<PalProvider>(context, listen: false).getPalsByElement(entry.value);
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
