import 'package:flutter/material.dart';

class BottomMenuNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF0084c7),
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {},
          ),
        ],
      ),
    );
    /*return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.calculate), title: Text("PVI")),
      BottomNavigationBarItem(
          icon: Icon(Icons.history), title: Text("Histórico")),
    ]);*/
  }
}
