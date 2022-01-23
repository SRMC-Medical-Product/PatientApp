import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';

class DoctorsDisplayPage extends StatefulWidget {
  static const routeName = doctordisplay;
  const DoctorsDisplayPage({Key? key}) : super(key: key);

  @override
  _DoctorsDisplayPageState createState() => _DoctorsDisplayPageState();
}

class _DoctorsDisplayPageState extends State<DoctorsDisplayPage> {
  final List<dynamic> _sortFilters = [
    {"name": "Specialisation", "icon": Icons.sort},
    {"name": "Gender", "icon": Icons.arrow_drop_down},
    {"name": "Exp", "icon": Icons.arrow_drop_down}
  ];

  final List<dynamic> _specialisation = ['Cardiology', 'General Surgeon'];
  final List<dynamic> _gender = ["Male", "Female","Other"];
  final List<dynamic> _experinceList = ['Low to High', 'High to Low'];

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mediumCustomSizedBox(context),
                    StaticSearch(
                      radius: 5.0,
                      searchHint: "Search doctors and specialisation",
                      onTap: () => Navigator.push(
                          context,
                          CustomSimplePageRoute(
                              page: DynamicSearchPage(),
                              routeName: dynamicsearch)),
                    ),
                  ],
                ),
              ),
              smallCustomSizedBox(context),
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                  ),
                  height: isMobile(context) ? 45 : 55,
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      bottomDisplaybox(
                          name: "Specialisation",
                          icon: Icons.sort,
                          listItem: _specialisation,
                          hgt: size.height/2, 
                          ),
                     bottomDisplaybox(
                          name: "Gender",
                          icon: Icons.arrow_drop_down,
                          listItem: _gender,
                          hgt: 250
                          ),
                    bottomDisplaybox(
                          name: "Exp",
                          icon: Icons.arrow_drop_down,
                          listItem: _experinceList,
                          ),
                    ],
                  )),
              mediumCustomSizedBox(context),
              kLargeDivider(context, dividerClr: kWhiteSmoke),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomDisplaybox(
      {required String name,
      required IconData icon,
      required List<dynamic> listItem,
      double? hgt}) {
    return GestureDetector(
      onTap: () {
        bottomDialog(
          context: context,
          height: hgt ?? 200,
          widget: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: listItem.length,
              addAutomaticKeepAlives: true,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  onTap: () {
                    //Navigator.pop(context);
                    //Navigator.push(context, CustomSimplePageRoute(page: PickUpProductsConfirm() ,routeName: '/pickupproductconfirm'));
                  },
                  title: Text(listItem[i], style: mediumTextStyle(context)),
                  trailing: Icon(Icons.arrow_right),
                );
              }),
        );
      },
      child: Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          //color: Colors.white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                name,
                style: mediumTextStyle(context).copyWith(color: kPrimaryColor),
              ),
              Container(
                  margin: EdgeInsets.only(left: 4),
                  child: Icon(icon, color: kPrimaryColor, size: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
