import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class MedicalFilesPage extends StatefulWidget {
  static const routeName = medicalfilespage;
  const MedicalFilesPage({ Key? key }) : super(key: key);

  @override
  _MedicalFilesPageState createState() => _MedicalFilesPageState();
}

class _MedicalFilesPageState extends State<MedicalFilesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonNavbar(context: context, isBack: true),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: screenPads(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}