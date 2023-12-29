import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  Future<void> navigate() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, "/LoginPage", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                ],
                stops: [0.1, 0.5, 1],
              ),
            ),
            accountName: const Text(
              "Wibowo",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text("Salsabowo08@gmail.com"),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "assets/images/person.png",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              navigate();
            },
          ),
        ],
      ),
    );
  }
}
