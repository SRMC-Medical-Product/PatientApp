import 'package:patientapp/helpers/headers.dart';

class SearchPage extends StatefulWidget {
  static const routeName = searchpage;
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
var size = sizeMedia(context);
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
