import 'package:flutter/material.dart';
import 'package:gasku/Comm/comHelper.dart';
import 'package:gasku/Comm/genTextFormField.dart';
import 'package:gasku/DatabaseHandler/DbHelper.dart';
import 'package:gasku/Model/UserModel.dart';
import 'package:gasku/Screens/LoginForm.dart';
import 'package:gasku/Screens/profile_pic.dart';
import 'package:gasku/Screens/pesanGas.dart';
import 'package:gasku/Screens/kemitraan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Screen",
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1CC0E4),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextButton.icon(
                  onPressed: () {
                      // Respond to button press
                  },
                  icon: const Icon(Icons.list_alt_rounded, size: 18, color: Colors.white),
                  label: const Text("Riwayat", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                        // Respond to button press
                    },
                    icon: const Icon(Icons.home, size: 18, color: Colors.white),
                    label: const Text("Beranda", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFB0E9F6)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => const ChatPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.ease,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        }
                      ),
                    );
                  },
                  icon: const Icon(Icons.message, size: 18, color: Colors.white),
                  label: const Text("Chat", style: TextStyle(color: Colors.white)),
                ),
              ]  
            )
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children:[
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.75,
                  child:TextField(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF9FA5C0)
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      fillColor: const Color(0xFFE5E5E5), 
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 32.0),
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 32.0),
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                    )
                  ),
                ),
                IconButton(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/user/User.jpg', width: 60),
                  ),            
                  iconSize: 50,
                  onPressed: () {
                    
                  },
                ),
                
              ]
            ), 
            Flexible(
              child: ListView(
                children:[
                  Row(
                    children: [ 

                      Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const DetailPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.ease,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                }
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          'assets/user/User.jpg', width: 40),
                                      ),            
                                      iconSize: 35,
                                      onPressed: () {
                                        
                                      },
                                    ),
                                    const Text("Kang Mamat", style: TextStyle(color: Colors.black))
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/mitra-item/item-1.jpg', width: MediaQuery.of(context).size.width*0.4),
                                    ),
                                    Container(
                                      transform: Matrix4.translationValues(100.0, 0.0, 0.0),
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                      child:IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey.withOpacity(0.5)
                                      ) 
                                    ),
                                  ]
                                ),  
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text("Jual gas 3 kg", style: TextStyle(color: Color(0xFF414141), fontSize: 16, fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Rp. 15.000", style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("> 10 mins", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                )
                              ],
                            ),
                          ),       
                        )
                      ),
                       Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const DetailPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.ease,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                }
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          'assets/user/User.jpg', width: 40),
                                      ),            
                                      iconSize: 35,
                                      onPressed: () {
                                        
                                      },
                                    ),
                                    const Text("Kang Mamat", style: TextStyle(color: Colors.black))
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/mitra-item/item-1.jpg', width: MediaQuery.of(context).size.width*0.4),
                                    ),
                                    Container(
                                      transform: Matrix4.translationValues(100.0, 0.0, 0.0),
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                      child:IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey.withOpacity(0.5)
                                      ) 
                                    ),
                                  ]
                                ),  
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text("Jual gas 3 kg", style: TextStyle(color: Color(0xFF414141), fontSize: 16, fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Rp. 15.000", style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("> 10 mins", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                )
                              ],
                            ),
                          ),       
                        )
                      )
                      
                    ],
                  ),
                  Row(
                    children: [ 

                      Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const DetailPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.ease,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                }
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          'assets/user/User.jpg', width: 40),
                                      ),            
                                      iconSize: 35,
                                      onPressed: () {
                                        
                                      },
                                    ),
                                    const Text("Kang Mamat", style: TextStyle(color: Colors.black))
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/mitra-item/item-1.jpg', width: MediaQuery.of(context).size.width*0.4),
                                    ),
                                    Container(
                                      transform: Matrix4.translationValues(100.0, 0.0, 0.0),
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                      child:IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey.withOpacity(0.5)
                                      ) 
                                    ),
                                  ]
                                ),  
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text("Jual gas 3 kg", style: TextStyle(color: Color(0xFF414141), fontSize: 16, fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Rp. 15.000", style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("> 10 mins", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                )
                              ],
                            ),
                          ),       
                        )
                      ),
                       Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const DetailPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.ease,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                }
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          'assets/user/User.jpg', width: 40),
                                      ),            
                                      iconSize: 35,
                                      onPressed: () {
                                        
                                      },
                                    ),
                                    const Text("Kang Mamat", style: TextStyle(color: Colors.black))
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/mitra-item/item-1.jpg', width: MediaQuery.of(context).size.width*0.4),
                                    ),
                                    Container(
                                      transform: Matrix4.translationValues(100.0, 0.0, 0.0),
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                      child:IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey.withOpacity(0.5)
                                      ) 
                                    ),
                                  ]
                                ),  
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text("Jual gas 3 kg", style: TextStyle(color: Color(0xFF414141), fontSize: 16, fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Rp. 15.000", style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("> 10 mins", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                )
                              ],
                            ),
                          ),       
                        )
                      )
                      
                    ],
                  ),
                ]
              )
            )

          ]
        )
      ),
      
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1CC0E4),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextButton.icon(
                  onPressed: () {
                      // Respond to button press
                  },
                  icon: const Icon(Icons.list_alt_rounded, size: 18, color: Colors.white),
                  label: const Text("Riwayat", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.home, size: 18, color: Colors.white),
                    label: const Text("Beranda", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFB0E9F6)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => const ChatPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.ease,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        }
                      ),
                    );
                  },
                  icon: const Icon(Icons.message, size: 18, color: Colors.white),
                  label: const Text("Chat", style: TextStyle(color: Colors.white)),
                ),
              ]  
            )
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children:[
                IconButton(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/user/User.jpg', width: 50),
                  ),            
                  iconSize: 50,
                  onPressed: () {
                    
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.55,
                  child: const Text("Jual gas 3 kg", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const ChatPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.ease,
                            );

                            return SlideTransition(
                              position: tween.animate(curvedAnimation),
                              child: child,
                            );
                          }
                        ),
                      );
                    },
                    icon: const Icon(Icons.message, size: 18, color: Colors.white),
                    label: const Text("Chat", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1CC0E4)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ]
            ), 
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/mitra-item/item-1.jpg', width: MediaQuery.of(context).size.width*0.8),
                ),
                Container(
                  transform: Matrix4.translationValues(250.0, 10.0, 0.0),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child:IconButton(
                    icon: const Icon(Icons.favorite),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.5)
                  ) 
                ),
              ]
            ),  
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("Jual gas 3 kg", style: TextStyle(color: Color(0xFF414141), fontSize: 20, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text("Stok :", style: TextStyle(color: Color(0xFF414141), fontSize: 16),
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text("10", style: TextStyle(color: Color(0xFF414141), fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )
              ]
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Rp. 15.000", style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("> 10 mins", style: TextStyle(color: Colors.grey, fontSize: 14)),
            ),
            Flexible(
              child: ListView(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Deskripsi Penjual", style: TextStyle(color: Color(0xFF212121), fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(color: Color(0xFF212121), fontSize: 13)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(color: Color(0xFF212121), fontSize: 13)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(color: Color(0xFF212121), fontSize: 13)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(color: Color(0xFF212121), fontSize: 13)),
                    ),
                  ),
                ],
              )
              
            )

          ]
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Pesan Sekarang ?'),
            actions: [
              Row(
                children:[
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    margin: const EdgeInsets.only(left: 20.0, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                          // Respond to button press
                      },
                      child: const Text('Jemput'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1CC0E4)),
                      ),
                    ),        
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    margin: const EdgeInsets.only(left: 10.0, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                          // Respond to button press
                      },
                      child: const Text('Antar'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1CC0E4)),
                      ),
                    ),        
                  )

                ]
              )
            ],
          )
        ),
        label: const Text('Pesan'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: const Color(0xFF1CC0E4),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  bool _showBackToTopButton = false;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 150) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
  }

    @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1CC0E4),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset(
                      'assets/user/User.jpg', width: 45),
                  ),        
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0, left: 5),
                  width: MediaQuery.of(context).size.width*0.55,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Kang Mamat", style: TextStyle(color: Color(0xFF212121), fontSize: 15)),
                  ),
                ),
              ]  
            )
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:[
            Flexible(
              child: ListView(
              controller: _scrollController,
              children: [
                Column(
                  children:[
                    ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: Colors.lightBlue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: GestureDetector(
                          onLongPress: () {
                            
                          },
                          child: const Text(
                            "Hallo kang, bisa saya pesan gas sekalian di antar kerumah?",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                        child: const Text("Today at 09.10",
                          style: TextStyle(color: Colors.grey, fontSize:14))
                      )
                    )
                  ]
                ),
                Column(
                  children:[
                    ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: Colors.lightBlue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: GestureDetector(
                          onLongPress: () {
                            
                          },
                          child: const Text(
                            "Bisa mas langsung pesan aja",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                        child: const Text("Today at 09.10",
                          style: TextStyle(color: Colors.grey, fontSize:14))
                      )
                    )
                  ]
                ),
                Column(
                  children:[
                    ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: Colors.lightBlue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: GestureDetector(
                          onLongPress: () {
                            
                          },
                          child: const Text(
                            "Oke siap kang",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:2),
                        child: const Text("Today at 09.10",
                          style: TextStyle(color: Colors.grey, fontSize:14))
                      )
                    )
                  ]
                ),
          
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              height: 60,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.camera_enhance, color: Colors.black, size: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.text_format, color: Colors.black, size: 20),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    heroTag: "send",
                    onPressed: () async{
                      
                    },
                    child: const Icon(Icons.arrow_upward, color: Colors.white,size: 18,),
                    backgroundColor: Colors.blueAccent,
                    elevation: 0,
                  ),
                  
                ],
                
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white, 
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
            ),
              
            ),
          ]
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: _showBackToTopButton == false
          ? null
          : Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton.extended(
          heroTag: "backtotop",
          onPressed: _scrollToTop,
          label: const Text('Back To Top', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.arrow_circle_up),
          backgroundColor: const Color(0xFF555555).withOpacity(0.5),
          elevation: 0,
        ),
      )
    );
  }
}