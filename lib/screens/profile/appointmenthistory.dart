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
                titleText(context: context, text: "Appointment History", color: Colors.black),
                 mediumCustomSizedBox(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context,CustomRightPageRoute(page: const AppointmentsDetailsPage(), routeName: appointmentdetailspage)),
                      child: Text("appointment history")
                      //customAppointmentCard(context: context),
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
