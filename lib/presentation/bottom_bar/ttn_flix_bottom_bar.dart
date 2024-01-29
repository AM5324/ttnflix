import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/logic/favourite/favourite_cubit.dart';
import 'package:ttn_flix/logic/profile/profile_cubit.dart';
import 'package:ttn_flix/presentation/favouraite/favouraite_screen.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_color.dart';

import '../../data/repositories/home_repositories.dart';
import '../../logic/home/home_cubit.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';

@RoutePage()
class TTNFlixBottomBar extends StatefulWidget {
  const TTNFlixBottomBar({super.key});
  @override
  State<TTNFlixBottomBar> createState() => _TTNFlixBottomBarState();
}

class _TTNFlixBottomBarState extends State<TTNFlixBottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    BlocProvider(
        create: (context) => HomeCubit(HomeRepository())..fetchMoviesData(1),
        child: HomeScreen()),
    BlocProvider(
        create: (context) => FavouriteCubit()..fetchFavouritesData(), child: FavouraiteScreen()),
    BlocProvider(
        create: (context) => ProfileCubit()..getUser(), child: AccountScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favourites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp), label: "Account"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.redAccent,
      backgroundColor: TTNFlixColor.primaryColor.lightColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: _bottomBar());
  }
}