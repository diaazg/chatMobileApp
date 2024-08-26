import 'package:chat/core/presentation/state/bloc/contact/contact_cubit.dart';
import 'package:chat/core/presentation/state/bloc/contact/contact_state.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ContactCubit(),
          child: BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
            final cubit = context.read<ContactCubit>();
            return Column(
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
                          horizontal: screenMainPadding + 10, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50))),
                      constraints: BoxConstraints(
                        minHeight:
                            (screenSize.height - screenMainPadding) * zones[2],
                      ),
                      child: cubit.contacts.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final List<String> charContacts = cubit.contacts
                                    .where((element) => element
                                        .isStartWith(cubit.alphabet[index]))
                                    .toList();

                                if (charContacts.isNotEmpty) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(cubit.alphabet[index],
                                              style: titleBold.copyWith(
                                                  fontSize: ktextSize1 + 5,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                      ...charContacts.map((contact) => ListTile(
                                            leading: PersonnalCirculairePic(
                                                screenSize: screenSize * 1.3),
                                            title: Text(
                                              contact,
                                              style: titleMedium.copyWith(
                                                  fontSize: ktextSize1,
                                                  color: Colors.black),
                                            ),
                                            subtitle: const Text('0792007375'),
                                          ))
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                              itemCount: cubit.alphabet.length,
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
            );
          }),
        ),
      ),
    ));
  }
}