import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Nova tela"),
            ElevatedButton(
                onPressed: () {
                  secureStorage.deleteOne(key: "CURRENT_USER").then(
                        (_) => Navigator.popAndPushNamed(
                          context,
                          NamedRoutes.initial,
                        ),
                      );
                },
                child: Text("Log out"))
          ],
        ),
      ),
    );
  }
}
