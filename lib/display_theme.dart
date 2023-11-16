import 'package:flutter/material.dart';
import 'package:flutter_project_book/appdata_theme_list.dart';



class DisplayTheme extends StatelessWidget {
  final ThemeBook appData;

  const DisplayTheme({Key? key, required this.appData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          letterSpacing: 2.5,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  appData.Text,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
