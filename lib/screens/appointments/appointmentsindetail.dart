import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/contenttile.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AppointmentsDetailsPage extends StatefulWidget {
  static const routeName = appointmentdetailspage;
  const AppointmentsDetailsPage({ Key? key }) : super(key: key);

  @override
  _AppointmentsDetailsPageState createState() => _AppointmentsDetailsPageState();
}

class _AppointmentsDetailsPageState extends State<AppointmentsDetailsPage> {
  bool isCancelled = true;
  
  @override
  Widget build(BuildContext context) {
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
              kMediumDivider(context),
              //Appointment Details
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
              Text("#1245GHS23",style : mediumLargeTextStyle(context).copyWith(fontFamily : kMuktaBold)),
              smallCustomSizedBox(context),
              lineDivider(context),
              mediumCustomSizedBox(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "Appointment Status",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: smallTextStyle(context).copyWith(
                          height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                    ),
                    Text(
                      "Processing".toUpperCase(),
                      style: mediumTextStyle(context)
                          .copyWith(color: kOrangeColor,fontFamily:kMuktaBold),
                    ),
                ],
              ),
                            mediumCustomSizedBox(context),
                    contentDescTile(
                      context: context,
                      title: "Venue", subtitle: "Sri Ramachandra Medical Hospital"),
                    mediumCustomSizedBox(context),
                    contentDescTile(
                      context: context,
                      title: "Date & Time", subtitle:"12-12-2020 , 10:00 AM"),
                    mediumCustomSizedBox(context),
                    contentDescTile(
                      context: context,
                      title: "Consultation", subtitle: "In visit"),
                    mediumCustomSizedBox(context),
              lineDivider(context),
              mediumCustomSizedBox(context),
               Text(" *Please report before 20 mins of your consultation time and take necessary measures before arriving at the hospital",
                              softWrap: true,
                              style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:kIndigocolor,height:1.1))
                  ],
                ),
              ),  
              kMediumDivider(context),
              Container(
                 margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    contentDescTile(context: context, title: "Service Counter", subtitle: "COUNTER 1"),
                    smallCustomSizedBox(context),
                    Text(" *You are requested to apporach this counter number for your appointments procedures and guidance",
                              softWrap: true,
                              style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:Colors.red,height:1.1))
                 
                  ],
                ),
              ),
              kMediumDivider(context),
              _orderStatus(),
              kMediumDivider(context),
              //Doctor Details
              Container(
                 margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    smallCustomSizedBox(context),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            maxRadius: isMobile(context) ? 25 : 35,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU")),
                        RotatedBox(
                          quarterTurns: 1,
                          child: mediumCustomSizedBox(context),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                             
                              Text(
                      "Testing Doctor",
                      maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                              Text(
                                "MBBS MD | Cardiologist",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: smallTextStyle(context).copyWith(
                                    height: 1.2,
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                              Text(
                                "Male",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: smallTextStyle(context).copyWith(
                                    height: 1.2,
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                              smallCustomSizedBox(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),              
              kSmallDivider(context),
              //Patient Details
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person_pin_rounded,color: Colors.black.withOpacity(0.8),size:26),
                        RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Loga Subramani",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: mediumTextStyle(context)
                                    .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                              ),
                              Text(
                                "9876543210",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: smallTextStyle(context).copyWith(
                                    height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),             
              kMediumDivider(context),
              //Safety Measures
              mesauresTakenList(context),
              mediumCustomSizedBox(context),
 ],
          ),
        )
      ) ,
    );
  }

  Widget _orderStatus() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentDescTile(context: context, subtitle: "Appointment Timeline", title: ""),
          mediumCustomSizedBox(context),
          _stepperWidget(isDone: true, isProcessing: false, title: "Booking Confirmed",time: "12.06 am"),
          _stepperWidget(isDone: false, isProcessing: true, title: "Arrived at Hospital",time: "12.16 am"),
          _stepperWidget(isDone:false,isProcessing: false, title: "Consulted",time: "Pending",isLast: true),
          
        ],
      ),
    );
  }

    Widget _stepperWidget({required bool isDone,required bool isProcessing,bool? isLast,required String title,String? time}){
    return Container(
              height: 60,
              child: TimelineTile(
                  beforeLineStyle: LineStyle(color: isProcessing != true ? Colors.black : kTertiaryColor,thickness:0.6 ),
                  indicatorStyle: IndicatorStyle(
                    color: kMediumSeaGreen,
                    drawGap: true,
                    height: 25,
                    width: 25,
                    indicatorXY: 0,
                    indicator: Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDone == true  ? kMediumSeaGreen : isProcessing ? kSteelBlue : kLavenderGrayColor,
                      ),
                      child:  Center(
                        child: Icon(
                          isDone == true ? Icons.done : isProcessing == true ? CupertinoIcons.hourglass : Icons.trip_origin_outlined, 
                          size: 16, color:Colors.white),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                  alignment: TimelineAlign.start,
                  isFirst: true,
                  isLast: isLast == true ?  true : false,
                  endChild: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
                      constraints: const BoxConstraints(minHeight: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: smallTextStyle(context).copyWith(color: isDone ==true ? kPrimaryColor : isProcessing == true ? kPrimaryColor : kLavenderGrayColor ,fontFamily:"RobotoMedium"),
                          ),
                          Text(
                            time ?? "-",
                            style: smallTextStyle(context).copyWith(color: isDone ==true ? kPrimaryColor : isProcessing == true ? kPrimaryColor : kLavenderGrayColor ,fontSize: isMobile(context) ? 11.5 : 13.5),
                          ),
                          mediumCustomSizedBox(context),
                          Divider(color: kTertiaryColor, height: 0.5)
                        ],
                      ))),
            );
       
  }

}