import 'package:patientapp/apis/raisedissuesapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class RasisedIssues extends StatefulWidget {
  static const routeName = raisedissuespage;
  const RasisedIssues({ Key? key }) : super(key: key);

  @override
  State<RasisedIssues> createState() => _RasisedIssuesState();
}

class _RasisedIssuesState extends State<RasisedIssues> {
  
  Future? _ticketsFuture;

  final RaisedIssuesAPI _raiseticketsapi = RaisedIssuesAPI();

  @override
    void initState() {
      super.initState();
      _ticketsFuture = _getTickets();
    }    

  _getTickets() async {
    return await _raiseticketsapi.getRaisedIssues(context: context);
  } 

  Future<void> _getRefreshedData() async {
    setState(() {
      _ticketsFuture = _getTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _getRefreshedData,
        color: kPrimaryColor,
        strokeWidth: 3,
        child: Scaffold(
          appBar: commonNavbar(context: context, isBack: true),
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: _ticketsFuture,
            builder : (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                List<dynamic> _tickets = snapshot.data['tickets'];
                return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: kDefaultScreenPaddingHorizontal(context),
                            vertical: kDefaultScreenPaddingVertical(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            titleText(
                                context: context,
                                text: "Raised Tickets",
                                color: Colors.black),
                            mediumCustomSizedBox(context),
                            mediumCustomSizedBox(context),
                           snapshot.data['isempty'] == false ?ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              addAutomaticKeepAlives: true,
                              itemCount: _tickets.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Column(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                      dividerColor: Colors.transparent,
                      unselectedWidgetColor: kPrimaryColor,
                      dialogBackgroundColor: Colors.white
                ),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        onExpansionChanged: (isExpanded){
                                        
                                        },
                                        title: Container(
                                        margin:
                                            EdgeInsets.only(top: i == 0 ? 0 : 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                                    "${_tickets[i]['issues']['title']}",
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: mediumTextStyle(context)
                                                        .copyWith(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  smallCustomSizedBox(context),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${_tickets[i]['created_at']}",
                                                          style: smallTextStyle(context),
                                                          softWrap: true,
                                                        ),
                                                      ),
                                                      RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                                                      Container(
                                                        height: 5,
                                                        width: 5,
                                                        decoration: const BoxDecoration(
                                                          color: kGraycolor,
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                       RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                                                      Expanded(
                                                        child: Text(
                                                          _tickets[i]['closed'] == true ? "Closed".toUpperCase() : "Open".toUpperCase(),
                                                          style: smallTextStyle(context).copyWith(
                                                            color: _tickets[i]['closed'] == true ? Colors.black : kGreenColor,
                                                          ),
                                                          softWrap: true,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        children: <Widget>[
                                          ListTile(
                                            title:  Text(
                                                    "${_tickets[i]['issues']['description']}",
                                                    softWrap: true,
                                                    style: mediumTextStyle(context)
                                                        .copyWith(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                    mediumCustomSizedBox(context),
                                    lineDivider(context,
                                        color: kSlateGray, thickness: 1),
                                  ],
                                );
                              },
                            ) : isNullIcon( context: context, icon: Icons.notifications_off_outlined, text: 'No tickets raised'),
                          ],
                        ),
                      )
          );
              }else if (snapshot.hasError) {
                      return defaultErrordialog(
                          context: context,
                          errorCode: ES_0060,
                          message: "Something went wrong.Try again Later");
                    }
                    return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Center(child: customCircularProgress()));
           
            }
          ),
        ),
      ),
    );
  }
}