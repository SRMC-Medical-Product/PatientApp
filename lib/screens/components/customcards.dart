import 'package:patientapp/helpers/headers.dart';

Widget customAppointmentCard({required BuildContext context,Color? borderClr}) {
  var size = sizeMedia(context);
  return Container(
    height: isMobile(context) ? 140 : 180,
    width: size.width,
    padding: const EdgeInsets.all(20),
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
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"))
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
                      Text("Dr . Testing Subba Raoss",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: isMobile(context)
                              ? mediumTextStyle(context).copyWith(
                                  color: kPrimaryColor, fontSize: 17.5)
                              : largeTextStyle(context)
                                  .copyWith(color: kPrimaryColor)),
                      Text("ENT",
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
                    icon: Icons.calendar_today_sharp, text: "Monday, Aug 19"),
                RotatedBox(
                    quarterTurns: 1, child: mediumCustomSizedBox(context)),
                iconText(context:context,icon: Icons.access_time, text: "11:00 am"),
              ],
            ),
          ),
        ),
      ],
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
