import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen'
              ),
              IconButton(
                  onPressed: (){
                    AuthenticationRepository.instance.logOut();
                  },
                  icon: Icon(Icons.logout_outlined)
              )
            ],
          ),
        ),
      ),
    );
  }
}
