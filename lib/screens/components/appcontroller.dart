import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/home/home.dart';
import 'package:patientapp/screens/medical/medicalrecords.dart';
import 'package:patientapp/screens/profile/profilepage.dart';
import 'package:patientapp/screens/search/searchpage.dart';

class AppScreenController extends StatefulWidget {
  //Named route Path
  static const routeName = appcontroller;
  
  final int? indexScreen;
  const AppScreenController({Key? key,this.indexScreen}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AppScreenController> {
  
  //Scroll Controller variable
  late ScrollController bottombarController;

  @override
  void initState() {
  super.initState();
  bottombarController = ScrollController();
  onNavigateIndex();
  }  

  @override
  void dispose() {
    bottombarController.dispose();
    super.dispose();
  }

//This is invoked when user taps on bottom icons in bar 
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

void onNavigateIndex(){
   if (widget.indexScreen != null){
     setState(() {
     _currentIndex = widget.indexScreen ?? 0;
   });
   }
}

  //initializing the current index = 0 : HomePage
  int _currentIndex = 0;

  //Current Index with Widget paths
  final List<Widget> _children = const [
      HomePage(),
      SearchPage(),
      MedicalRecordsPage(),
      ProfilePage(),
  ];

  //Current Index with Widget paths
  final List<Widget> _appBarWidgets = [
    Container(height: 0, width:0,color:Colors.transparent),
    Container(height: 0, width:0,color:Colors.transparent),
    Container(height: 0, width:0,color:Colors.transparent),
    Container(height: 0, width:0,color:Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    //Icons size 
    double sizeIcon = smallMobile(context) ? 9 : largeMobile(context) ? 10 : isBetweenMT2(context) ? 10 : isBetweenMT1(context) ? 11 : 13;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            selectedFontSize: sizeIcon,
            unselectedFontSize: sizeIcon,
            unselectedItemColor: kLightGrayColor,
            selectedItemColor: kOrangeColor, // kPrimaryColor,
            selectedLabelStyle: const TextStyle(color: kPrimaryColor,fontFamily: kMuktaBold),
            unselectedLabelStyle: const TextStyle(color: kPrimaryColor,fontFamily: kMuktaBold),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
         items: const [
           BottomNavigationBarItem(
             icon: Icon(Icons.home_filled),
             tooltip: "Home",
             label: "Home"
           ),
           BottomNavigationBarItem(
             icon: Icon(CupertinoIcons.search),
             tooltip: "Search",
             label: "Search",
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.description_outlined),
            tooltip: "Medical Records",
            label: "Records"
           ),
           BottomNavigationBarItem(
             icon: Icon(CupertinoIcons.person_alt),
             tooltip: "Profile",
             label: "Profile",
           )
         ],
          ),
       appBar:  PreferredSize(
         child: _appBarWidgets[_currentIndex],
         preferredSize: Size.fromHeight(isMobile(context) ? 65 : largeTablet(context) ? 70 :  75)),
        body: _children[_currentIndex]

      ),
    );
  }
}