import 'package:flutter/material.dart';
import 'package:mview/pages/home_page.dart';
import 'package:mview/pages/settings_page.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TimerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageViewModel(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/moon.jpg"),
              alignment: Alignment.topCenter),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: pageViewModel.pageIndex,
              onTap: (index) => pageViewModel.bottomNavTap(index),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: "HOME"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "설정"),
              ]),
          body: PageView(
              controller: pageViewModel.pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: ((newIndex) =>
                  pageViewModel.pageViewChange(newIndex)),
              children: const [
                HomePage(),
                SettingsPage(),
              ]),
        ),
      ),
    );
  }
}
