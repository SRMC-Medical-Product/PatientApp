import 'package:patientapp/helpers/headers.dart';

//Primary font

const kMuktaRegular = 'MuktaRegular';
const kMuktaBold = 'MuktaBold';
const kQuickSandRegular = 'QuickSandRegular';
const kQuickSandBold = 'QuickSandBold';


//Screen background color
const kScreenBackground = Colors.white;
// Color
const kPrimaryColor =Color(0xff242c78);
    //Color(0xff242c78); 
    //Color(0xff06919d); 
    //Color(0xff5E56BF);
const kSecondaryColor =
    Color(0xffafcfed); 
    //Color(0xffbbe2e5);
    //Color(0xffF3EFFD);
const kTertiaryColor = Color(0xff4B257E);
const kOrangeColor = Color(0xfffa8112);

const kIndigocolor = Color(0xff431C77);
const kBorderColor = Color(0xff585858);
const kMenuColor = Color(0xffF7F8FC);
const klightblue = Color(0xFFfafbff);
const kYellowColor = Color(0xffFDC500);
const kLavenderGrayColor = Color(0xffe2e7f3);
const kLightLavengerGrayColor = Color(0xffF7F8FC);
const kBlackTextColor = Color(0xff000000);
const kAliceBlueColor = Color(0xfff3f6fb);
const kGreenColor = Color(0xff03C04A);

final otpInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kSecondaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kSecondaryColor)));

//Gray Color Type
const kDarkGray = Color(0xff535356);
const kLightGrayColor = Color(0xffD2D2D2);
const kDimGray = Color(0xff707070);
const kGraycolor = Color(0xff807979);
const kSlateGray = Color(0xffEDF0F4);
const kWhiteSmoke = Color(0xfff2f2f8);

//Rating Star
const kStarColor = Color(0xffFDC903);

//Red
const kPinkRedishColor = Color(0xffFF486A);
const kLightRedColor = Color(0xffFEE9EC);

///Material Color
MaterialColor kPrimaryMaterialColor = const MaterialColor(
  0xff00296B,
  <int, Color>{
    50: Color(0xff5E56BF),
    100: Color(0xff5E56BF),
    200: Color(0xff5E56BF),
    300: Color(0xff5E56BF),
    400: Color(0xff5E56BF),
    500: Color(0xff5E56BF),
    600: Color(0xff5E56BF),
    700: Color(0xff5E56BF),
    800: Color(0xff5E56BF),
    900: Color(0xff5E56BF),
  },
);
