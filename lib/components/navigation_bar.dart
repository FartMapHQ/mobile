import '../pages/recorder.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int currentPageIndex = 1; // defaults on the recorder view.

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.language),
            icon: Icon(Icons.language_outlined),
            label: 'Communauté',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.mic),
            icon: Icon(Icons.mic_outlined),
            label: 'Enregistrer',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Moi',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'LA FARTMAP !',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        RecorderPage(),
        // Card(
        //   shadowColor: Colors.transparent,
        //   margin: const EdgeInsets.all(8.0),
        //   child: SizedBox.expand(
        //     child: Center(
        //       child: Text(
        //         'Enregistrer un pet',
        //         style: theme.textTheme.titleLarge,
        //       ),
        //     ),
        //   ),
        // ),

        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Moi...',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
