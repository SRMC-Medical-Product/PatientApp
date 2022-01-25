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

            ],
          ),
        ),
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
