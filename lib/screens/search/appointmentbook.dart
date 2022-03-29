// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:patientapp/apis/appointmentsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/profile/familymembers.dart';

class AppointmentBookingPage extends StatefulWidget {
  static const routeName = appointmentbookingpage;
  
  final String doctorId;

  const AppointmentBookingPage({ Key? key, required this.doctorId }) : super(key: key);

  @override
  _AppointmentBookingPageState createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {

  final int _morningChoiceIndex= 0;
  int _currentIndex = 0;

  final  AppointmentsAPI _appointmentsAPI = AppointmentsAPI();
  Future? _doctorSlotFuture;

  @override
    void initState() {
      super.initState();
      _doctorSlotFuture = _fetchInitialSlotDetails();
    }    

    _fetchInitialSlotDetails() async{
      return await _appointmentsAPI.getDoctorSlotDetails(context: context, doctorId: widget.doctorId, queryDate: "").then((res){
        return res;
      });
    }

   _fetchChangedDateSlots(String date) async{
     return await _appointmentsAPI.getDoctorSlotDetails(context: context, doctorId: widget.doctorId, queryDate: date).then((res){
           Loader.hide();
       return res;
     });
   }

  //This is invoked when user taps on names in bar 
  Future<void> onChangedDate({required int value,required String date}) async {
    setState(() {
      _currentIndex = value;
    _doctorSlotFuture = _fetchChangedDateSlots(date);
    });
  }

  changeBookingMember({required String memberID}) async {
    return await _appointmentsAPI.postChangeMemberBookings(context: context, memberID: memberID).then((res){
      setState(() {
        _currentIndex = 0;
        _doctorSlotFuture = _fetchInitialSlotDetails().then((res){
          Loader.hide();
          return res;
        });
      });
      Navigator.pop(context);
      return res;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
            future: _doctorSlotFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                Map<dynamic , dynamic > _doctorInfo = snapshot.data['doctor'];
                List<dynamic > _familyMembers = snapshot.data['familymembers'];
                List<dynamic> _dateSlots = snapshot.data['availabledates'];
                List<dynamic> _mrngSlotList = snapshot.data['morning']['slots'];
                List<dynamic> _aftSlotList = snapshot.data['afternoon']['slots'];
                List<dynamic> _evenSlotList = snapshot.data['evening']['slots'];
                List<dynamic> _memberItem = snapshot.data['familymembers'];
                Map<dynamic, dynamic> _selectedFamilyMember = snapshot.data['selectedfamilymember'];
                return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        //color: kSecondaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                kDefaultScreenPaddingHorizontal(context) * 2,
                            vertical: kDefaultScreenPaddingVertical(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    maxRadius: isMobile(context) ? 35 : 50,
                                    backgroundImage: NetworkImage(
                                      isEmptyOrNull(_doctorInfo['img']) ? DOCTOR_DEFAULT_IMG : _doctorInfo['img'].toString(),
                                    )),
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
                                        "${_doctorInfo['name']}",
                                        style: mediumTextStyle(context)
                                            .copyWith(
                                                fontSize: isMobile(context)
                                                    ? 16.5
                                                  : 18.5),
                                      ),
                                      Text(
                                        "${_doctorInfo['qualification']}",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: smallTextStyle(context)
                                            .copyWith(height: 1.7),
                                      ),
                                      Text(
                                        "${_doctorInfo['specialisation']}",
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
                                              title: "${_doctorInfo['experience']} yrs",
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
                                              title: "${_doctorInfo['gender']}",
                                              bgColor: kLightRedColor,
                                              iconColor: kPinkRedishColor)
                                        ],
                                      ),
                                      mediumCustomSizedBox(context),
        
                                      ],
                                  ),
                                ),
                              ],
                            ),
                             ],
                        ),
                      ),
                      kMediumDivider(context, dividerClr: kWhiteSmoke),  
                      ListView.builder(
                        shrinkWrap:  true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _familyMembers.length,
                        itemBuilder: (BuildContext context, int i){
                          return _familyMembers[i]['selected'] == true ? Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       mediumCustomSizedBox(context),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Booking appointment for",
                                    style: mediumTextStyle(context).copyWith(
                                      color : Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    "${_familyMembers[i]['name']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: mediumTextStyle(context).copyWith(
                                      color : Colors.black,
                                      fontFamily: kMuktaBold,
                                      letterSpacing:0.1
                                    ),
                                  ),
                                  mediumCustomSizedBox(context),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child : GestureDetector(
                              onTap: () =>  bottomDialog(
                                        context: context,
                                        height: 300,
                                        widget: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () => Navigator.push(
                                                context,
                                                CustomSimplePageRoute(
                                                    page: const AllFamilyMembersPage(),
                                                    routeName: allfamilymemberspage)),
                                              child: Container(
                                                height: 35, 
                                                margin:EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context) * 2,vertical: 5),
                                                decoration: BoxDecoration(
                                                  color : kWhiteSmoke,
                                                  //border: Border.all(color: kPrimaryColor),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.add,color:Colors.black,size:15),
                                                      Text("Add new member",style: mediumTextStyle(context))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const AlwaysScrollableScrollPhysics(),
                                                  itemCount: _memberItem.length,
                                                  addAutomaticKeepAlives: true,
                                                  itemBuilder: (BuildContext context, int i) {
                                                    return ListTile(
                                                      onTap: () {
                                                        overlayLoader(context);
                                                        print("-----------------------");
                                                        print(_memberItem[i]['id'].toString());
                                                         changeBookingMember(memberID: _memberItem[i]['id'].toString());
                                                        },
                                                      leading : Icon(
                                                          _memberItem[i]['selected'] == true ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                                                          color: _memberItem[i]['selected'] == true ? kPrimaryColor : kGraycolor,
                                                        ),
                                                      title: Text("${_memberItem[i]['name']}", style: mediumTextStyle(context)),
                                                      trailing: const Icon(Icons.arrow_right),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text("Change".toUpperCase(),style: mediumTextStyle(context).copyWith(letterSpacing: 0.2,fontFamily: kMuktaBold,color: kGreenColor)),
                              ),
                            )
                          )
                        ],
                      ),
                  smallCustomSizedBox(context),

                    ],
                  ),
                ) : Container(); 
                        },
                      ),
                      kLargeDivider(context, dividerClr: kWhiteSmoke),                
                    ],
                  ),
                  //mediumCustomSizedBox(context),
                 SizedBox(
                   width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _dateSlots.isNotEmpty ? Container(
                  width: size.width,
                  color: kWhiteSmoke,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       smallCustomSizedBox(context),
                      Text(
                        "Choose your slot",
                        style: mediumTextStyle(context).copyWith(
                          color : kPrimaryColor,
                        ),
                      ),
                  smallCustomSizedBox(context),
                    ],
                  ),
                ) : Container(
                  width: size.width,
                  color: kWhiteSmoke,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       smallCustomSizedBox(context),
                      Text(
                        "No Slots are available",
                        style: mediumTextStyle(context).copyWith(
                          color : kPrimaryColor,
                        ),
                      ),
                  smallCustomSizedBox(context),
                    ],
                  ),
                ), 
                  fixedTabSwitcher(
                    dateSlots:_dateSlots , 
                    mrngSlots: _mrngSlotList,
                    noonSlots: _aftSlotList,
                    eveningSlots: _evenSlotList,
                    doctorId: widget.doctorId,
                    patientId: _selectedFamilyMember['id'],
                    selectedDate: snapshot.data['selecteddate'],
                    // ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
               ),
               mediumCustomSizedBox(context),
              ],
            ),
          )
            ],
          );
              } else if (snapshot.hasError) {
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
      ),
    );
  }


  Widget fixedTabSwitcher({
    required List<dynamic> dateSlots,
    required List<dynamic> mrngSlots,
    required List<dynamic> noonSlots,
    required List<dynamic> eveningSlots,
    required String patientId,
    required String doctorId,
    required String selectedDate,
  }){
        var size = sizeMedia(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ 
          Container(
            height: 80.0,
            width: size.width,
             color: kWhiteSmoke,
            padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
            child: ListView.builder(
              addAutomaticKeepAlives: true,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
              itemCount: dateSlots.length,
              itemBuilder: (BuildContext context, int i){
                  return   GestureDetector(
                   onTap:  () {
                     overlayLoader(context);
                    onChangedDate(
                      value: i,
                      date:  dateSlots[i]['date'].toString());
                   },
                   child: Container(
                     width: 40,
                     margin: const EdgeInsets.all(7.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("${dateSlots[i]['day']}".substring(0,3),style: mediumTextStyle(context).copyWith(
                           color: _currentIndex == i ? kPrimaryColor : kPrimaryColor),),
                         Container(
                           height: 35,
                           width: 35,
                           decoration: BoxDecoration(
                             color: _currentIndex == i ? kPrimaryColor : Colors.white,
                       borderRadius: BorderRadius.circular(6),
                       border: Border.all(color:_currentIndex == i ? kPrimaryColor : kSlateGray),
                     ),
                           child: Center(child: Text("${dateSlots[i]['date_num']}",style: mediumTextStyle(context).copyWith(
                             color : _currentIndex == i ? Colors.white : kPrimaryColor,
                             fontFamily : kMuktaBold)))),
                       ],
                     ) 
                   ));
              }),
          ),
          kLargeDivider(context, dividerClr: kWhiteSmoke), 
          if(mrngSlots.isNotEmpty) SlotChoiceChips(
            defaultChoiceIndex: _morningChoiceIndex, 
            choicesList: mrngSlots, 
            title: "Morning",
            date: selectedDate,
            doctorId: doctorId,
            patientId: patientId, 
            ),
          if(noonSlots.isNotEmpty) SlotChoiceChips(
            defaultChoiceIndex: _morningChoiceIndex, 
            choicesList: noonSlots, 
            title: "Afternoon",
            date: selectedDate,
            doctorId: doctorId,
            patientId: patientId,   
            ),
          if(eveningSlots.isNotEmpty) SlotChoiceChips(
            defaultChoiceIndex: _morningChoiceIndex, 
            choicesList: eveningSlots, 
            title: "Night",
            date: selectedDate,
            doctorId: doctorId,
            patientId: patientId,             
            ),
          mediumCustomSizedBox(context),
          smallCustomSizedBox(context),

        ],
      );
  }


}