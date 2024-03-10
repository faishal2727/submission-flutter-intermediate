import 'package:berbagi_app/presentation/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function() onRegister;
  final Function() onLogin;

  const RegisterPage({
    super.key,
    required this.onRegister,
    required this.onLogin,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama wajib diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          hintText: "Nama",
                        ),
                      ),
                      const SizedBox(height: 16),
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
                      context.watch<AuthProvider>().isLoadingRegister
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                _registerAction();
                              },
                              child: const Text('Register'),
                            ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () => widget.onLogin(),
                        child: const Text("Login"),
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

  Future<void> _registerAction() async {
    if (formKey.currentState!.validate()) {
      final scaffoldMessengger = ScaffoldMessenger.of(context);
      final registerRead = context.read<AuthProvider>();
      final registerData = await registerRead.register(
        nameController.text.toString(),
        emailController.text.toString(),
        passwordController.text.toString(),
      );
      if (registerData) {
        widget.onLogin();
      } else {
        print("AGIB ${registerRead.message}");
        scaffoldMessengger.showSnackBar(
            SnackBar(content: Text("Pesan => ${registerRead.message}")));
      }
    }
  }
}
