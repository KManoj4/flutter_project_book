import 'package:flutter/material.dart';
import 'package:flutter_project_book/appdata_quotes_list.dart';
import 'package:flutter_project_book/appdata_theme_list.dart';
import 'package:flutter_project_book/display_text.dart';
import 'package:flutter_project_book/display_theme.dart';
import 'drawer_navigation.dart';

class PVQuotesScreen extends StatefulWidget {
  const PVQuotesScreen({Key? key}) : super(key: key);

  @override
  State<PVQuotesScreen> createState() => _PVQuotesScreenState();
}

class _PVQuotesScreenState extends State<PVQuotesScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: Text(
          'Eat That Frog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text("Share")),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                _shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            height: 250.0,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: PageController(
                  viewportFraction: 0.7,
                ),
                // total length
                itemCount: QuotesBookList.length,
                itemBuilder: (context, index) {
                  var quotes = QuotesBookList[index];
                  var _scale = _selectedIndex == index ? 1.0 : 0.8;

                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: DisplayText(
                        appData: quotes,
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: new Text(
                  (_selectedIndex + 1).toString() +
                      '/' +
                      QuotesBookList.length.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _shareInfo() {
    print('------------> Share');

    print(QuotesBookList[_selectedIndex].Text);
    //Share.share(quotesList[_selectedIndex].quotes);
  }
}
