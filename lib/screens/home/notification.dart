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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonNavbar(
            context: context, isBack: true),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
                        margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                titleText(context: context, text: "Notifications", color: Colors.black),
                 mediumCustomSizedBox(context),
                 mediumCustomSizedBox(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: i==0 ? 0 : 30),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Bruce Wayne has donated the amount of to Weekend Festival",
                                softWrap: true,style: mediumTextStyle(context).copyWith(color : Colors.black.withOpacity(0.8),),
                              ),),
                              RotatedBox(quarterTurns: 1,child: smallCustomSizedBox(context),),
                              Expanded(
                                child: Text("12 hours ago",style: smallTextStyle(context),softWrap: true,),
                              )
                            ],
                          ),
                        ),
                        mediumCustomSizedBox(context),
                        lineDivider(context,color: kSlateGray,thickness: 1),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
