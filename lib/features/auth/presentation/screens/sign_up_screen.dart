import 'package:doctor_fy/core/helpers/terms_helper.dart';
import 'package:doctor_fy/features/auth/data/models/sign_up_request.dart';
import 'package:doctor_fy/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/auth/presentation/widgets/date_picker_field.dart';
import 'package:doctor_fy/features/auth/presentation/widgets/doctor_fy_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _fullNameController;
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _dniController;
  late TextEditingController _birthDateController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  late TextEditingController _phoneNumberController;
  late bool _hasAgreedToTerms;

  final List<String> _sexs = <String>['Masculino', 'Femenino'];

  late String? _selectedSex;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _dniController = TextEditingController();
    _birthDateController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _selectedSex = null;
    _hasAgreedToTerms = false;
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    _dniController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignUpWithEmailAndPassword(
              signUpRequest: SignUpRequest(
                email: _emailController.text,
                password: _passwordController.text,
                fullName: _fullNameController.text,
                username: _userNameController.text,
                ci: _dniController.text,
                birthDate: _birthDateController.text,
                phoneNumber: _phoneNumberController.text,
                gender: _selectedSex!.substring(0, 1).toUpperCase(),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registro exitoso'),
                  ),
                );
                context.go(SignInScreen.routeName);
                return;
              }

              if (state is SignUpError) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
                return;
              }

              if (state is SignUpInProgress) {
                context.loaderOverlay.show();
                return;
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  const DoctorFy(),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      label: Text('Nombre y Apellido'),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      label: Text('Nombre de usuario'),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DatePickerField(
                    controller: _birthDateController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _dniController,
                    decoration: const InputDecoration(
                      label: Text('Cédula de identidad'),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedSex,
                    validator: (value) {
                      if (value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                    items: _sexs.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _selectedSex = value;
                      });
                    },
                    decoration: const InputDecoration(
                      label: Text('Sexo'),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Required';
                      }
                      if (val.length < 6) {
                        return '6 characters minimum';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  IntlPhoneField(
                    controller: _phoneNumberController,
                    validator: (p0) {
                      if (p0 == null) {
                        return 'Required';
                      }

                      return null;
                    },
                    pickerDialogStyle: PickerDialogStyle(
                      searchFieldInputDecoration:
                          const InputDecoration(hintText: 'Buscar'),
                    ),
                    disableLengthCheck: true,
                    invalidNumberMessage: 'Número inválido',
                    decoration: const InputDecoration(
                      labelText: 'Celular',
                    ),
                    initialCountryCode: 'PY',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _hasAgreedToTerms,
                          onChanged: (newValue) =>
                              setState(() => _hasAgreedToTerms = newValue!),
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              const Text('He leído y acepto los '),
                              GestureDetector(
                                onTap: () => showTerms(context),
                                child: Text(
                                  'términos y condiciones',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              const Text(' de uso'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FilledButton(
                    onPressed: state is SignUpInProgress ? null : _signUp,
                    child: const Text('Register'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿Ya tienes una cuenta?'),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Inicia sesión'),
                      ),
                    ],
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
