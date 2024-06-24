import 'package:diplom/create/pages/create_page.dart';
import 'package:diplom/home/pages/home_page.dart';
import 'package:diplom/main/cubit/main_cubit.dart';
import 'package:diplom/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _cubit = MainCubit();
  List<Widget> pages = [
    const HomePage(),
    const CreatePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          body: pages[_cubit.state],
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: _cubit.change,
            selectedIndex: _cubit.state,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Башкы бет',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.edit),
                icon: Icon(Icons.edit_outlined),
                label: 'Кошуу',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_2_outlined),
                label: 'Профиль',
              ),
            ],
          ),
        );
      },
    );
  }
}
