/*---------------- Custom Widgets which is common for whole app -------------------*/

import 'package:patientapp/helpers/headers.dart';

/* ------------------------ INR Symbols -------------------------*/
// ignore: constant_identifier_names
const String INRSymbol = "\u{20B9}";

/* ---------------MediaQuery--------------------------------*/
sizeMedia(BuildContext context) {
  return MediaQuery.of(context).size;
}

/* ---------------Default Padding and Margin--------------------------------*/
const kDefaultPadding = 30.0;

/* ---------------Default Screen Margin--------------------------------*/
//Used in Authentication Pages
kScreenMarginHorizontal(context) {
  return isMobile(context) ? kDefaultPadding - 15.0 : kDefaultPadding * 1.5;
}

/* ---------------Default Screen Padding--------------------------------*/
//Used in Main Screen Pages
kDefaultScreenPaddingHorizontal(context) {
  return isMobile(context) ? 14.0 : 17.0;
}

kDefaultScreenPaddingVertical(context) {
  return isMobile(context) ? 10.0 : 14.0;
}

screenPads(context) {
  return EdgeInsets.symmetric(
      horizontal: kDefaultScreenPaddingHorizontal(context),
      vertical: kDefaultScreenPaddingVertical(context));
}

/* -------------- Text Style --------------*/
ultraProLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 26.0 : 29.0,
  );
}

ultraLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 24.0 : 27.0,
  );
}

largeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 21.0 : 24.0,
  );
}

mediumTextStyle(context) {
  return TextStyle(
    fontFamily: kMuktaRegular,
    fontSize: isMobile(context) ? 15.0 : 17.0,
    color: kBlackTextColor,
  );
}

smallTextStyle(context) {
  return TextStyle(
      fontFamily: kQuickSandRegular,
      fontSize: isMobile(context) ? 13.0 : 15.0,
      color: kGraycolor);
}

/* ---------------Custom Divider Gray Box--------------------------------*/
kLargeDivider(context) {
  return Container(
      decoration: const BoxDecoration(color: kSlateGray),
      height: isMobile(context) ? 11.0 : 13.0);
}

kMediumDivider(context) {
  return Container(
      decoration: const BoxDecoration(color: kSlateGray),
      height: isMobile(context) ? 6.0 : 9.0);
}

kSmallDivider(context, {Color? lineColor}) {
  return Container(
      decoration: BoxDecoration(color: lineColor ?? kSlateGray),
      height: isMobile(context) ? 1.5 : 3.0);
}

/* ---------------Custom Line Divider--------------------------------*/
lineDivider(context, {double? thickness, Color? color}) {
  return Divider(
    color: color ?? kLavenderGrayColor,
    thickness: thickness ?? (isMobile(context) ? 0.1 : 0.25),
    endIndent: 2.0,
    indent: 2.0,
    height: 1.0,
  );
}

/* ---------------Custom Sized Box Divider--------------------------------*/
Widget mediumCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 15.0 : 22.0);
}

Widget smallCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 6.0 : 9.0);
}

/* ---------------To check if the value is null or empty--------------------------------*/
isEmptyOrNull(var x) {
  if ((x.toString().isEmpty) || (x == null)) {
    return true;
  } else {
    return false;
  }
}


/* ---------------Single Promotions Box-------------------------------*/
class SinglePromotionBox extends StatelessWidget {
  final String imgUrl;
  const SinglePromotionBox({Key? key,required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return Container(
      width: size.width,
      height: isMobile(context) ? size.height / 4 : size.height / 3.5,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),
          vertical: kDefaultScreenPaddingVertical(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imgUrl))),
              
    );
  }
}

/* -------------------Text Highlighter----------------------------*/
Widget titleText({required BuildContext context,required String text,required Color color}) {
  return Text(text,style:mediumTextStyle(context).copyWith(fontSize: isMobile(context) ? 18.0 : 21.0,color:color));                  
}
