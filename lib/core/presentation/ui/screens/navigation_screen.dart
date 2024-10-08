import 'package:chat/core/presentation/ui/screens/contact_screen.dart';
import 'package:chat/core/presentation/ui/screens/invitations_screen.dart';
import 'package:chat/core/presentation/ui/screens/messages_screen.dart';
import 'package:chat/core/presentation/ui/screens/setting_screen.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/constants.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MessagesScreen(),
     InvitationsScreen(),
    const ContactsScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 12,
        iconSize: 30,
        selectedLabelStyle:
            titleMedium.copyWith(color: greenColors['mainGreen'], fontSize: 15),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: navigationIconsPadding),
              child: ImageIcon(AssetImage('$imagesPath/icons/Message.png')),
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: navigationIconsPadding),
              child: Icon(Icons.person_add_alt_outlined),
            ),
            label: 'Invit',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: navigationIconsPadding),
              child: ImageIcon(AssetImage('$imagesPath/icons/user.png')),
            ),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: navigationIconsPadding),
              child: ImageIcon(AssetImage('$imagesPath/icons/settings.png')),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: greenColors['mainGreen'],
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
