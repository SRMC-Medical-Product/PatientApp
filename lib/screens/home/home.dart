import 'package:patientapp/helpers/headers.dart';

class HomePage extends StatefulWidget {

  static const routeName = homepage;

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}