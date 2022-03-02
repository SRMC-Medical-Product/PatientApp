import 'package:flutter/cupertino.dart';
import 'package:patientapp/apis/appointmentsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/contenttile.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AppointmentsDetailsPage extends StatefulWidget {
  static const routeName = appointmentdetailspage;
  final String appointmentId;
  const AppointmentsDetailsPage({ Key? key,required this.appointmentId }) : super(key: key);

  @override
  _AppointmentsDetailsPageState createState() => _AppointmentsDetailsPageState();
}

class _AppointmentsDetailsPageState extends State<AppointmentsDetailsPage> {
  
  Future? _indetailFuture;
  final AppointmentsAPI _appointmentsAPI = AppointmentsAPI();

  @override
    void initState() {
      super.initState();
      _indetailFuture = _getAppointmentDetails();
    }    


  Future<void> _getAppointmentDetails() async {
    return await _appointmentsAPI.getAppointmentIndetail(context: context, appointmentId: widget.appointmentId);
  }

  Future<void> _getRefreshScreen() async {
    setState(() {
      _indetailFuture = _getAppointmentDetails();
    });
  }

  bool isCancelled = true;
  
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _getRefreshScreen,
        color: kPrimaryColor,
        strokeWidth: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: commonNavbar(context: context, isBack: true),
          body: FutureBuilder(
            future: _indetailFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                Map<dynamic, dynamic> _appointments = snapshot.data;
                return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                Text("#${_appointments['appointmentid']}",style : mediumLargeTextStyle(context).copyWith(fontFamily : kMuktaBold)),
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
                         "${_appointments['status']}".toUpperCase(),
                        style: mediumTextStyle(context)
                            .copyWith(
                              color: _appointments['status'] == "Pending" ? kPrimaryColor 
                                : (_appointments['status'] == "Completed") ? kGreenColor
                                : (_appointments['status'] == "Missed") ? kPinkRedishColor
                                : kOrangeColor,
                              fontFamily:kMuktaBold),
                      ),
                  ],
                ),
                              mediumCustomSizedBox(context),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _appointments['details'].length,
                                itemBuilder: (BuildContext context,int i){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                     _appointments['details'][i]['title'] != 'Location' ? contentDescTile(
                                        context: context,
                                        title: "${_appointments['details'][i]['title']}", subtitle: "${_appointments['details'][i]['subtitle']}")
                                        : Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${_appointments['details'][i]['title']}",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: smallTextStyle(context).copyWith(
                                                        height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                                                  ),
                                                  Text(
                                                    "Open Url",
                                                    style: mediumTextStyle(context)
                                                        .copyWith(color: kPrimaryColor,fontFamily:kMuktaBold),
                                                  ),
                                                ],
                                              ),
                                        
                                      mediumCustomSizedBox(context),
                                      ],
                                    );
                                }
                              ),
                      
                lineDivider(context),
                mediumCustomSizedBox(context),
                //  Text(" *Please report before 20 mins of your consultation time and take necessary measures before arriving at the hospital",
                //                 softWrap: true,
                //                 style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:kIndigocolor,height:1.1))
                    ],
                  ),
                ),  
                kMediumDivider(context),
                Container(
                   margin: EdgeInsets.symmetric(
                      horizontal: kDefaultScreenPaddingHorizontal(context),
                      vertical: kDefaultScreenPaddingVertical(context)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                      "Service Counter Available",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: smallTextStyle(context).copyWith(
                          height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                    ),
                    smallCustomSizedBox(context),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: _appointments['counter']['availablecounter'].length,
                        itemBuilder: (BuildContext context,int i){
                          return  Text(
                      "${_appointments['counter']['availablecounter'][i]['counter']}",
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    );
                        }
                      ),
                      smallCustomSizedBox(context),
                      Text("${_appointments['counter']['info']}",
                                softWrap: true,
                                style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:Colors.red,height:1.1))
                   
                    ],
                  ),
                ),
                kMediumDivider(context),
                _orderStatus(
                  isCancelled: _appointments['timeline']['cancelled'],
                  timeline: _appointments['timeline'],
                ),
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
                                  isEmptyOrNull(_appointments['doctor']['img']) ? DOCTOR_DEFAULT_IMG : _appointments['doctor']['img'].toString() )),
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
                        "${_appointments['doctor']['name']}",
                        maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                        style: mediumTextStyle(context)
                            .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                      ),
                                Text(
                                  "${_appointments['doctor']['qualification']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: smallTextStyle(context).copyWith(
                                      height: 1.2,
                                      color: Colors.black.withOpacity(0.9)),
                                ),
                                Text(
                                  "${_appointments['doctor']['gender']}",
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
                  padding: const EdgeInsets.all(10),
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
                                 "${_appointments['patient']['name']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: mediumTextStyle(context)
                                      .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                                ),
                                Text(
                                 "${_appointments['patient']['mobile']}",
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
                measuresTakenList(context: context,measuresList: _appointments['measures'],),
                mediumCustomSizedBox(context),
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
      ) ,
    );
  }

  Widget _orderStatus({required bool isCancelled,required Map<dynamic,dynamic> timeline }) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentDescTile(context: context, subtitle: "Appointment Timeline", title: ""),
          mediumCustomSizedBox(context),
          _stepperWidget(isDone: true,isCancelled : false, isProcessing: false, title: "${timeline['step1']['title']}",time: "${timeline['step1']['time']}"),
         if(isCancelled == false) _stepperWidget(
           isCancelled : false,
           isDone: timeline['step2']['completed'], 
           isProcessing: (timeline['step2']['completed'] == true) ? false : true, 
           title: "${timeline['step2']['title']}",time:  "${timeline['step2']['time']}"),
         if(isCancelled == false) _stepperWidget(
           isCancelled : false,
           isDone: timeline['step3']['completed'],
           isProcessing: (timeline['step2']['completed'] == true) ?(timeline['step3']['completed'] == true ? false : true) :  false, 
           title: "${timeline['step3']['title']}",
           time: "${timeline['step3']['time']}",isLast: true),
         if(isCancelled == true)  _stepperWidget(
           isCancelled : true,
           isDone:false,isProcessing: false, title: "${timeline['cancel']['title']}",time: "${timeline['cancel']['time']}",isLast: true),
        ],
      ),
    );
  }

    Widget _stepperWidget({required bool isDone,required bool isProcessing,bool? isLast,required String title,String? time,required bool isCancelled}){
    return SizedBox(
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
                        color: isDone == true  ? kMediumSeaGreen : isProcessing ? kSteelBlue : isCancelled ? kPinkRedishColor : kLavenderGrayColor,
                      ),
                      child:  Center(
                        child: Icon(
                          (isDone == true) ? Icons.done : (isProcessing == true) ? CupertinoIcons.hourglass : (isCancelled == true) ? Icons.cancel : Icons.trip_origin_outlined, 
                          size: 16, color:Colors.white),
                      ),
                    ),
                    padding: const EdgeInsets.only(
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
                            style: smallTextStyle(context).copyWith(color: isDone ==true ? kPrimaryColor : isProcessing == true ? kPrimaryColor : isCancelled ? kPinkRedishColor : kLavenderGrayColor ,fontFamily:"RobotoMedium"),
                          ),
                          Text(
                            time ?? "-",
                            style: smallTextStyle(context).copyWith(color: isDone ==true ? kPrimaryColor : isProcessing == true ? kPrimaryColor : isCancelled ? kPinkRedishColor : kLavenderGrayColor ,fontSize: isMobile(context) ? 11.5 : 13.5),
                          ),
                          mediumCustomSizedBox(context),
                          const Divider(color: kTertiaryColor, height: 0.5)
                        ],
                      ))),
            );
       
  }

}