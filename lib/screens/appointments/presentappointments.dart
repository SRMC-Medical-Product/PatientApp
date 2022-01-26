import 'package:patientapp/helpers/headers.dart';
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
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultScreenPaddingHorizontal(context),
            vertical: kDefaultScreenPaddingVertical(context)
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
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