import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});
  List<double> zones = [.1, .12, .8];

  List<String> contacts = ['Amir', 'Omar','Mohammed','Diaa','Anoir', 'Stika'];
  List<String> alphabet =
      List.generate(26, (index) => String.fromCharCode(index + 65));

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: screenMainPadding,
                  right: screenMainPadding,
                  left: screenMainPadding),
              child: SizedBox(
                height: (screenSize.height - screenMainPadding) * zones[0],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PlatfromIcon(icon: "search", borderWhite: true),
                    Text(
                      'Contacts',
                      style: titleMedium.copyWith(fontSize: 30),
                    ),
                    const PlatfromIcon(icon: "user-add", borderWhite: true),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0.responsiveHeight(screenSize.height)),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: screenMainPadding +10 , vertical:10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  constraints: BoxConstraints(
                    minHeight:
                        (screenSize.height - screenMainPadding) * zones[2],
                  ),
                  child: contacts.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            
                            final List<String> charContacts = contacts.where((element) =>
                                element.isStartWith(alphabet[index])).toList();
                                
                            if (charContacts.isNotEmpty) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(alphabet[index]),
                                    ],
                                  ),
                                  ...charContacts.map((contact) => ListTile(
                                        leading: Text('leading'),
                                        title: Text(contact),
                                        subtitle: Text('subTitle'),
                                      ))
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          
                          itemCount: alphabet.length,
                        )
                      : Center(
                          child: Text(
                            "No friends",
                            style: titleBold.copyWith(
                                fontSize: 50, color: Colors.black),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
