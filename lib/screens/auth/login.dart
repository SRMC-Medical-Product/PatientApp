import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';

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
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                mediumCustomSizedBox(context),
                Text(
                  "Login Now",
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
                          controller: _phoneNumberController,
                          style: largeTextStyle(context),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: mediumTextStyle(context)
                                .copyWith(color: kDarkGray),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                          ),
                        ),
                      ),
                      primaryBtn(
                         isOutline: false,
                          context: context, onTap: () {}, btnText: "Get OTP".toUpperCase(),vertical:20,),
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
                            "OR",
                            style: mediumTextStyle(context).copyWith(
                                color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
                          ),
                          RotatedBox(quarterTurns: 1,child : smallCustomSizedBox(context)),
                          Expanded(
                            child : lineDivider(context,color: kSlateGray,thickness: 0.9),
                          ),
                        ]
                      ),
                      mediumCustomSizedBox(context),
                    primaryBtn(
                      isOutline: true,
                          context: context, onTap: () {}, btnText: "Sign Up".toUpperCase(),vertical:20,),
                      
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
}
