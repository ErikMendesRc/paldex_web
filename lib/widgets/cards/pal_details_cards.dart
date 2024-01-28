import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paldex/utils/fonts/fonts.dart';
import 'package:paldex/widgets/my_clipper.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';
import '../../controllers/pal_list_attributes_controller.dart';
import '../../models/pal.dart';
import '../../provider/pal_provider.dart';
import '../element_icons.dart';

class PalCardDetails extends StatelessWidget {
  final int palID;

  const PalCardDetails({
    required this.palID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palProvider = Provider.of<PalProvider>(context, listen: false);
    return FutureBuilder<Pal>(
      future: palProvider.getPalById(palID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data available');
        }
        final Pal pal = snapshot.data!;
        final palAttributesController = PalAttributesController(pal: pal);
        final attributes = palAttributesController.getPalAttributes();
        final textAttributes = PalAttributesController.getNameAttributes();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 12,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElementIcons(elementos: pal.elementos),
                        const SizedBox(width: 8.0),
                        ClipOval(
                          clipper: MyClipper(),
                          child: CachedNetworkImage(
                            width: 150,
                            height: 150,
                            imageUrl: pal.imagePath,
                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: StrokeText(
                        text: pal.name,
                        textStyle: AppFonts.nomeWhite(context),
                        strokeColor: Colors.black,
                        strokeWidth: 2.0,
                      ),
                    ),
                    Center(
                      child: StrokeText(
                        text: pal.nickname,
                        textStyle: AppFonts.nickName(context),
                        strokeColor: Colors.black,
                        strokeWidth: 2.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemExtent: 32.0,
                        itemCount: attributes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: StrokeText(
                              text: textAttributes[index],
                              textStyle: AppFonts.attributeName(context),
                              strokeColor: Colors.black,
                              strokeWidth: 2.4,
                            ),
                            trailing: StrokeText(
                              text: attributes[index],
                              textStyle: AppFonts.attributeValue(context),
                              strokeColor: Colors.black,
                              strokeWidth: 2.5,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
