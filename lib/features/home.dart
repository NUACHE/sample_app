import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_app/core/colors.dart';
import 'package:sample_app/core/font_sizes.dart';
import 'package:sample_app/features/account/account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userCustomColors = CustomColors();
  final userCustomFont = CustomFontSizes();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userCustomColors.backGroundColor,
      appBar: AppBar(
        title: Text(selectedIndex == 0
            ? 'Home'
            : selectedIndex == 1
                ? 'Requests'
                : 'Account'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: userCustomFont.heading5,
      ),
      body: Center(
        child: <Widget>[Text('Home'), Text('Requests'), const AccountPage()]
            .elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svgs/home.svg',
                color: selectedIndex == 0
                    ? userCustomColors.tuulBox
                    : userCustomColors.textNeutral),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/monitor.svg',
                  color: selectedIndex == 1
                      ? userCustomColors.tuulBox
                      : userCustomColors.textNeutral),
              label: 'Requests'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/user.svg',
                  color: selectedIndex == 2
                      ? userCustomColors.tuulBox
                      : userCustomColors.textNeutral),
              label: 'Account')
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedIconTheme: IconThemeData(color: Colors.red),
        unselectedItemColor: userCustomColors.textNeutral,
        currentIndex: selectedIndex,
        selectedItemColor: userCustomColors.tuulBox,
      ),
    );
  }
}
