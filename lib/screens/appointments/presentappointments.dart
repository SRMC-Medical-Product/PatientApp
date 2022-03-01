import 'package:patientapp/apis/appointmentsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';
import 'package:patientapp/screens/components/customcards.dart';

class PresentAppointmentsPage extends StatefulWidget {
  const PresentAppointmentsPage({ Key? key }) : super(key: key);

  @override
  _PresentAppointmentsPageState createState() => _PresentAppointmentsPageState();
}

class _PresentAppointmentsPageState extends State<PresentAppointmentsPage> {
  Future? _appointmentPresentFuture;

  final AppointmentsAPI _appointmentsAPI = AppointmentsAPI();

  @override
  void initState() {
    super.initState();
    _appointmentPresentFuture = fetchAppointmentPresent();
  }

  fetchAppointmentPresent()async{
    //queryId = 1 : Live Appointments for today
    return await _appointmentsAPI.getPendingAppointments(context: context, queryId: "1");
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultScreenPaddingHorizontal(context),
            vertical: kDefaultScreenPaddingVertical(context)
          ),
          child: FutureBuilder(
            future: _appointmentPresentFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                Map<dynamic, dynamic> liveappointments = snapshot.data;
                return liveappointments['isempty'] == false ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: liveappointments['appointments'].length,
            itemBuilder: (BuildContext context, int i){
              return GestureDetector(
                      onTap: () => Navigator.push(context,CustomRightPageRoute(page: const AppointmentsDetailsPage(), routeName: appointmentdetailspage)),
                      child:customAppointmentCard(
                        context: context,
                        appointmentDate: liveappointments['appointments'][i]['date'].toString(),
                        appointmentTime: liveappointments['appointments'][i]['time'].toString(),
                        doctorImg: liveappointments['appointments'][i]['img'].toString(),
                        doctorName: liveappointments['appointments'][i]['name'].toString(),
                        doctorSpec: liveappointments['appointments'][i]['specialisation'].toString(),
                        ),
                    );
            },
          ) : isNullIcon( context: context, icon: Icons.notifications_off_outlined, text: 'No appointments for today' );
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