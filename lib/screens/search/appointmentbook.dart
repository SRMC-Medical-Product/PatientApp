import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AppointmentBookingPage extends StatefulWidget {
  static const routeName = appointmentbookingpage;
  const AppointmentBookingPage({ Key? key }) : super(key: key);

  @override
  _AppointmentBookingPageState createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {

  List<dynamic> _memberItem = ["Loga Subramani","Karthikeyan"];

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
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU")),
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
                                        "Testing Doctor",
                                        style: mediumTextStyle(context)
                                            .copyWith(
                                                fontSize: isMobile(context)
                                                    ? 16.5
                                                  : 18.5),
                                      ),
                                      Text(
                                        "MBBS - MD",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: smallTextStyle(context)
                                            .copyWith(height: 1.7),
                                      ),
                                      Text(
                                        "Cardiologist",
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
                                              title: "3 yrs",
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
                                              title: "Male",
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
                      Container(
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
                                    "Loga Subramani",
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
                                              onTap: () {
                                                
                                              },
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
                                                      Icon(Icons.add,color:Colors.black,size:15),
                                                      Text("Add new member",style: mediumTextStyle(context))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                itemCount: _memberItem.length,
                                                addAutomaticKeepAlives: true,
                                                itemBuilder: (BuildContext context, int i) {
                                                  return ListTile(
                                                    onTap: () {
                                                      },
                                                    title: Text(_memberItem[i], style: mediumTextStyle(context)),
                                                    trailing: Icon(Icons.arrow_right),
                                                  );
                                                }),
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
                ),
                      kLargeDivider(context, dividerClr: kWhiteSmoke),                
                    ],
                  ),
                  //mediumCustomSizedBox(context),
                 Container(
                   width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                ),
                  FixedTabSwitcher(
                    isExpanded: true,
                    dateSlots: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
               ),
               mediumCustomSizedBox(context),
              ],
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}