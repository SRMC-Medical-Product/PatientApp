import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/search/doctordisplay.dart';

class DynamicSearchPage extends StatefulWidget {
  static const routeName = dynamicsearch;
  final bool isOneTimePop;

  const DynamicSearchPage({Key? key,required this.isOneTimePop}) : super(key: key);

  @override
  _DynamicSearchPageState createState() => _DynamicSearchPageState();
}

class _DynamicSearchPageState extends State<DynamicSearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              mediumCustomSizedBox(context),
              Text(
                "Find your Doctors Here",
                style: ultraLargeTextStyle(context).copyWith(
                  fontFamily : kMuktaRegular
                ),
              ),
              smallCustomSizedBox(context),
              Text(
                "Start searching now",
                style: mediumLargeTextStyle(context).copyWith(
                  color : kDimGray
                  //fontFamily : kQuickSandBold
                ),
              ),
              mediumCustomSizedBox(context),
              smallCustomSizedBox(context),
              DynamicSearch(controller: _searchController, performSearch: (value){
                if(widget.isOneTimePop){
                  Navigator.of(context).pop();
                }else{
                 int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2); 
                }
              Navigator.push(context, CustomRightPageRoute(page: DoctorsDisplayPage(
                    searchType: "first",
                    searchQuery: _searchController.text.trim(),
                    ), routeName: doctordisplay));
              }),
            ],
          ),
        ),
            ],
      ),
        ),),
    );
  }
}
