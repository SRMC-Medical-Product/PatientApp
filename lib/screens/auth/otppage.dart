import 'dart:async';

import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class OtpPage extends StatefulWidget {
  static const routeName = otppage;
  const OtpPage({ Key? key }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int start = 30;
  bool wait = false;

  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: screenPads(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumCustomSizedBox(context),
                mediumCustomSizedBox(context),
                Text(
                  "Enter your Received OTP",
                  style: largeTextStyle(context).copyWith(
                      letterSpacing: 0.2, fontWeight: FontWeight.bold),
                ),
                mediumCustomSizedBox(context),
                 Text(
                      "Lorem Ipusm Lorem Ipusm",
                      style: smallTextStyle(context).copyWith(
                          height: 1.2,
                          color: kGraycolor,
                          fontFamily: kMuktaRegular)),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: kLightLavengerGrayColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: _otpController,
                          style: largeTextStyle(context),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "6 Digit OTP",
                            hintStyle: mediumTextStyle(context)
                                .copyWith(color: kDarkGray),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Resend OTP ?",
                              style: mediumTextStyle(context).copyWith(color:kDimGray,letterSpacing : 0.3),
                            ),
                            RotatedBox(quarterTurns: 1,child : smallCustomSizedBox(context)),
                //             onTap: wait
                // ? null
                // : () async {
                //     setState(() {
                //       start = 30;
                //       wait = true;
                //       buttonName = "Resend";
                //     });
                //   },
                  if(wait == true) Text(
                              "00:$start",
                              style: mediumTextStyle(context).copyWith(color:kPrimaryColor,letterSpacing : 0.3,fontFamily:kMuktaBold),
                            ),  
            if(wait == false) GestureDetector(
              onTap : () async {
                    setState(() {
                      start = 30;
                      wait = true;
                      //buttonName = "Resend";
                    });
                    startTimer();
                  },
              child: Text(
                                "Resend",
                                style: mediumTextStyle(context).copyWith(color:kPrimaryColor,letterSpacing : 0.3,fontFamily:kMuktaBold),
                              ),
            ),  
                                    ],
                        ),
                      ),
                      mediumCustomSizedBox(context),
                   primaryBtn(
                         isOutline: true,btnColor: kPrimaryColor,
                          context: context, onTap: () {}, btnText: "Get Started".toUpperCase(),vertical:20,),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
    void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

}