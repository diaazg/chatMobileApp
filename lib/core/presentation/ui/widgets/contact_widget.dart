import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.screenSize, required this.contact,
  });

  final Size screenSize;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: PersonnalCirculairePic(
              screenSize: screenSize * 1.3),
          title: Text(
            contact,
            style: titleMedium.copyWith(
                fontSize: ktextSize1,
                color: Colors.black),
          ),
          subtitle: const Text('0792007375'),
        );
  }
}