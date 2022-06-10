
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:quizapp1/constants.dart';
import 'package:quizapp1/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../SharePage.dart';
import '../constants.dart';
import '../screens1/quiz/quiz_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  List<String> images = [
    "img/py.png",
    "img/java.png",
    "img/js.png",
    "img/cpp.png",
    "img/linux.png",
  ];

  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.If You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: InkWell(
        onTap: () => Get.to(QuizScreen()),
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => QuizScreen())
        // );

        child: Container(
          height: 170,
          child: Material(

            color: Colors.brown,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        // changing from 200 to 150 as to look better
                        height: 50.0,
                        width: 50.0,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
            SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 70,
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        des,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontFamily: "Alike"
                        ),
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo.png",
          ),
        ),
        title: const Text("Welcome",style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        centerTitle: true,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.grey,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Share'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body:  ListView(
        children: <Widget>[
          customcard("Python", images[0], des[0]),
          customcard("Java", images[1], des[1]),
          customcard("Javascript", images[2], des[2]),
          customcard("C++", images[3], des[3]),
          customcard("Linux", images[4], des[4]),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.brown,
        buttonBackgroundColor: Colors.white,
        animationCurve:Curves.easeInOut,
        animationDuration:Duration(microseconds: 600),
        height:50.0,
        items: <Widget>[
          Icon(Icons.games, size: 30),
          Icon(Icons.stacked_bar_chart, size: 30),
          Icon(Icons.view_list_sharp, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }


  Future<void> onSelected(BuildContext context, int item) async {
    switch (item) {

      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SharePage()),
        );
        break;
      case 2:
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen())
        );
    }
  }
  // the logout function

}
