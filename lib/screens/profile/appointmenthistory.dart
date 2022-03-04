import 'package:patientapp/apis/appointmentsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';
import 'package:patientapp/screens/components/customcards.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AppointmentHistoryPage extends StatefulWidget {
  static const routeName = appointmenthistorypage;
  const AppointmentHistoryPage({Key? key}) : super(key: key);

  @override
  _AppointmentHistoryPageState createState() => _AppointmentHistoryPageState();
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
 
  Future? _appointmentsFuture;
 
  @override
  void initState() {
    super.initState();
    _appointmentsFuture = getAppointments();
  }

  getAppointments() async {
    return AppointmentsAPI().getHistoryAppointments(context: context);
  }

  Future<void> _getRefreshScreen() async {
    setState(() {
      _appointmentsFuture = getAppointments();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _getRefreshScreen,
        color: kPrimaryColor,
        strokeWidth: 3,
        child: Scaffold(
          appBar: commonNavbar(
              context: context, isBack: true),
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: _appointmentsFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                  List<dynamic> historyappointments = snapshot.data['appointments'];
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
                  titleText(context: context, text: "Appointment History", color: Colors.black),
                   mediumCustomSizedBox(context),
                  snapshot.data['isempty'] != true ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    itemCount: historyappointments.length,
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(context,CustomRightPageRoute(page: AppointmentsDetailsPage(appointmentId: "${historyappointments[i]['id']}",), routeName: appointmentdetailspage)),
                        child: customAppointmentCard(
                          context: context,
                          appointmentId: historyappointments[i]['id'].toString(),
                          appointmentDate: historyappointments[i]['date'].toString(),
                          appointmentTime: historyappointments[i]['time'].toString(),
                          doctorImg: historyappointments[i]['img'].toString(),
                          doctorName: historyappointments[i]['name'].toString(),
                          doctorSpec: historyappointments[i]['specialisation'].toString(),
                          ),
                      );
                    },
                  ) : isNullIcon( context: context, icon: Icons.notifications_off_outlined, text: 'No history appointments' ),
                ],
              ),
            ),
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
            },
          )
        
        ),
      ),
    );
  }
}
