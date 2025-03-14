import 'package:flutter/material.dart';
import 'package:foot_stream/features/home/presentation/home_view.dart';
import 'package:foot_stream/features/settings/presentation/settings_view.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int selectedIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [HomeView(), SettingsView()];
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: ImageIcon(
                size: 29,
                AssetImage('assets/images/home (2).png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: ImageIcon(
                size: 29,
                AssetImage('assets/images/settings.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
