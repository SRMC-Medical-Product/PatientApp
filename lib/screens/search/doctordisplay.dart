import 'package:flutter/cupertino.dart';
import 'package:patientapp/apis/searchscreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/search/appointmentbook.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';

class DoctorsDisplayPage extends StatefulWidget {
  static const routeName = doctordisplay;

  String searchType;
  String? searchQuery;
  

  DoctorsDisplayPage({Key? key,required this.searchType,this.searchQuery}) : super(key: key);

  @override
  _DoctorsDisplayPageState createState() => _DoctorsDisplayPageState();
}

class _DoctorsDisplayPageState extends State<DoctorsDisplayPage> {

  final List<dynamic> _specialisation = ['Cardiology', 'General Surgeon'];
  final List<dynamic> _gender = ["Male", "Female", "Other"];
  final List<dynamic> _experinceList = ['Low to High', 'High to Low'];

  Future? _searchFuture;

  final SearchAPI _searchAPI = SearchAPI();

  final TextEditingController _searchController = TextEditingController();

  @override
    void initState() {
      super.initState();
      _searchFuture = _fetchSearchFirstResults();
    }    

  _fetchSearchFirstResults()  async {
    return await _searchAPI.performSearch(
      context: context, 
      searchType: widget.searchType, 
      searchQuery: widget.searchQuery ?? "",
      );
  }


  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: FutureBuilder(
          future: _searchFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              List<dynamic> _doctorsList = snapshot.data['doctors'];
              return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                    StaticSearch(
                      radius: 5.0,
                      searchHint: "Search doctors and specialisation",
                      onTap: () => Navigator.push(
                          context,
                          CustomSimplePageRoute(
                              page:const DynamicSearchPage(), //TODO
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
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      bottomDisplaybox(
                        name: "Specialisation",
                        icon: Icons.sort,
                        listItem: _specialisation,
                        hgt: size.height / 2,
                      ),
                      bottomDisplaybox(
                          name: "Gender",
                          icon: Icons.arrow_drop_down,
                          listItem: _gender,
                          hgt: 250),
                      bottomDisplaybox(
                        name: "Exp",
                        icon: Icons.arrow_drop_down,
                        listItem: _experinceList,
                      ),
                    ],
                  )),
              mediumCustomSizedBox(context),
              Container(
                height: isMobile(context) ? 55 : 60,
                width: size.width,
                decoration: const BoxDecoration(color: kWhiteSmoke),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Search Results".toUpperCase(),
                      style: mediumLargeTextStyle(context).copyWith(
                          letterSpacing: 0.2,
                          color: kDarkGray,
                          fontFamily: kMuktaBold),
                    ),
                  ],
                ),
              ),
              mediumCustomSizedBox(context),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _doctorsList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        //color: kSecondaryColor,
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                kDefaultScreenPaddingHorizontal(context) * 2,
                            vertical: kDefaultScreenPaddingVertical(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    maxRadius: isMobile(context) ? 35 : 50,
                                    backgroundImage: NetworkImage(
                                        isEmptyOrNull(_doctorsList[i]['img']) ? DOCTOR_DEFAULT_IMG : _doctorsList[i]['img'].toString() )),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: mediumCustomSizedBox(context),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: smallCustomSizedBox(context),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_doctorsList[i]['name']}",
                                        style: mediumTextStyle(context)
                                            .copyWith(
                                                fontSize: isMobile(context)
                                                    ? 16.5
                                                    : 18.5),
                                      ),
                                      Text(
                                        "${_doctorsList[i]['deptname']}",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: smallTextStyle(context)
                                            .copyWith(height: 1.7),
                                      ),
                                      smallCustomSizedBox(context),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          doctorTileContent(
                                              context: context,                                           
                                              icon: Icons.work_outline_outlined,
                                              title: "${_doctorsList[i]['experience']}",
                                              bgColor: kSecondaryColor,
                                              iconColor: kPrimaryColor),
                                          RotatedBox(
                                            quarterTurns: 1,
                                            child:
                                                mediumCustomSizedBox(context),
                                          ),
                                          RotatedBox(
                                            quarterTurns: 1,
                                            child:
                                                mediumCustomSizedBox(context),
                                          ),
                                          doctorTileContent(
                                              context: context,
                                              icon: Icons.person_rounded,
                                              title: "${_doctorsList[i]['gender']}",
                                              bgColor: kLightRedColor,
                                              iconColor: kPinkRedishColor)
                                        ],
                                      ),
                                      mediumCustomSizedBox(context),
                                      GestureDetector(
                                        onTap: () => Navigator.push(context, CustomSimplePageRoute(page: const AppointmentBookingPage(), routeName: appointmentbookingpage)),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: kOrangeColor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Center(
                                            child: Text(
                                              "Book Now".toUpperCase(),
                                              style: mediumTextStyle(context)
                                                  .copyWith(
                                                      fontFamily: kMuktaBold,
                                                      color: Colors.white,
                                                      letterSpacing: 0.2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      kLargeDivider(context, dividerClr: kWhiteSmoke),
                    ],
                  );
                },
              )
            ],
          ),
        );
            }else if (snapshot.hasError) {
                        return defaultErrordialog(
                            context: context,
                            errorCode: ES_0060,
                            message: "Something went wrong.Try again Later");
                      }
                      return SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Center(child: customCircularProgress()));
          },
        )
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
              physics: const ScrollPhysics(),
              itemCount: listItem.length,
              addAutomaticKeepAlives: true,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  onTap: () {
                    //Navigator.pop(context);
                    //Navigator.push(context, CustomSimplePageRoute(page: PickUpProductsConfirm() ,routeName: '/pickupproductconfirm'));
                  },
                  title: Text(listItem[i], style: mediumTextStyle(context)),
                  trailing: const Icon(Icons.arrow_right),
                );
              }),
        );
      },
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
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
                  margin: const EdgeInsets.only(left: 4),
                  child: Icon(icon, color: kPrimaryColor, size: 22)),
            ],
          ),
        ),
      ),
    );
  }

}
