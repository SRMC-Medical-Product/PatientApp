import 'package:patientapp/apis/notificationscreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = notificationpage;
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    notificationFuture = _receiveNotification();
  }

  _receiveNotification() async {
    return await NotificationScreenAPI().getNotifications(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        appBar: commonNavbar(context: context, isBack: true),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
              future: notificationFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> messages = snapshot.data['msgs'];
                  if (snapshot.data['isempty'] == true) {
                    return isNullIcon( context: context, icon: Icons.notifications_off_outlined, text: 'No notifications');
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: kDefaultScreenPaddingHorizontal(context),
                          vertical: kDefaultScreenPaddingVertical(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          titleText(
                              context: context,
                              text: "Notifications",
                              color: Colors.black),
                          mediumCustomSizedBox(context),
                          mediumCustomSizedBox(context),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            addAutomaticKeepAlives: true,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: i == 0 ? 0 : 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          child: Icon(
                                              messages[i]['seen'] == true
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .notifications_active_outlined,
                                              color: messages[i]['seen'] == true
                                                  ? kSteelBlue
                                                  : kPinkRedishColor,
                                              size: 20.0),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: smallCustomSizedBox(context),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${messages[i]['message']}",
                                                softWrap: true,
                                                maxLines: 3,
                                                style: mediumTextStyle(context)
                                                    .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                              smallCustomSizedBox(context),
                                              Text(
                                                "${messages[i]['timestamp']}",
                                                style: smallTextStyle(context),
                                                softWrap: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  mediumCustomSizedBox(context),
                                  lineDivider(context,
                                      color: kSlateGray, thickness: 1),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return defaultErrordialog(
                      context: context,
                      errorCode: ES_0060,
                      message: "Something went wrong.Try again Later");
                }
                return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Center(child: customCircularProgress()));
              }),
        ),
      ),
    );
  }

}
