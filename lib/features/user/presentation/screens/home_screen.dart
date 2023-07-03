import 'package:doctor_fy/features/chat/presentation/blocs/rooms/rooms_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/screens/consultas_screen.dart';
import 'package:doctor_fy/features/user/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RoomCubit()..initializeRooms(context),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              icon: const Icon(Icons.chat_bubble_outlined),
              selectedIcon: Icon(
                Icons.chat_bubble_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Consultas',
            ),
            NavigationDestination(
              icon: const Icon(Icons.newspaper),
              selectedIcon: Icon(
                Icons.newspaper,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Noticias',
            ),
            NavigationDestination(
              icon: const Icon(Icons.health_and_safety_outlined),
              selectedIcon: Icon(
                Icons.health_and_safety_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Bienestar',
            ),
            NavigationDestination(
              icon: const Icon(Icons.person),
              selectedIcon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Perfil',
            ),
          ],
        ),
        body: <Widget>[
          ConsultasScreen(),
          NoticiasScreen(),
          BienestarScreen(),
          ProfileScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
