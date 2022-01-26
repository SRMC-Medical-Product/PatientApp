import 'package:patientapp/helpers/headers.dart';
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
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultScreenPaddingHorizontal(context),
            vertical: kDefaultScreenPaddingVertical(context)
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int i){
              return Column(
                      children: [
                        customAppointmentCard(context: context,borderClr: Colors.white),
                        lineDivider(context,color: kSecondaryColor,thickness: 1.5)
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}