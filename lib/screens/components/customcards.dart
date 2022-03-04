import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';

Widget customListAppointmentCard({required BuildContext context,Color? borderClr , required List appointment}) {
  var size = sizeMedia(context);
  return ListView.builder(
    itemCount: appointment.length,
    scrollDirection: Axis.vertical,
    shrinkWrap: true, 
    physics: const NeverScrollableScrollPhysics(),
     itemBuilder: (BuildContext context, int i) {
      return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [ 
               GestureDetector(
     onTap: () => Navigator.push(context,CustomRightPageRoute(page: AppointmentsDetailsPage(appointmentId: appointment[i]['id'].toString(),), routeName: appointmentdetailspage)),
      
                 child: Container(
                   height: isMobile(context) ? 140 : 180,
                   width: size.width,
                   padding: const EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     border: Border.all(color: borderClr  ?? kSlateGray),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SizedBox(
                         height: isMobile(context) ? 50 : 70,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               width: isMobile(context) ? 50 : 70,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: NetworkImage(
                                         isEmptyOrNull(appointment[i]['img']) ? 
                                           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"
                                           : "${appointment[i]['img']}"),
                             ))),
                             Expanded(
                               flex: 1,
                               child: Container(
                                 padding: const EdgeInsets.only(
                                   left: 10,
                                   right: 10,
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text("Dr.${appointment[i]['name']}",
                                         maxLines: 1,
                                         overflow: TextOverflow.clip,
                                         style: isMobile(context)
                                             ? mediumTextStyle(context).copyWith(
                                                 color: kPrimaryColor, fontSize: 15.5)
                                             : largeTextStyle(context)
                                                 .copyWith(color: kPrimaryColor)),
                                     Text("${appointment[i]['specialisation']}",
                                         maxLines: 1,
                                         overflow: TextOverflow.clip,
                                         style: isMobile(context)
                                             ? smallTextStyle(context).copyWith(
                                                 color: kDimGray, fontFamily: kMuktaRegular)
                                             : mediumTextStyle(context).copyWith(
                                                 color: kDimGray, fontFamily: kMuktaRegular)),
                                   ],
                                 ),
                               ),
                             ),
                             GestureDetector(
                              onTap: () => Navigator.push(context,CustomRightPageRoute(page: AppointmentsDetailsPage(appointmentId: appointment[i]['id'].toString(),), routeName: appointmentdetailspage)),
      
                               child: Container(
                                 height: isMobile(context) ? 40 : 55,
                                 width: isMobile(context) ? 40 : 55,
                                 decoration: BoxDecoration(
                                   color: kSecondaryColor,
                                   borderRadius: BorderRadius.circular(6),
                                 ),
                                 child:
                                     const Icon(Icons.arrow_right_alt_outlined, color: kPrimaryColor),
                               ),
                             )
                           ],
                         ),
                       ),
                       mediumCustomSizedBox(context),
                       lineDivider(context,color:kSlateGray,thickness: 0.7),
                       smallCustomSizedBox(context),
                       Expanded(
                         child: Container(
                           padding: EdgeInsets.symmetric(
                               horizontal: isMobile(context) ? 6 : 14, vertical: 4),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(7),
                             color: Colors.white,
                           ),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               iconText(context: context,
                                   icon: Icons.calendar_today_sharp, text: "${appointment[i]['date']}"),
                               RotatedBox(
                                   quarterTurns: 1, child: mediumCustomSizedBox(context)),
                               iconText(context:context,icon: Icons.access_time, text: "${appointment[i]['time']}"),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               smallCustomSizedBox(context),
             ],
           );
    }
  );
}


Widget customAppointmentCard({required BuildContext context,required String appointmentId,Color? borderClr,required String doctorImg,required String doctorName,required String doctorSpec,required String appointmentDate,required String appointmentTime}) {
  var size = sizeMedia(context);
  return GestureDetector(
    onTap: () => Navigator.push(context,CustomRightPageRoute(page: AppointmentsDetailsPage(appointmentId: appointmentId,), routeName: appointmentdetailspage)),
    child: Container(
      height: isMobile(context) ? 140 : 180,
      width: size.width,
      margin: EdgeInsets.only(bottom: isMobile(context) ? 10 : 20),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderClr  ?? kSlateGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: isMobile(context) ? 50 : 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: isMobile(context) ? 50 : 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            isEmptyOrNull(doctorImg)  ? DOCTOR_DEFAULT_IMG :  doctorImg
                            ))
                              ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Dr . $doctorName",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: isMobile(context)
                                ? mediumTextStyle(context).copyWith(
                                    color: kPrimaryColor, fontSize: 15.5)
                                : largeTextStyle(context)
                                    .copyWith(color: kPrimaryColor)),
                        Text(doctorSpec,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: isMobile(context)
                                ? smallTextStyle(context).copyWith(
                                    color: kDimGray, fontFamily: kMuktaRegular)
                                : mediumTextStyle(context).copyWith(
                                    color: kDimGray, fontFamily: kMuktaRegular)),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: isMobile(context) ? 40 : 55,
                  width: isMobile(context) ? 40 : 55,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child:
                      const Icon(Icons.arrow_right_alt_outlined, color: kPrimaryColor),
                )
              ],
            ),
          ),
          mediumCustomSizedBox(context),
          lineDivider(context,color:kSlateGray,thickness: 0.7),
          smallCustomSizedBox(context),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile(context) ? 6 : 14, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconText(context: context,
                      icon: Icons.calendar_today_sharp, text: appointmentDate),
                  RotatedBox(
                      quarterTurns: 1, child: mediumCustomSizedBox(context)),
                  iconText(context:context,icon: Icons.access_time, text: appointmentTime),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget iconText({required BuildContext context,required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon,
            color: kPrimaryColor, size: smallMobile(context) ? 16.5 : 24),
        Container(
          margin: const EdgeInsets.only(left: 7.0),
          child: Text(text,
              style: smallMobile(context)
                  ? smallTextStyle(context)
                      .copyWith(color: kIndigocolor, fontFamily: kMuktaRegular)
                  : mediumTextStyle(context).copyWith(
                      color: kIndigocolor, fontFamily: kMuktaRegular)),
        ),
      ],
    );
  }
