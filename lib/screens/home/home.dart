import 'package:flutter/cupertino.dart';
import 'package:patientapp/apis/homescreenapi.dart';
import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentcontroller.dart';
import 'package:patientapp/screens/components/appcontroller.dart';
import 'package:patientapp/screens/components/customcards.dart';
import 'package:patientapp/screens/components/searchbox.dart';
import 'package:patientapp/screens/home/notification.dart';
import 'package:patientapp/screens/search/doctordisplay.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';

class HomePage extends StatefulWidget {
  static const routeName = homepage;

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAppointment = true;
  Future? _homeScreenFuture;
  @override
  void initState() {
    super.initState();
    _homeScreenFuture = _getHomeScreenData();
  }

  _getHomeScreenData() async {
    return await HomeScreenAPI().getHomeScreen(context: context);
  }

  Future<void> _getRefreshedHomeScreenData() async {
    setState(() {
      _homeScreenFuture = _getHomeScreenData();
    });
  }

 @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    //Promotion Card Height
    double cardHeight = smallMobile(context)
        ? 160 //size.width - 150
        : largeMobile(context)
            ? 170
            : isBetweenMT2(context)
                ? 170
                : isBetweenMT1(context)
                    ? 170
                    : largeTablet(context)
                        ? 190
                        : ultraLargeTablet(context)
                            ? 200
                            : 220;

    //Promotion Card Width
    var cardWidth = smallMobile(context)
        ? size.width - 50
        : largeMobile(context)
            ? size.width - 70
            : isBetweenMT2(context)
                ? size.width - 70
                : isBetweenMT1(context)
                    ? size.width - 180
                    : largeTablet(context)
                        ? size.width - 380
                        : ultraLargeTablet(context)
                            ? size.width - 420
                            : size.width - 580;

    //Carousel Container Height
    double carouselHgt = smallMobile(context)
        ? 240
        : largeMobile(context)
            ? 250
            : isBetweenMT2(context)
                ? 250
                : isBetweenMT1(context)
                    ? 255
                    : largeTablet(context)
                        ? 270
                        : ultraLargeTablet(context)
                            ? 280
                            : 290;

    return RefreshIndicator(
      onRefresh: _getRefreshedHomeScreenData,
          color: kPrimaryColor,
    strokeWidth: 3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future : _homeScreenFuture,
          builder: (BuildContext context , AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
    
              Map<dynamic , dynamic > firstcarousel = snapshot.data['firstcarousel'];
              Map<dynamic , dynamic > lastcarousel = snapshot.data['lastcarousel'];
              Map<dynamic , dynamic > slider = snapshot.data['slider'];
              Map<dynamic , dynamic > categoryspecialist = snapshot.data['categoryspecialist'];
              Map<dynamic , dynamic > promotiondeparts = snapshot.data['promotiondeparts'];
              Map<dynamic , dynamic > upcomingappointments = snapshot.data['upcomingappointments'];
              Map<dynamic , dynamic > endcontent = snapshot.data['endcontent'];
              Map<dynamic , dynamic > userprofile = snapshot.data['user'];
              
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // top bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Top Bar with name and notification icon
                    Container(
                      height: isMobile(context) ? 90 : 120,
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: kScreenMarginHorizontal(context),
                          right: kScreenMarginHorizontal(context),
                          top: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hello", style: mediumTextStyle(context)),
                                    Text(isEmptyOrNull(userprofile['name']) ? "" : "${userprofile['name']}",
                                      style: largeTextStyle(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    CustomRightPageRoute(
                                        page: const NotificationPage(),
                                        routeName: notificationpage)),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kWhiteSmoke,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(Icons.notifications, color: kDimGray),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
    
                    //Search Bar
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile(context) ? 14 : 17,
                      ),
                      child: StaticSearch(
                        radius: 5.0,
                        onTap: () => Navigator.push(context, CustomSimplePageRoute(page: const DynamicSearchPage(),routeName: dynamicsearch)),
                        searchHint: "Search doctors and specialisation",
                      ),
                    ),
                  ],
                ),
                /*----------start promotional and ui box --------------*/
                //promotion Box
                mediumCustomSizedBox(context),
                SinglePromotionBox(
                    imgUrl: "${firstcarousel['img']}"
                    ),
                    mediumCustomSizedBox(context),
    
