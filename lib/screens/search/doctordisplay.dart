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
  String? doctorSpecialist;
  String? doctorExp;
  String? doctorGender;  

  DoctorsDisplayPage({Key? key,required this.searchType,this.searchQuery,this.doctorSpecialist,this.doctorExp,this.doctorGender}) : super(key: key);

  @override
  _DoctorsDisplayPageState createState() => _DoctorsDisplayPageState();
}

class _DoctorsDisplayPageState extends State<DoctorsDisplayPage> {


  Future? _searchFuture;

  final SearchAPI _searchAPI = SearchAPI();

  final TextEditingController _searchController = TextEditingController();

  @override
    void initState() {
      super.initState();
      _searchFuture = _fetchSearchQueryResults();
    }    

  _fetchSearchQueryResults()  async {
    return await _searchAPI.performSearch(
      context: context, 
      searchType: widget.searchType, 
      searchQuery: widget.searchQuery ?? "",
      doctorSpecialist: widget.doctorSpecialist ?? "",
      doctorExp: widget.doctorExp ?? "1",
      doctorGender: widget.doctorGender ?? "A",
      ).then((res){
        return res;
      } );
  }

  _fetchFilteredQueryResults({String? searchType,String? specialisationId,required String doctorGender,required String doctorExp}) async {
    return await _searchAPI.performSearch(
      context: context, 
      searchType: searchType ?? widget.searchType, 
      searchQuery: widget.searchQuery ?? "",
      doctorSpecialist: specialisationId ?? widget.doctorSpecialist,
      doctorExp: doctorExp,
      doctorGender: doctorGender,
      ).then((res){
        Loader.hide();
        return res;
      });
  }

