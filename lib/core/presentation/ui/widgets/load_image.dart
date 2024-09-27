import 'package:chat/utils/api/end_points.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center, // Center the circular progress indicator
        children: [
          // Image widget with loading builder
          Image.network(
            'http://$pcAdr:8000$image',
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                // If the image is fully loaded, display the image
                return child;
              } else {
                // While the image is loading, show a CircularProgressIndicator
                return Center(
                  child: CircularProgressIndicator(
                    color: greenColors['mainGreen'],
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null, // Progress indicator value based on image loading progress
                  ),
                );
              }
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              // Handle error (e.g., image loading failure)
              return const Icon(Icons.error, color: Colors.red);
            },
          ),
        ],
      ),
    );
  }
}
