import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';

class SearchPage extends StatefulWidget {
  static const routeName = searchpage;
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isAllCategory = false;
  //For TEsting
  int categoriesLength = 16;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);

    var imgDimension = smallMobile(context)
        ? size.width / 8
        : largeMobile(context)
            ? size.width / 9
            : isBetweenMT2(context)
                ? size.width / 11
                : isBetweenMT1(context)
                    ? size.width / 13
                    : isBetweenTD2(context)
                        ? size.width / 15
                        : size.width / 16;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*-------start of search bar -------*/
              mediumCustomSizedBox(context),
              mediumCustomSizedBox(context),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile(context) ? 14 : 17,
                ),
                child: StaticSearch(
                  radius: 5.0,
                  searchHint: "Search doctors and specialisation",
                  onTap: () => Navigator.push(context, CustomSimplePageRoute(page: DynamicSearchPage(),routeName: dynamicsearch)),
                ),
              ),
              mediumCustomSizedBox(context),
              mediumCustomSizedBox(context),
              /*-------end of search bar -------*/

              /*-------start of all specialisations -------*/
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mediumTitleText(
                        context: context,
                        text: "Know your specialitist",
                        color: Colors.black),
                    mediumCustomSizedBox(context),

                    //All Specialisations
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: smallMobile(context)
                                ? 0.8
                                : largeMobile(context)
                                    ? 0.9
                                    : 3.3 / 3,
                            crossAxisCount: smallMobile(context)
                                ? 4
                                : largeMobile(context)
                                    ? 4
                                    : isBetweenMT2(context)
                                        ? 4
                                        : isBetweenMT1(context)
                                            ? 5
                                            : 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount:  categoriesLength > 8
                            ? (isAllCategory
                                ? categoriesLength //Full length of the list
                                : (isMobile(context) ? 8 : 12))
                            : categoriesLength,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "https://cdn1.iconfinder.com/data/icons/medical-specialties-2-3/380/Pediatrics-512.png",
                                    fit: BoxFit.fill,
                                    height: imgDimension,
                                    width: imgDimension,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: isMobile(context) ? 4 : 7),
                                    child: Text(
                                        "Child care",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: smallTextStyle(context)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                    mediumCustomSizedBox(context),
                    mediumCustomSizedBox(context),
                    //See all Specialistion Button
                    if (categoriesLength > 8)
                    GestureDetector(
                      onTap: () => setState(() {
                        isAllCategory = !isAllCategory;
                      }),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          //color: kWhiteSmoke
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Center(
                          child: Text(
                            isAllCategory ? "See less" : "See all",
                            style: mediumTextStyle(context),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /*-------End of all specialisations -------*/

              mediumCustomSizedBox(context),
              mediumCustomSizedBox(context),

              /*-------start of all specialisations -------*/
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mediumTitleText(
                        context: context,
                        text: "Search by specialist",
                        color: Colors.black),
                    mediumCustomSizedBox(context),

                    //All Specialisations
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: smallMobile(context)
                                ? 0.8
                                : largeMobile(context)
                                    ? 0.9
                                    : 3.3 / 3,
                            crossAxisCount: smallMobile(context)
                                ? 4
                                : largeMobile(context)
                                    ? 4
                                    : isBetweenMT2(context)
                                        ? 4
                                        : isBetweenMT1(context)
                                            ? 5
                                            : 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "https://image.flaticon.com/icons/png/512/387/387577.png",
                                    fit: BoxFit.fill,
                                    height: imgDimension,
                                    width: imgDimension,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: isMobile(context) ? 4 : 7),
                                    child: Text("Cardiologist",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: smallTextStyle(context)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                    mediumCustomSizedBox(context),
                    mediumCustomSizedBox(context),

                  ],
                ),
              )
              /*-------End of all specialisations -------*/
            ],
          ),
        ),
      ),
    );
  }
}
