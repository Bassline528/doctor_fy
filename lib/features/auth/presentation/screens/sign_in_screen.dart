import 'package:doctor_fy/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_fy/features/auth/presentation/widgets/doctor_fy_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/sign_in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      context.read<AuthBloc>().add(
            SignInWithEmailAndPassword(
              email: email,
              password: password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                //TODO: SHOW SNACKBAR MESSAGE
                context.pushReplacement('/chat');
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  const DoctorFy(),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        const InputDecoration(labelText: 'Correo electrónico'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/forgot'),
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: state is SignInInProgress ? null : _signIn,
                    child: const Text('Iniciar sesion'),
                  ),
                  MaterialButton(
                    onPressed: () => context.push(SignUpScreen.routeName),
                    child: const Text('Crear una cuenta nueva'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
