import 'package:patientapp/helpers/headers.dart';

class MedicalRecordsPage extends StatefulWidget {
  static const routeName = medicalrecordspage;
  
  const MedicalRecordsPage({Key? key}) : super(key: key);

  @override
  _MedicalRecordsPageState createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {
  @override
  Widget build(BuildContext context) {
var size = sizeMedia(context);
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
