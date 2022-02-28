import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/auth/login.dart';

class LoginInfo extends StatelessWidget {
  static const routeName = logininfo;
  const LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: kScreenMarginHorizontal(context),
                  vertical: 20.0,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultScreenPaddingHorizontal(context),
                  vertical: kDefaultScreenPaddingVertical(context),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/logininfo.png',
                          height: size.height * 0.4,
                          // width:size.width  ,
                        ),
                      ),
                      SizedBox(height: isMobile(context) ? 30.0 : 35.0),
                      Text(
                        'Enterprise team collaboration',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: isMobile(context) ? 27.0 : 32.0,
                            fontWeight: FontWeight.w900,
                            color: kTitleColor,
                            fontFamily: kQuickSandBold),
                      ),
                      mediumCustomSizedBox(context),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: isMobile(context) ? 15.0 : 20.0,
                            color: kDimGray,
                            fontFamily: kQuickSandBold),
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                      ),
                      Container(
                        height: isMobile(context) ? 60.0 : 80.0,
                        width: size.width,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 40.0,
                              left: isMobile(context)
                                  ? size.width - 140
                                  : size.width - 160,
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  CustomRightPageRoute(
                                      page: const LoginPage(), routeName: loginpage),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Next',
                                      style: smallTextStyle(context)
                                          .copyWith(color: kPrimaryColor),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Icon(
                                      Icons.arrow_right_alt_rounded,
                                      color: kPrimaryColor,
                                      size: isMobile(context) ? 30.0 : 40.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
