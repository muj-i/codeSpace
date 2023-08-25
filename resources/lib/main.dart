import 'package:flutter/material.dart';

///import 'pages.dart'; //using stateful
///import 'package:google_nav_bar/google_nav_bar.dart';
///flutter_launcher_icons: ^0.13.1 //for icon under ""dependencies:""
///flutter_icons: //for icon under ""dev_dependencies:""
//  image_path: "logoo/logo.png"
//run on terminal
///flutter pub get
///flutter pub run flutter_launcher_icons:main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activity(),

      ///////////////////////dual theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            // textStyle: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: .6,
            // ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            // textStyle: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: .6,
            // ),
          ),
        ),
      ),
      themeMode: ThemeMode
          .light, //  you can change theme by changing value .light/.dark
      /////////////////////////////////////////
    );
  }
}

///////////////////////////SnackBar
MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}
//////////////////////////////////////////////////////

/////////////////////////Alert Dialog
MyAletrtDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
          title: Text('Do you want to delete permanently🗑️?'),
          actions: [
            TextButton(
                onPressed: () {
                  MySnackBar("done", context);
                },
                child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No')),
          ],
        ));
      });
}
/*
showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text('You\'ve bought 5 ${products[index].name}!'),
                                actions: [
                                  OutlinedButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                            */





//////////////////////////////////////////////////

class Activity extends StatefulWidget {
  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  TextEditingController _userNameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resouces',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),

///////////////////////////////////////
      /// Using a exter package named google_nav_bar as bottom navigation bar
      ///import 'package:google_nav_bar/google_nav_bar.dart';
      ///google_nav_bar: ^5.0.6 //pubspec.yaml
      /// int _currentIndex = 1; /// using statefull

/*      bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 10, 29, 66).withAlpha(1000),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              child: GNav(
                  backgroundColor:
                      const Color.fromARGB(255, 10, 29, 66).withAlpha(0),
                  color: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                  activeColor: Colors.white,
                  tabBackgroundColor:
                      Color.fromARGB(255, 228, 231, 238).withOpacity(0.1),
                  gap: 8,
                  /////currentIndex: 1,
                  tabs: [
                    GButton(icon: Icons.home, text: "Page 1"),
                    GButton(
                        icon: Icons.business_center_outlined, text: "Page 2"),
                    GButton(icon: Icons.people, text: "Page 3"),
                  ],
                  onTabChange: (int index) {
                    //setState(() {
                    // _currentIndex = index;
                  }))),
*/

////////////////////////////////////

//////////////////////////////////////////
      ///using default bottom nav bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BottomNavigationBar(
              backgroundColor: Colors.purpleAccent,
              iconSize: 24,
              unselectedItemColor: Colors.orange,
              selectedItemColor: Colors.green,
              currentIndex: 1,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Page 1"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sailing), label: "Page 2"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "Page 3"),
              ],
              onTap: (int index) {
                //setState(() {
                // _currentIndex = index;
              }),
        ),
      ),
/////////////////////////////////////////////
      ///
///////////////////////drawer
      drawer: Drawer(
          child: Container(
        color: const Color.fromARGB(255, 10, 29, 66).withAlpha(2000),
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text(
                  'muj',
                  style: TextStyle(fontSize: 44, color: Colors.white70),
                ),
                accountEmail: Text('mio'),
                currentAccountPicture: Image.asset('images/favicon.png'),
              )),
          ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.home),
              ),
              title: Text("Page 1"),
              onTap: () {
                //setState(() {
                //  _currentIndex = 0;
                //  Navigator.pop(context);
              }),
        ]),
      )),

      //////////////////////////////////////

      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment
              .topCenter, // Adjust the alignment as per your requirement
          child: Column(
            children: [
              Image.network(
                'https://pbs.twimg.com/profile_images/1417471791845478403/MzAWCfK7_400x400.jpg',
                height: 60,
              ),
              InkWell(
                  splashColor: Color.fromARGB(255, 13, 238, 5),
                  onTap: () => MySnackBar("MSI Logo", context),
                  child: Image.network(
                      'https://storage-asset.msi.com/frontend/imgs/2021-msi-series_logo-gaming.png')),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Delete',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                onPressed: () {
                  MyAletrtDialog(context);
                },
              ),
/////////////////////////////////////card
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.pink,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('kikukuk',
                        style: TextStyle(fontSize: 44, color: Colors.white70)),
                  ),
                ),
              ),
////////////////////////////////////////////

              //////////////list tile
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 50,
                ),
                title: Text(
                  'Tawhedul Islam',
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  'Gamer',
                  style: TextStyle(fontSize: 16),
                ),
                tileColor: Colors.greenAccent,
              ),
////////////////////////////////////

              ///////////////////////////text field
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "type num here",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(100))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextField(
                    controller: _userNameTextEditingController,

                    ///onChanged: (value) => print(value),
                    onSubmitted: (value) => print(value),
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)))),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _passwordTextEditingController,
                    //obscureText: true,

                    //onSubmitted: (value) => print(value),
                    decoration: InputDecoration(
                        label: Text("Enter password"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(20)))),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_passwordTextEditingController.text);
                    _userNameTextEditingController.text = "kol";
                    _passwordTextEditingController.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Show on console'),
                  )),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                ),
              ),

              TextField(),
              /////////////////////////////////////////
              ///
              ///////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
