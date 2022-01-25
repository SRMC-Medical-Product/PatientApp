import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class UpcomingAppointments extends StatefulWidget {
  static const routeName = upcomingappointmentspage;
  const UpcomingAppointments({ Key? key }) : super(key: key);

  @override
  _UpcomingAppointmentsState createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true)
      ),
    );
  }
}