import 'package:doctor_fy/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/auth/presentation/widgets/date_picker_field.dart';
import 'package:doctor_fy/features/auth/presentation/widgets/doctor_fy_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _namesControlles;
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
    _namesControlles = TextEditingController();
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
    _namesControlles.dispose();
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
      final email = _emailController.text;
      final password = _passwordController.text;
      final username = _usernameController.text;
      context.read<AuthBloc>().add(
            SignUpWithEmailAndPassword(
              email: email,
              password: password,
              username: username,
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
                //TODO: SHOW SNACKBAR MESSAGE
                context.go(SignInScreen.routeName);
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  const DoctorFy(),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    controller: _namesControlles,
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
                                onTap: () => _showTerms(context),
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
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('I already have an account'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void _showTerms(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => Wrap(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Términos y condiciones',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // large lorem ipsum
                  const Text(
                    '''
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a diam laoreet, imperdiet tortor quis, elementum velit. Quisque suscipit quam quis turpis posuere, vel finibus nulla fringilla. In hac habitasse platea dictumst. Nam in maximus nisl. Nunc viverra urna eu orci consequat, eu aliquam massa scelerisque. Sed venenatis lacinia lobortis. Pellentesque iaculis, eros at pretium sollicitudin, urna arcu ultricies ex, eget laoreet sapien ante et nisi. Maecenas gravida ipsum ut tortor volutpat, in auctor libero tempor. Praesent sagittis, velit sed efficitur finibus, dui neque varius nibh, non fermentum urna odio nec elit.
            
            Sed ac lectus eu turpis blandit rutrum. Suspendisse volutpat sem in suscipit facilisis. Curabitur eget dolor nisl. Donec congue eleifend odio vel venenatis. Nullam et finibus massa. Donec quis tristique lectus, a volutpat leo. Aenean efficitur dolor vel sagittis scelerisque. Quisque ultricies, augue sed dapibus fringilla, nisi felis feugiat lorem, eu dictum purus urna in augue. Morbi tempus ultricies pulvinar. Praesent nibh ex, malesuada vestibulum nulla eu, viverra cursus dui. Sed non sollicitudin dui. In non blandit orci.
            
            Nulla eget metus a metus varius pellentesque. Morbi malesuada placerat elit, non vehicula ligula pharetra quis. Sed et ex ultrices, fringilla nulla ac, dapibus nibh. Integer porta tellus ante, quis tristique purus blandit vitae. Nam rutrum cursus velit, pellentesque pulvinar sem ullamcorper non. Fusce blandit nunc sit amet mauris consectetur, ac volutpat ligula rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam tempus sit amet nibh vel porttitor. Aenean vitae risus ut neque iaculis interdum. Cras nibh metus, ullamcorper hendrerit dolor vitae, commodo sagittis nisl. Suspendisse ac congue elit. Duis vitae nisi ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas malesuada felis nec lorem consequat, condimentum tempor neque egestas. Maecenas venenatis volutpat tellus id auctor.
            
            Donec lacus nisi, imperdiet eget diam ornare, imperdiet vulputate lectus. Aliquam auctor risus ac velit consectetur interdum. Integer laoreet metus nisl, a fermentum nisi ultrices quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sem justo, feugiat in blandit non, consectetur nec mauris. Cras molestie nunc ac maximus cursus. Vestibulum feugiat magna eget finibus congue. Mauris ut ligula nec ante eleifend finibus. Fusce auctor vestibulum neque at tempor.
            
            Aenean varius sem id eleifend porta. Phasellus aliquet nisi ac nulla ornare, nec porta nunc eleifend. Sed efficitur orci quis auctor vehicula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean volutpat justo tortor, a blandit dolor placerat eu. Morbi ullamcorper varius purus at bibendum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus a congue mi, vitae vulputate turpis. Morbi volutpat, enim quis luctus interdum, magna nunc mattis urna, porta ornare lacus dolor quis dui.
            
            Pellentesque sit amet venenatis velit, non porttitor leo. Morbi convallis purus egestas velit sollicitudin, et scelerisque justo semper. Nullam euismod porttitor tortor et blandit. Morbi ultrices in urna consectetur faucibus. Nunc vel ligula efficitur, dignissim mi sit amet, mollis mi. Pellentesque pellentesque rhoncus egestas. Quisque dignissim risus vel diam rutrum tincidunt. Nunc dapibus nisl in velit elementum interdum. In hac habitasse platea dictumst. Etiam rhoncus non erat id scelerisque. Sed a elit libero. Nulla in lacinia sem, sed tempus lorem. Sed auctor magna sit amet odio sagittis ultricies. Sed molestie porta nisl vel vulputate. Nam gravida vulputate velit in tincidunt. Mauris sagittis sed nibh eget venenatis.
            
            Nunc placerat sem vitae nulla molestie sagittis. Suspendisse potenti. Sed vitae ligula dui. Nam malesuada velit sit amet sodales auctor. Vivamus varius quis tellus at dignissim. Nunc odio sapien, ornare non nunc porta, laoreet posuere tortor. Nullam sit amet dui sed dui ultricies sollicitudin et a augue.
            
            Vestibulum est mi, finibus aliquam fermentum id, vulputate vel eros. Praesent malesuada enim erat, eget suscipit nisl condimentum in. Curabitur ante mi, sodales vitae nunc convallis, ultrices pharetra nulla. Sed condimentum ex fermentum arcu consectetur, a vulputate odio interdum. Aenean efficitur et orci et volutpat. Phasellus ac purus finibus, gravida tellus non, dictum nisl. Nunc eget finibus urna, at finibus leo. Sed fringilla vehicula sapien id dapibus. Integer sed iaculis nunc.
            
            Donec vitae lectus nulla. Nullam pellentesque lacus mi, vitae congue ex malesuada non. Suspendisse sed risus turpis. Proin vel nunc hendrerit, facilisis risus sed, congue risus. Duis non ex sodales, tincidunt tortor sed, sollicitudin lacus. Morbi maximus neque nec odio pretium, et tempus ante semper. Sed tempus lacus eget velit dignissim, in porttitor mauris tincidunt.
            
            Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras non feugiat quam, et molestie lacus. Sed quis nisl tincidunt, tristique enim a, rhoncus ligula. Proin dapibus sed lectus et placerat. Nulla sed diam velit. Proin at eros facilisis, suscipit nunc eget, finibus nibh. Integer molestie lectus nec orci porttitor elementum.
                    ''',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
