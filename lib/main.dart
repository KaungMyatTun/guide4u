import 'package:flutter/material.dart';
import 'package:guide4u/data/localization.dart';
import 'app_screens/UserMain.dart';
import 'app_screens/Favourite.dart';
import 'app_screens/SearchScreen.dart';
import 'app_screens/OwnerMain.dart';
import 'package:guide4u/data/HexColor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// initiate home page
int initiatePageIndex = 0;

void main() => runApp(MyApp(initiatePageIndex));

class MyApp extends StatelessWidget {
  final int index;
  MyApp(this.index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: HexColor('#C67A00'),
          accentColor: HexColor('#ff8300')),
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
      ],
      title: 'Guide4U',
      home: PageSetup(_getInitiatePageIndex(index)),
    );
  }
}

_getInitiatePageIndex(int index) {
  int _initiateIndex = index;
  return _initiateIndex;
}

class PageSetup extends StatefulWidget {
  final _selectedPage;
  PageSetup(this._selectedPage);

  @override
  _State createState() {
    return _State(_selectedPage);
  }
}

class _State extends State<PageSetup> {
  int _selectedPage;
  _State(this._selectedPage);

  final _pageOptions = [
    UserMainPage(),
    Favourite(),
    SearchScreen(),
    OwnerMainPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        centerTitle: false,
        title: Text('Guide4U'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedPage,
        onItemSelected: (index) => setState(() {
          _selectedPage = index;
        }),
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}

class BottomNavyBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  BottomNavyBar({this.selectedIndex, @required this.onItemSelected}) {
    assert(onItemSelected != null);
  }

  @override
  //_BottomNavyBarState createState() => _BottomNavyBarState();
  _BottomNavyBarState createState() {
    return _BottomNavyBarState(selectedIndex, onItemSelected);
  }
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  // selected index
  int selectedIndex;
  ValueChanged<int> onItemSelected;

  _BottomNavyBarState(this.selectedIndex, this.onItemSelected);

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      padding: isSelected ? EdgeInsets.only(left: 16, right: 10) : null,
      height: double.maxFinite,
      width: isSelected ? 120 : 50,
      decoration: isSelected
          ? BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(30)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                    size: 24,
                    color:
                        isSelected ? Colors.black : HexColor('#D3D3D3')),
                child: item.icon,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: Colors.black),
                        child: item.title)
                    : Container(),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<NavigationItem> items = [
      NavigationItem(Icon(Icons.home), Text(AppLocalizations.of(context).home)),
      NavigationItem(Icon(Icons.favorite_border), Text('Favourite')),
      NavigationItem(Icon(Icons.search), Text('Search')),
      NavigationItem(Icon(Icons.person_outline), Text('Owner'))
    ];

    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
                onItemSelected(selectedIndex);
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
