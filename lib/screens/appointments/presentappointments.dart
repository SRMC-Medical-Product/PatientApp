import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';
import 'package:patientapp/screens/components/customcards.dart';

class PresentAppointmentsPage extends StatefulWidget {
  const PresentAppointmentsPage({ Key? key }) : super(key: key);

  @override
  _PresentAppointmentsPageState createState() => _PresentAppointmentsPageState();
}

class _PresentAppointmentsPageState extends State<PresentAppointmentsPage> {
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
            itemCount: 1,
            itemBuilder: (BuildContext context, int i){
              return GestureDetector(
                onTap: () => Navigator.push(context,CustomRightPageRoute(page: const AppointmentsDetailsPage(), routeName: appointmentdetailspage)),
                child: Column(
                        children: [
                          customAppointmentCard(context: context,borderClr: Colors.white),
                          lineDivider(context,color: kSecondaryColor,thickness: 1.5)
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}