  Future<void> _changeQueryResultSet({String? searchType, String? specialisationId,required String doctorGender,required String doctorExp}) async {
    setState(() {
      _searchFuture = _fetchFilteredQueryResults(searchType : searchType,doctorGender: doctorGender, doctorExp: doctorExp,specialisationId: specialisationId);
    });
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
              List<dynamic> _specialisation = snapshot.data['specialisation'];
              List<dynamic> _gender = snapshot.data['gender']['gender'];
              List<dynamic> _experience = snapshot.data['experience']['experience'];
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
                      searchHint: widget.searchQuery ?? "Search doctors and specialisation",
                      onTap: () => Navigator.push(
                          context,
                          CustomSimplePageRoute(
                              page:const DynamicSearchPage(isOneTimePop:false), //TODO
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

                      /*
                      //Specialisation Dropdown                      
                      GestureDetector(
                        onTap: () {
                          bottomDialog(
                            context: context,
                            height: size.height / 2 ?? 200,
                            widget: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: _specialisation.length,
                                addAutomaticKeepAlives: true,
                                itemBuilder: (BuildContext context, int i) {
                                  return ListTile(
                                    onTap: () {
                                      _changeQueryResultSet(
                                        doctorExp:snapshot.data['experience']['selected_id'].toString(), 
                                        doctorGender: snapshot.data['gender']['selected_id'].toString(),
                                      );
                                      //Navigator.pop(context);
                                      //Navigator.push(context, CustomSimplePageRoute(page: PickUpProductsConfirm() ,routeName: '/pickupproductconfirm'));
                                    },
                                    leading : Icon(
                                      _specialisation[i]['selected'] == true ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                                      color: _specialisation[i]['selected'] == true ? kPrimaryColor : kGraycolor,
                                    ),
                                    title: Text(_specialisation[i]['title'], style: mediumTextStyle(context)),
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
                                  "Specialisation",
                                  style: mediumTextStyle(context).copyWith(color: kPrimaryColor),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child: Icon(Icons.sort, color: kPrimaryColor, size: 22)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      ///Gender Dropdown
                      GestureDetector(
                        onTap: () {
                          bottomDialog(
                            context: context,
                            height: 250,
                            widget: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: _gender.length,
                                addAutomaticKeepAlives: true,
                                itemBuilder: (BuildContext context, int i) {
                                  return ListTile(
                                    onTap: () {
                                      _changeQueryResultSet(
                                        doctorExp: snapshot.data['experience']['selected_id'].toString(),   
                                        doctorGender:_gender[i]['id'].toString(),
                                      );
                                      //Navigator.pop(context);
                                      //Navigator.push(context, CustomSimplePageRoute(page: PickUpProductsConfirm() ,routeName: '/pickupproductconfirm'));
                                    },
                                    leading : Icon(
                                      _gender[i]['selected'] == true ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                                      color: _gender[i]['selected'] == true ? kPrimaryColor : kGraycolor,
                                    ),
                                    title: Text(_gender[i]['title'], style: mediumTextStyle(context)),
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
                                  "Gender",
                                  style: mediumTextStyle(context).copyWith(color: kPrimaryColor),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child:const Icon(Icons.arrow_drop_down, color: kPrimaryColor, size: 22)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      ///Experience Dropdown
                      GestureDetector(
                        onTap: () {
                          bottomDialog(
                            context: context,
                            height: 250,
                            widget: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: _experience.length,
                                addAutomaticKeepAlives: true,
                                itemBuilder: (BuildContext context, int i) {
                                  return ListTile(
                                    onTap: () {
                                      _changeQueryResultSet(
                                        doctorExp: _experience[i]['id'].toString(),
                                        doctorGender: snapshot.data['gender']['selected_id'].toString(), 
                                      );
                                      //Navigator.pop(context);
                                      //Navigator.push(context, CustomSimplePageRoute(page: PickUpProductsConfirm() ,routeName: '/pickupproductconfirm'));
                                    },
                                    leading : Icon(
                                      _experience[i]['selected'] == true ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                                      color: _experience[i]['selected'] == true ? kPrimaryColor : kGraycolor,
                                    ),
                                    title: Text(_experience[i]['title'], style: mediumTextStyle(context)),
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
                                  "Experience",
                                  style: mediumTextStyle(context).copyWith(color: kPrimaryColor),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child:const Icon(Icons.arrow_drop_down, color: kPrimaryColor, size: 22)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      */
                      
                      bottomDisplaybox(
                        name: "Specialisation",
                        icon: Icons.sort,
                        listItem: _specialisation,
                        hgt: size.height / 2,
                        isExperience: false,
                        isGender: false,
                        isSpecialisation: true,
                        selectedExperience: snapshot.data['experience']['selected_id'].toString(),
                        selectedGender: snapshot.data['gender']['selected_id'].toString(),
                      ),
                      bottomDisplaybox(
                        name: "Gender",
                        icon: Icons.arrow_drop_down,
                        listItem: _gender,
                        hgt: 250,
                        isExperience: false,
                        isGender: true,
                        isSpecialisation: false,
                        selectedExperience: snapshot.data['experience']['selected_id'].toString(),
                        selectedGender: snapshot.data['gender']['selected_id'].toString(),                          
                          ),
                      bottomDisplaybox(
                        name: "Exp",
                        hgt: 250,
                        icon: Icons.arrow_drop_down,
                        listItem: _experience,
                        isExperience: true,
                        isGender: false,
                        isSpecialisation: false,
                        selectedExperience: snapshot.data['experience']['selected_id'].toString(),
                        selectedGender: snapshot.data['gender']['selected_id'].toString(),
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
      required String selectedGender,
      required String selectedExperience,
      required bool isGender,
      required bool isExperience,
      required bool isSpecialisation,
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
                    overlayLoader(context);
                    if(isGender) {
                       if(widget.searchQuery.toString().isNotEmpty){
                        _changeQueryResultSet(
                        doctorGender: listItem[i]['id'].toString(),
                        doctorExp: selectedExperience,
                        searchType: "default",
                        specialisationId: ""
                      );
                      }else{
                     _changeQueryResultSet(
                        doctorGender: listItem[i]['id'].toString(),
                        doctorExp: selectedExperience,
                      );
                      }
                      
                      Navigator.pop(context);
                    }
                    if(isExperience) {
                      if(widget.searchQuery.toString().isNotEmpty){
                       _changeQueryResultSet(
                        doctorExp: listItem[i]['id'].toString(),
                        doctorGender: selectedGender,
                        searchType: "default",
                        specialisationId: ""
                      );
                      }else{
                     _changeQueryResultSet(
                        doctorExp: listItem[i]['id'].toString(),
                        doctorGender: selectedGender,
                      );
                      }
                      
                      Navigator.pop(context);
                    }
                    if(isSpecialisation){
                      if(widget.searchQuery.toString().isNotEmpty){
                        _changeQueryResultSet(
                          searchType: "default",
                        doctorExp: selectedExperience,
                        doctorGender: selectedGender,
                        specialisationId: listItem[i]['id'].toString(),
                      );
                      }else{
                      _changeQueryResultSet(
                        doctorExp: selectedExperience,
                        doctorGender: selectedGender,
                        specialisationId: listItem[i]['id'].toString(),
                      );
                      }
                      Navigator.pop(context);
                    }  
                    },
                  leading : Icon(
                    listItem[i]['selected'] == true ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                    color: listItem[i]['selected'] == true ? kPrimaryColor : kGraycolor,
                  ),
                  title: Text(listItem[i]['title'], style: mediumTextStyle(context)),
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
