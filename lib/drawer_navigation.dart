import 'package:flutter/material.dart';
import 'package:flutter_project_book/pv_quotes_screen.dart';
import 'package:flutter_project_book/pv_theme_screen.dart';
import 'package:flutter_project_book/pv_words_screen.dart';

class DrawerNavigation extends StatefulWidget {

  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Eat That Frog'),
              accountEmail: Text('Version2.0'),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/Eat-That-Frog-Book-Summary_Image69.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                'Quotes',
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PVQuotesScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_list,
              ),
              title: Text(
                'Theme',
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => PVThemeScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_list,
              ),
              title: Text(
                'Words',
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PVWordsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
