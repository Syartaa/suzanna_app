import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/screens/home/home_screen.dart';
import 'package:suzanne_app/utilis/helpers/helper_functions.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get the seleted index from the provider
    final selectedIndex = ref.watch(selectedIndexProvider);
    final darkMode = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          //update the selected index using provider
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        backgroundColor: darkMode ? Colors.black : Colors.white,
        indicatorColor: darkMode
            ? const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1)
            : const Color.fromARGB(255, 228, 91, 148).withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.mic), label: 'Podcast'),
          NavigationDestination(
              icon: Icon(Icons.event_available), label: 'Events'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
      body: _getScreenForIndex(selectedIndex),
    );
  }

  Widget _getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return Container(
          color: Colors.amber,
        );
      case 2:
        return Container(
          color: Colors.red,
        );
      case 3:
        return Container(
          color: Colors.blue,
        );
      default:
        return HomeScreen();
    }
  }
}
