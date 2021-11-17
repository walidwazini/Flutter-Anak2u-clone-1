import 'package:flutter/material.dart';

import './ChatScreen.dart';
import './EditProfileScreen.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
      Container(),
      Container(),
      ChatScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Anak2u'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.list),
              itemBuilder: (BuildContext context) => [
          PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Utama'),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
              ),
            ),
            const PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text('Mesej Semua Guru'),
              ),
            ),
          ])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Color(0xffeab514),
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (selection) => setState((){
          selectedIndex = selection;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Pengunguman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Pelajar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Bayaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Tip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Perbualan',
          )
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
