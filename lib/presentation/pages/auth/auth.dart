import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../presentation/presentation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              const FlutterLogo(size: 150.0),
              TextFormField(controller: auth.ctrUser),
              TextFormField(controller: auth.ctrPassword),
              const SizedBox(height: 20),
              ButtonOutlineStream(
                text: Tk.send.tr,
                icon: const Icon(Icons.login),
                stream: auth.loading.stream,
                // onPressed: () => auth.loginWithUserAndPassword(),
              ),
              const SizedBox(height: 30),
              ButtonTextStream(
                text: Tk.send.tr,
                icon: const Icon(Icons.person),
                onPressed: () async {},
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
