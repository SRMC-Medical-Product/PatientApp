import 'package:patientapp/helpers/headers.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = profilepage;
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
var size = sizeMedia(context);
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
