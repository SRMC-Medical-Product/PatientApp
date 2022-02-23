import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/auth/otppage.dart';
import 'package:patientapp/screens/auth/registerpage.dart';
import 'package:patientapp/screens/components/navbar.dart';

class LoginPage extends StatefulWidget {
  static const routeName = loginpage;
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: screenPads(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumCustomSizedBox(context), 
                Text(
                  "Let's sign you up.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 27.0 : 32.0,
                      fontWeight: FontWeight.w900,
                      color: kTitleColor,
                      fontFamily: kQuickSandBold),
                ),
                mediumCustomSizedBox(context),
                Text(
                  "Welcome Back.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 23.0 : 28.0,
                      fontWeight: FontWeight.bold,
                      color: kTitleColor,
                      fontFamily: kQuickSandBold),
                ),
                smallCustomSizedBox(context),
                Text(
                  "You've have been missed",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 23.0 : 28.0,
                      fontWeight: FontWeight.bold,
                      color: kTitleColor,
                      fontFamily: kQuickSandBold),
                ),
                SizedBox(
                  height: isMobile(context) ? 35.0 : 40.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: kLightLavengerGrayColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: 
                      TextFormField(
                controller: _phoneNumberController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.number,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(
                    color: kGraycolor,
                    fontSize: 13.0,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kGraycolor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: kGraycolor),
                  ),
                ), 
                ),    
                    ),
                    primaryBtn(
                       isOutline: false,btnColor: kPrimaryColor,
                        context: context, onTap: () => Navigator.push(context,CustomRightPageRoute(page: const OtpPage(), routeName: otppage)), 
                        btnText: "Get OTP",vertical:20,),
                    mediumCustomSizedBox(context),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child : lineDivider(context,color: kSlateGray,thickness: 0.9),
                        ),
                        RotatedBox(quarterTurns: 1,child : smallCustomSizedBox(context)),
                        Text(
                          "Or",
                          style: mediumTextStyle(context).copyWith(
                              color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold , fontFamily : kQuickSandBold),
                        ),
                        RotatedBox(quarterTurns: 1,child : smallCustomSizedBox(context)),
                        Expanded(
                          child : lineDivider(context,color: kSlateGray,thickness: 0.9),
                        ),
                      ]
                    ),
                    mediumCustomSizedBox(context),
                  primaryBtn(
                    isOutline: true,btnColor: kPrimaryColor,
                        context: context, onTap: () => Navigator.push(context,CustomRightPageRoute(page: const RegisterPage(), routeName: registerpage)), 
                        btnText: "Sign Up",vertical:20,),
                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
