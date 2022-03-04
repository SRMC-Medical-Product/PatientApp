import 'package:patientapp/apis/searchscreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';

class SearchPage extends StatefulWidget {
  static const routeName = searchpage;
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  Future? _searchFuture;

  bool isAllCategory = false;

  final SearchAPI _searchAPI = SearchAPI();

  @override
  void initState() {
    super.initState();
    _searchFuture = _fetchAllCategories();
  }

  _fetchAllCategories() async {
    return await _searchAPI.getAllCategories(context: context); 
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
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
            future: _searchFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                Map<dynamic , dynamic > departments = snapshot.data['departments'];
                Map<dynamic , dynamic > specialist = snapshot.data['specialist'];
                return Column(
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
                  onTap: () {} , //=> Navigator.push(context, CustomSimplePageRoute(page: const DynamicSearchPage(),routeName: dynamicsearch)),
                ),
              ),
              mediumCustomSizedBox(context),
              mediumCustomSizedBox(context),
              /*-------end of search bar -------*/

              /*-------start of all specialisations -------*/
              if(departments['isempty'] == false) Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mediumTitleText(
                        context: context,
                        text: "${departments['title']}",
                        color: Colors.black),
                    mediumCustomSizedBox(context),

                    //All Specialisations
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                        itemCount:  departments['content'].length > 8
                            ? (isAllCategory
                                ? departments['content'].length //Full length of the list
                                : (isMobile(context) ? 8 : 12))
                            : departments['content'].length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  isEmptyOrNull(departments['content'][i]['img']) ? CATEGORY_DEFAULT_IMAGE : "${departments['content'][i]['img']}",
                                  fit: BoxFit.fill,
                                  height: imgDimension,
                                  width: imgDimension,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: isMobile(context) ? 4 : 7),
                                  child: Text(
                                      isEmptyOrNull(departments['content'][i]['name']) ? "Specials" :  "${departments['content'][i]['name']}",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: smallTextStyle(context)),
                                ),
                              ],
                            ),
                          );
                        }),

                    mediumCustomSizedBox(context),
                    mediumCustomSizedBox(context),
                    //See all Specialistion Button
                    if (departments['content'].length  > 8)
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
              if(specialist['isempty'] == false) Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mediumTitleText(
                        context: context,
                        text: "${specialist['title']}",
                        color: Colors.black),
                    mediumCustomSizedBox(context),

                    //All Specialisations
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                        itemCount: specialist['content'].length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  isEmptyOrNull(specialist['content'][i]['img']) ? DEPT_DEFAULT_IMG : "${specialist['content'][i]['img']}",
                                  fit: BoxFit.fill,
                                  height: imgDimension,
                                  width: imgDimension,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: isMobile(context) ? 4 : 7),
                                  child: Text(
                                    isEmptyOrNull(specialist['content'][i]['name']) ? DEPT_DEFAULT_IMG : "${specialist['content'][i]['name']}",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: smallTextStyle(context)),
                                ),
                              ],
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
          );
              } else if (snapshot.hasError) {
                    return defaultErrordialog(
                        context: context,
                        errorCode: ES_0060,
                        message: "Something went wrong.Try again Later");
                  }
                  return SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Center(child: customCircularProgress()));             
            },
          )
        ),
      ),
    );
  }
}
