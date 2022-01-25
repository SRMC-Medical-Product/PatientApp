import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AppointmentConfirmationPage extends StatefulWidget {
  static const routeName = appointmentconfirmationpage;
  const AppointmentConfirmationPage({Key? key}) : super(key: key);

  @override
  _AppointmentConfirmationPageState createState() =>
      _AppointmentConfirmationPageState();
}

class _AppointmentConfirmationPageState
    extends State<AppointmentConfirmationPage> {
  
  final List<dynamic> _measuresTaken = [
    {
      "steps" : "Mask Mandatory n my flutter project, I ha n my flutter project, I ha"
    },
    {
      "steps": "Wash Hands"
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: Column(
          children: [
              Expanded(child: buildSummaryContent()),
              buildConfirmAppointmentBox()
          ],
        )
      ),
    );
  }

  Widget buildConfirmAppointmentBox(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
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
             )
          ],
        ),
      )
    );
  }

  Widget buildSummaryContent(){
    return  SingleChildScrollView(
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
                    _contentTile(title: "Venue", subtitle: "Sri Ramachandra Medical Hospital"),
                    mediumCustomSizedBox(context),
                    _contentTile(title: "Date & Time", subtitle:"12-12-2020 , 10:00 AM"),
                    mediumCustomSizedBox(context),
                    _contentTile(title: "Consultation", subtitle: "In visit"),
                  ],
                ),
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
                    mediumCustomSizedBox(context),
                    Text(" *If this appointment is not for your, please go back and change",
                              softWrap: true,
                              style: smallTextStyle(context).copyWith(fontFamily: kMuktaRegular,color:Colors.red,height:1.1))
                  ],
                ),
              ),             
              kMediumDivider(context),

              //Safety Measures
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    smallCustomSizedBox(context),
                    Text(
                      "Measures to be taken",
                      style: mediumTextStyle(context)
                          .copyWith(color:Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                    smallCustomSizedBox(context),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _measuresTaken.length,
                      itemBuilder: (BuildContext context, int i){
                          return Padding(
                      padding: const EdgeInsets.only(left: 7,bottom: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              color: kGraycolor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                          Expanded(
                            child: Text(
                                                  _measuresTaken[i]['steps'],
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: smallTextStyle(context).copyWith(
                              height: 1.2, color: kGraycolor, fontFamily: kMuktaRegular),
                                                ),
                          ),
                        ],
                      ),
                    );
                      }
                    ),
                  ],
                )
              ),

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

  Widget _contentTile({required String title,required String subtitle}) {
    return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: smallTextStyle(context).copyWith(
                          height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                    ),
                    Text(
                      subtitle,
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                  ],
                );
  }

}
