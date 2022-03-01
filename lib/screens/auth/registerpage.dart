import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/helpers/headers.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = registerpage;
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  AuthenticationAPI _authapi = AuthenticationAPI();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

 _postRegisterUser({required String phonenumber  ,  required String userName}) async {
    return await _authapi.postRegisterUser(
        context: context, phonenumber: phonenumber, userName: userName);
  }

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
                Text(
                  "Let's sign you in.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 27.0 : 32.0,
                      fontWeight: FontWeight.w900,
                      color: kTitleColor,
                      fontFamily: kQuickSandBold),
                ),
                mediumCustomSizedBox(context), 
                Text(
                  "Register to continue.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 23.0 : 28.0,
                      fontWeight: FontWeight.bold,
                      color: kTitleColor,
                      fontFamily: kQuickSandBold),
                ),
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
                        child: 
                        TextFormField(
                controller: _usernameController,
                 
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: 'User Name',
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
                     mediumCustomSizedBox(context),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: kLightLavengerGrayColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                controller: _phoneNumberController,
                 inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.number,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: 'Phone Number',
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
                          context: context, onTap: () {
                             if (_phoneNumberController.text.isEmpty || _usernameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                          customsnackErrorBar(
                              context, "Please enter your phone number and username")); 
                            } else {
                              overlayLoader(context);
                              _postRegisterUser(
                                  phonenumber: _phoneNumberController.text,
                                  userName: _usernameController.text);
                            }
                          },
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
                                color: Colors.black.withOpacity(0.9), fontFamily : kQuickSandBold , fontWeight: FontWeight.bold),
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
                          btnText: "Sign In",vertical:20,),
                      
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