import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';
import 'package:patientapp/screens/components/customcards.dart';

class FutureAppointments extends StatefulWidget {
  const FutureAppointments({ Key? key }) : super(key: key);

  @override
  _FutureAppointmentsState createState() => _FutureAppointmentsState();
}

class _FutureAppointmentsState extends State<FutureAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultScreenPaddingHorizontal(context),
            vertical: kDefaultScreenPaddingVertical(context)
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int i){
              return GestureDetector(
                      onTap: () => Navigator.push(context,CustomRightPageRoute(page: const AppointmentsDetailsPage(), routeName: appointmentdetailspage)),
                      child:customAppointmentCard(context: context),
                    ); 
            },
          ),
        ),
      ),
    );
  }
}