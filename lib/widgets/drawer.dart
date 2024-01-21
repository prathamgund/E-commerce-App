import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  final profileLogo = "assets/images/profile.jpg";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Vx.blue500),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Prathamesh Gund",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: const Text("prathameshsgund2001@gmail.com"),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: AssetImage(profileLogo)),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.4,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.4,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.wallet, color: Colors.white),
              title: Text(
                "Your wallet",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.4,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.white),
              title: Text(
                "Your Cart",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
