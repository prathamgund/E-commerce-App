import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/cart.dart';
import 'package:flutter_first_app/widgets/drawer.dart';
import 'package:flutter_first_app/widgets/themes.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'package:velocity_x/velocity_x.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.LightMode(context),
      darkTheme: AppTheme.DarkMode(context),
      home: Scaffold(
        appBar: AppBar(
          title: index == 0
              ? "Catalog App".text.bold.xl2.make()
              : "Cart".text.bold.xl2.make(),
          // use with Builder >
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: (() => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Settings(),
                        ),
                      ),
                    }),
                icon: const Icon(Icons.settings),
              ),
            )
          ],
        ),
        body: index == 0 ? const Home() : const Cart(),
        drawer: const AppDrawer(), // creates a hamburger menu
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.red,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              backgroundColor: Colors.blue,
              icon: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 12.0,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ],
          currentIndex: index,
          onTap: (int position) {
            setState(() {
              index = position;
            });
          },
        ),
      ),
    );
  }
}
