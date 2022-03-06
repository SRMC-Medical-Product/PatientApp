import 'package:patientapp/apis/appointmentsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/appcontroller.dart';
import 'package:patientapp/screens/components/contenttile.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AppointmentConfirmationPage extends StatefulWidget {
  static const routeName = appointmentconfirmationpage;

  final String date;
  final String time;
  final String doctorId;
  final String patientId;

  const AppointmentConfirmationPage({Key? key,required this.date,required this.time,required this.doctorId,required this.patientId}) : super(key: key);

  @override
  _AppointmentConfirmationPageState createState() =>
      _AppointmentConfirmationPageState();
}

class _AppointmentConfirmationPageState
    extends State<AppointmentConfirmationPage> {
    
  final AppointmentsAPI _appointmentsAPI = AppointmentsAPI();

  Future? _confirmationFuture;

  @override
    void initState() {
      super.initState();
      _confirmationFuture = _fetchAppointmentConfirmation();
    }    

  Future<void> _fetchAppointmentConfirmation() async{
    return await _appointmentsAPI.postConfirmBookingAppointment(context: context, selectedDate: widget.date, selectedTime: widget.time, patientId: widget.patientId, doctorId: widget.doctorId);
  }


  postMakeAppointmentBooking({required String selectedDate, required String selectedTime})async{
    return await _appointmentsAPI.postMakeAppointmentBooking(context: context, selectedDate: selectedDate, selectedTime: selectedTime, patientId: widget.patientId, doctorId: widget.doctorId).then((res){
      if(res==true){
        Navigator.push(context, CustomSimplePageRoute(page: const AppScreenController(indexScreen: 0,), routeName: appcontroller) );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Booking Appointment has been failed"));
      }
      Loader.hide();
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
          future: _confirmationFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return Column(
          children: [
              Expanded(child: buildSummaryContent(snapshotData:snapshot.data)),
              buildConfirmAppointmentBox(snapshotData:snapshot.data)
          ],
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

  Widget buildConfirmAppointmentBox({required Map<dynamic, dynamic> snapshotData}){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: kWhiteSmoke,
              offset: Offset(0,-1),
              spreadRadius: 1
            )
          ],
          border: Border(
            top: BorderSide(
              color: kWhiteSmoke,
              width: 1,
            ),
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: Text(
                    "Book Now",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: mediumTextStyle(context)
                        .copyWith(color: kPrimaryColor,fontFamily:kMuktaBold),
                  ),
               ),
             ),
             Expanded(
               flex: 1,
               child: GestureDetector(
                 onTap: () {
                   overlayLoader(context);
                   postMakeAppointmentBooking(selectedDate: snapshotData['selecteddate'], selectedTime: snapshotData['selectedtime'],);
                 },
                 child: Container(
                   decoration : BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50)
                   ),
                   height: 40,
                   child: Center(
                     child: Text(
                       "Confirm".toUpperCase(),
                       style: smallTextStyle(context)
                           .copyWith(color: Colors.white,fontFamily:kMuktaBold,letterSpacing: 0.2),
                     ),
                   ),
                 ),
               ),
             )
          ],
        ),
      )
    );
  }

  Widget buildSummaryContent({required Map<dynamic, dynamic> snapshotData}){
    List<dynamic> _details = snapshotData['details'];
    Map<dynamic, dynamic> _doctorInfo = snapshotData['doctor'];
    Map<dynamic, dynamic> _patientInfo = snapshotData['patient'];
    return  SingleChildScrollView(
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
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _details.length,
                  itemBuilder: (BuildContext context, int i){
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    contentDescTile(
                      context: context,
                      title: "${_details[i]['title']}", subtitle: "${_details[i]['subtitle']}"),
                    mediumCustomSizedBox(context),
                    
                  ],
                );
                  },
                )
              ),  
              kSmallDivider(context),
              //Doctor Details
              Container(
                //color: kSecondaryColor,

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
                            backgroundImage: NetworkImage(isEmptyOrNull(_doctorInfo['img']) ? DOCTOR_DEFAULT_IMG : "${_doctorInfo['img']}")),
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
                      "${_doctorInfo['name']}",
                      maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                              Text(
                                "${_doctorInfo['qualification']}",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: smallTextStyle(context).copyWith(
                                    height: 1.2,
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                              Text(
                                "${_doctorInfo['gender']}",
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
                                "${_patientInfo['name']}",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: mediumTextStyle(context)
                                    .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                              ),
                              Text(
                                "${_patientInfo['mobile']}",
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
                    mediumCustomSizedBox(context),
                    Text("${snapshotData['changemember']}",
                              softWrap: true,
                              style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:Colors.red,height:1.1))
                  ],
                ),
              ),             
              kMediumDivider(context),

              //Safety Measures
              measuresTakenList(context: context,measuresList: snapshotData['measures'],),

              kSmallDivider(context),
              //Agree Terms and Conditions
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                  child: RichText(
                      text: TextSpan(
                        style:  smallTextStyle(context).copyWith(
                              height: 1.2, color: kGraycolor, fontFamily: kMuktaRegular,),                   
                        text: 'By booking appointment, you agree to our ',
                        children: <TextSpan>[
                          TextSpan(text: 'Terms & Conditions',style: smallTextStyle(context).copyWith(
                            color:Colors.blue,fontFamily:kMuktaBold,
                            decoration : TextDecoration.underline
                            )),
                        ],
                      ),
                    ),
              )
            ],
          ),
        );
  }


}
