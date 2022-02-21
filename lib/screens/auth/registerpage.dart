import 'package:patientapp/helpers/headers.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = registerpage;
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                  "Sign Up ",
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
                  margin: const EdgeInsets.only(top: 60),
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
                          controller: _usernameController,
                          style: largeTextStyle(context),
                          keyboardType: TextInputType.text,
                          
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: mediumTextStyle(context)
                                .copyWith(color: kDarkGray),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                          ),
                        ),
                      ),
                     mediumCustomSizedBox(context),
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
                         isOutline: false,btnColor: kPrimaryColor,
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
                      isOutline: true,btnColor: kPrimaryColor,
                          context: context, onTap: () => Navigator.pop(context),
                          btnText: "Sign In".toUpperCase(),vertical:20,),
                      
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