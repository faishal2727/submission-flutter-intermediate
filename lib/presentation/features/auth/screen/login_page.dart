import 'package:berbagi_app/presentation/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function() onLogin;
  final Function() onRegister;

  const LoginPage({
    super.key,
    required this.onLogin,
    required this.onRegister,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email wajib diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          hintText: "Email",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'masukan password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          hintText: 'password',
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      context.watch<AuthProvider>().isLoadingLogin
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: _loginAction,
                              child: const Text('Login'),
                            ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () => widget.onRegister(),
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loginAction() async {
    if (formKey.currentState!.validate()) {
      final scaffoldMessengger = ScaffoldMessenger.of(context);
      final loginRead = context.read<AuthProvider>();
      final loginData = await loginRead.login(
        emailController.text.toString(),
        passwordController.text.toString(),
      );
      if (loginData) {
        widget.onLogin();
        scaffoldMessengger
            .showSnackBar(const SnackBar(content: Text("Login Berhasil")));
      } else {
        scaffoldMessengger.showSnackBar(SnackBar(
            content: Text("Pesan => ${loginRead.message.toString()}")));
      }
    }
  }
}