                /*----------end promotional and ui box --------------*/
    
                /*----------start appointments box --------------*/
                //Appointments Today
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: kDefaultScreenPaddingHorizontal(context),
                      vertical: kDefaultScreenPaddingVertical(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: rowTitleText(
                            onTap: () => Navigator.push(context, CustomSimplePageRoute(page: const AppointmentController(), routeName: appointmentcontroller)),
                              context: context,
                              isCapitalFont: true,
                              text: "Upcoming Appointments",
                              isViewAll: true)),
                      mediumCustomSizedBox(context),
    
                      ///If no appointments are available,then use this
                      upcomingappointments['isempty'] == true
                          ? Container(
                              height: 110,
                              width: size.width,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: kSecondaryColor,
                                  border: Border(
                                    left: BorderSide(width: 2, color: kPrimaryColor),
                                  )),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("No appointments for today",
                                            style: mediumLargeTextStyle(context).copyWith(color: kPrimaryColor,fontSize: isMobile(context) ? 18.0 : 21.0,)),
                                        Text("Book an appointment now",
                                            style: mediumTextStyle(context).copyWith(
                                                color: kDimGray,
                                                fontFamily: kMuktaRegular)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
    
                          ///If appointments are available,then use this
                          : customListAppointmentCard(context: context , appointment : upcomingappointments['appointments'] ),
                      mediumCustomSizedBox(context),
                    ],
                  ),
                ),
                /*----------end appointments box --------------*/
                /*----------start Our Categories Services UI Part --------------*/
                if(categoryspecialist['isempty'] == false) Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultScreenPaddingHorizontal(context),
                        vertical: kDefaultScreenPaddingVertical(context)),
                    child: rowTitleText(
                      onTap: () => Navigator.push(context, CustomSimplePageRoute(page: const AppScreenController(indexScreen: 1,), routeName: appcontroller)),
                      isCapitalFont: true,
                        context: context, text: "${categoryspecialist['title']}".toUpperCase(), isViewAll: true)),
    
                if(categoryspecialist['categories_1'].length != 0)
                  serviceSlider(isBorder: true, servicedata: categoryspecialist['categories_1']),
                
                mediumCustomSizedBox(context),
                if(categoryspecialist['categories_2'].length != 0) 
                  serviceSlider(isBorder: true, servicedata: categoryspecialist['categories_2']),
               
                /*----------end Our Our Categories Services UI Part --------------*/
    
                /*----------start slider carousel box --------------*/
                smallCustomSizedBox(context), 
                ///Slider 
                if(slider['isempty'] == false) Container(
                  width: size.width,
                  height:
                      carouselHgt, //isMobile(context) ? size.width / 3.6 : size.width / 3.2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
    
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //kSmallDivider(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultScreenPaddingHorizontal(context),
                            vertical: kDefaultScreenPaddingVertical(context)
                            ),
                        child: Text(
                            "${slider['title']}".toUpperCase(),
                            style: mediumLargeTextStyle(context).copyWith(
                                letterSpacing: 0.15,
                                fontWeight : FontWeight.bold,
                                fontFamily: kMuktaBold),
                          ),
                      ),
    
                      ///Carousel Scrolling Content
                      SizedBox(
                        height: cardHeight,
                        child: ListView.builder(
                          itemCount: slider['content'].length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            //Card
                            return Container(
                              padding: EdgeInsets.only(
                                  left: i == 0
                                      ? kDefaultScreenPaddingHorizontal(context)
                                      : 8.0,
                                  right: i == 3
                                      ? kDefaultScreenPaddingHorizontal(context)
                                      : 0.0),
                              width: cardWidth,
                              margin: EdgeInsets.symmetric(
                                  vertical: isMobile(context) ? 8 : 12,
                                  horizontal: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.network(
                                 isEmptyOrNull(slider['content'][i]['img']) 
                                 ? "https://cdn.dribbble.com/users/2367860/screenshots/16934707/media/0ae295f6cb8a218edca4a3efa46a2a7c.png?compress=1&resize=1200x900&vertical=top"
                                 : "${slider['content'][i]['img']}", 
                                 fit: BoxFit.cover,
                                  width: size.width,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      //mediumCustomSizedBox(context),
                      //kSmallDivider(context),
                    ],
                  ),
                ),
                /*----------end carousel box --------------*/
    
                /*----------start Our Prokmotional Services UI Part --------------*/ 
                if(promotiondeparts['isempty'] == false) ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: promotiondeparts['depts'].length,
                  itemBuilder: (BuildContext context, int i){
                    return (promotiondeparts['depts'][i]['departments'].length > 0) ? scrollContentsTitle(
                      title: promotiondeparts['depts'][i]['title'],
                      promotiondata: promotiondeparts['depts'][i]['departments'])
                      : Container();
                  },
                ),
               
                  /*----------end Our Prokmotional Services UI Part --------------*/
    
                /*----------start second promoitons box --------------*/
                ///Second Promotions Box
                mediumCustomSizedBox(context),
                Container(
                  width: size.width,
                  height: isMobile(context) ? size.height / 4.3 : size.height / 3.9,
                  margin: EdgeInsets.symmetric(
                      horizontal: kDefaultScreenPaddingHorizontal(context),
                      vertical: kDefaultScreenPaddingVertical(context)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                               "${lastcarousel['img']}"
                              ))),
                ),
                mediumCustomSizedBox(context),
                /*----------end second promoitons box --------------*/
    
                /*----------start end details box --------------*/
                ///End Details Box
                Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultScreenPaddingHorizontal(context),
                        vertical: kDefaultScreenPaddingVertical(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mediumCustomSizedBox(context),
                        mediumCustomSizedBox(context),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            verticialIconText(
                                text: "${endcontent['building']}", icon: FontAwesomeIcons.hospitalAlt),
                            verticialIconText(
                                text: "${endcontent['doctors']}", icon: FontAwesomeIcons.userMd),
                            verticialIconText(text: "${endcontent['patients']}", icon: Icons.person),
                          ],
                        ),
                        mediumCustomSizedBox(context),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultScreenPaddingHorizontal(context),
                              vertical: kDefaultScreenPaddingVertical(context)),
                          child: Text("${endcontent['content']}",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: mediumTextStyle(context)
                                .copyWith(color: kPrimaryColor, wordSpacing: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                /*----------end end details box --------------*/
    
                /*----------start daily updates box --------------*/
                //Daily updates
                /*
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultScreenPaddingHorizontal(context),
                        vertical: kDefaultScreenPaddingVertical(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        titleText(
                            context: context,
                            text: "Daily updates",
                            color: Colors.black.withOpacity(0.7)),
                        mediumCustomSizedBox(context),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                              height: isMobile(context) ? 120 : 140,
                              width: size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: isMobile(context) ? 100 : 120,
                                    height: isMobile(context) ? 100 : 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://cdn.dribbble.com/users/606683/screenshots/3978222/news_app_concept.png"),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: mediumCustomSizedBox(context),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "News UI designs, themes, templates and downloadable I designs, themes, templates and downloadable ",
                                          style: mediumTextStyle(context),
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                        ),
                                        smallCustomSizedBox(context),
                                        Text(
                                          '''News App UI Inspirational designs, illustrations, and graphic elements from the world’s best designers. Want more inspiration? Browse our search results... View News iOS mobile app. News''',
                                          style: smallTextStyle(context),
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    )),
                */
                /*----------end daily updates box --------------*/
              ],
            );
          }else if (snapshot.hasError) {
                      return defaultErrordialog(
                          context: context,
                          errorCode: ES_0060,
                          message: "Something went wrong.Try again Later");
                    }
                    return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Center(child: customCircularProgress()));
          }
        ),
      ),
    );
  }

  Widget verticialIconText({required String text, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        smallCustomSizedBox(context),
        Text(
          text,
          style: mediumTextStyle(context)
              .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget serviceSlider({required bool isBorder , required List servicedata}) {
    
    print("================================");
    print(servicedata);

    var size = sizeMedia(context);

    double categoriesHeight = smallMobile(context)
        ? 90
        : largeMobile(context)
            ? 90
            : isBetweenMT2(context)
                ? 90
                : isBetweenMT1(context)
                    ? 95
                    : largeTablet(context)
                        ? 110
                        : ultraLargeTablet(context)
                            ? 120
                            : 130;

    double ourServicesContainerHgt = smallMobile(context)
        ? 90
        : largeMobile(context)
            ? 90
            : isBetweenMT2(context)
                ? 90
                : isBetweenMT1(context)
                    ? 95
                    : largeTablet(context)
                        ? 110
                        : ultraLargeTablet(context)
                            ? 120
                            : 130;

    // ignore: sized_box_for_whitespace
    return Container(
      width: size.width,
      height:
          ourServicesContainerHgt, //isMobile(context) ? size.height / 3.8 : size.height / 3.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///Carousel Scrolling Content
          SizedBox(
            height: categoriesHeight,
            child: ListView.builder(
              itemCount: servicedata.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              addAutomaticKeepAlives: true,
              itemBuilder: (BuildContext context, int i) {
                //Card
                return Container(
                  width: 90,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isBorder ? kSecondaryColor : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: isMobile(context) ? 8 : 12, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      isEmptyOrNull(servicedata[i]['img']) ?
                      "https://img.icons8.com/external-flatart-icons-flat-flatarticons/344/external-medical-biochemistry-and-medicine-healthcare-flatart-icons-flat-flatarticons-1.png"
                      : servicedata[i]['img'],
                      fit: BoxFit.contain,
                      width: size.width,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget displayHomeBoxGrid(
      {required Color txtColor,
      required IconData icon,
      required Color circleClr,
      required String title,
      required String subTitle,
      required Color bgColor,
      required Function() onTap}) {
    var size = sizeMedia(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: isMobile(context) ? size.height / 4.0 : size.height / 3.2,
        margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: kDefaultScreenPaddingVertical(context)),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            border: Border.all(color: circleClr),
            color: bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CircleAvatar(
                maxRadius: isMobile(context) ? 26 : 32,
                backgroundColor: circleClr,
                child: Center(
                  child: Icon(icon,
                      color: kPrimaryColor, size: isMobile(context) ? 32 : 38),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  smallCustomSizedBox(context),
                  Text(
                    title,
                    style: smallMobile(context)
                        ? mediumTextStyle(context)
                            .copyWith(wordSpacing: 2.0, color: txtColor)
                        : largeTextStyle(context)
                            .copyWith(wordSpacing: 2.0, color: txtColor,fontSize: isMobile(context) ? 18.0 : 21.0,),
                  ),
                  Text(subTitle,
                      maxLines: 2,
                      softWrap: true,
                      style: smallMobile(context)
                          ? smallTextStyle(context)
                              .copyWith(wordSpacing: 1.0, color: txtColor)
                          : mediumTextStyle(context)
                              .copyWith(wordSpacing: 1.0, color: txtColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget scrollContentsTitle({required String title ,required List promotiondata}) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [  
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context)),
            child:
                rowTitleText(context: context, text: title, isViewAll: false,isCapitalFont:false,onTap:(){})),
        smallCustomSizedBox(context),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultScreenPaddingHorizontal(context),
          ),
          child: GridView.builder(
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
              itemCount: promotiondata.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, CustomRightPageRoute(page: const DoctorsDisplayPage(), routeName: doctordisplay)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                       isEmptyOrNull(promotiondata[i]['img']) 
                       ? CATEGORY_PROMOTIONS_IMG
                       : promotiondata[i]['img'],
                        fit: BoxFit.fill,
                        height: imgDimension,
                        width: imgDimension,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: isMobile(context) ? 4 : 7),
                        child: Text(isEmptyOrNull(promotiondata[i]['name']) ? "Specials" : promotiondata[i]['name'],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: smallTextStyle(context)),
                      ),
                    ],
                  ),
                );
              }),
        ),
        //serviceSlider(isBorder: false),
        smallCustomSizedBox(context),
      ],
    );
  }
}


/*
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: smallMobile(context)
                      ? 1
                      : largeMobile(context)
                          ? 1
                          : 4 / 3,
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
              itemCount: servicesName.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        servicesName[i]['img'],
                        fit: BoxFit.fill,
                        height: imgDimension,
                        width: imgDimension,
                      ),
                    ],
                  ),
                );
              }),
 */