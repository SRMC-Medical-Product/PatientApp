/*---------------- Custom Widgets which is common for whole app -------------------*/

import 'package:patientapp/helpers/headers.dart';

/* ------------------------ INR Symbols -------------------------*/
// ignore: constant_identifier_names
const String INRSymbol = "\u{20B9}";

/* ---------------MediaQuery--------------------------------*/
sizeMedia(BuildContext context) {
  return MediaQuery.of(context).size;
}

/* ---------------Default Padding and Margin--------------------------------*/
const kDefaultPadding = 30.0;

/* ---------------Default Screen Margin--------------------------------*/
//Used in Authentication Pages
kScreenMarginHorizontal(context) {
  return isMobile(context) ? kDefaultPadding - 15.0 : kDefaultPadding * 1.5;
}

/* ---------------Default Screen Padding--------------------------------*/
//Used in Main Screen Pages
kDefaultScreenPaddingHorizontal(context) {
  return isMobile(context) ? 14.0 : 17.0;
}

kDefaultScreenPaddingVertical(context) {
  return isMobile(context) ? 10.0 : 14.0;
}

screenPads(context) {
  return EdgeInsets.symmetric(
      horizontal: kDefaultScreenPaddingHorizontal(context),
      vertical: kDefaultScreenPaddingVertical(context));
}

/* -------------- Text Style --------------*/
ultraProLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 26.0 : 29.0,
  );
}

ultraLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 24.0 : 27.0,
  );
}

largeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    height: 1.2,
    fontSize: isMobile(context) ? 23.0 : 25.0,
  );
}

mediumLargeTextStyle(context) {
  return TextStyle(
    fontFamily: kMuktaRegular,
    fontSize: isMobile(context) ? 17.0 : 19.0,
    color: kBlackTextColor,
  );
}

mediumTextStyle(context) {
  return TextStyle(
    fontFamily: kMuktaRegular,
    fontSize: isMobile(context) ? 15.0 : 17.0,
    color: kBlackTextColor,
  );
}

smallTextStyle(context) {
  return TextStyle(
      fontFamily: kQuickSandRegular,
      fontSize: isMobile(context) ? 13.0 : 15.0,
      color: kGraycolor);
}

/* ---------------Custom Divider Gray Box--------------------------------*/
kLargeDivider(context,{Color? dividerClr}) {
  return Container(
      decoration: BoxDecoration(color: dividerClr ?? kLavenderGrayColor),
      height: isMobile(context) ? 11.0 : 13.0);
}

kMediumDivider(context,{Color? dividerClr}) {
  return Container(
      decoration: BoxDecoration(color: dividerClr ?? kLavenderGrayColor),
      height: isMobile(context) ? 6.0 : 9.0);
}

kSmallDivider(context, {Color? lineColor}) {
  return Container(
      decoration: BoxDecoration(color: lineColor ?? kLavenderGrayColor),
      height: isMobile(context) ? 1.5 : 3.0);
}

/* ---------------Custom Line Divider--------------------------------*/
lineDivider(context, {double? thickness, Color? color}) {
  return Divider(
    color: color ?? kLavenderGrayColor,
    thickness: thickness ?? (isMobile(context) ? 0.1 : 0.25),
    endIndent: 2.0,
    indent: 2.0,
    height: 1.0,
  );
}

/* ---------------Custom Sized Box Divider--------------------------------*/
Widget mediumCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 15.0 : 22.0);
}

Widget smallCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 6.0 : 9.0);
}

/* ---------------To check if the value is null or empty--------------------------------*/
isEmptyOrNull(var x) {
  if ((x.toString().isEmpty) || (x == null)) {
    return true;
  } else {
    return false;
  }
}

/* ---------------Single Promotions Box-------------------------------*/
class SinglePromotionBox extends StatelessWidget {
  final String imgUrl;
  const SinglePromotionBox({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return Container(
      width: size.width,
      height: isMobile(context) ? size.height / 4 : size.height / 3.5,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),
          vertical: kDefaultScreenPaddingVertical(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imgUrl))),
    );
  }
}

/* -------------------Text Highlighter----------------------------*/
Widget titleText(
    {required BuildContext context,
    required String text,
    required Color color}) {
  return Text(text,
      softWrap: true, style: mediumLargeTextStyle(context).copyWith(color: color,fontSize: isMobile(context) ? 18.0 : 21.0,));
}

Widget mediumTitleText({required BuildContext context, required String text, required Color color}) {
  return Text(text,
      softWrap: true, style: mediumTextStyle(context).copyWith(color: color,fontSize: isMobile(context) ? 18.0 : 21.0,));
}

/*------------------Title Text with View all Btn-------------------*/
Widget rowTitleText({required BuildContext context, required String text,required bool isViewAll,required bool isCapitalFont }) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 3,
        child: isCapitalFont == true ? Text(
                      text.toUpperCase(),
                      style: mediumLargeTextStyle(context).copyWith(
                          letterSpacing: 0.15,
                          fontWeight : FontWeight.bold,
                          color: Colors.black.withOpacity(0.9),
                          fontFamily: kMuktaBold),
                    ): titleText( context: context, text: text, color: Colors.black.withOpacity(0.7)),
      ),
      if(isViewAll==true) Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "View all",
            style: mediumTextStyle(context).copyWith(color: kOrangeColor),
          ),
        ),
      )
    ],
  );
}

/* ------------------ Bottom Dialog Pop Up --------------------------------*/
/// This Widgets pops up from bottom with contents inside
Future bottomDialog({required context,double? height,required Widget widget}){
  var size = sizeMedia(context);
  return showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 100),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Scaffold(
          backgroundColor:  Colors.black.withOpacity(0.1), 
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height ?? 200,
              width: size.width,
              child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      padding:
                                          const EdgeInsets.only(top: 8, right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(
                                              Icons.cancel,
                                              color: kPrimaryColor,
                                              size: 22,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: widget
                                    )
                                  ],
                                ),
                              ],
                            ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
}


/*-------------------------Doctor Tile Content------------------------------*/
  Widget doctorTileContent(
      {required BuildContext context,
      required IconData icon,
      required String title,
      required Color bgColor,
      required Color iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: isMobile(context) ? 20 : 25,
          width: isMobile(context) ? 20 : 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Icon(
            icon,
            color: iconColor,
            size: 14,
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: smallCustomSizedBox(context),
        ),
        Text(title,
            style: smallTextStyle(context).copyWith(fontFamily: kMuktaBold)),
      ],
    );
  }


/* -------------- Horizontal Scroll -----------------------*/
class FixedTabSwitcher extends StatefulWidget {

final List<dynamic> dateSlots;
final List<dynamic> services;

///Expanded Necessary or Not
final bool isExpanded;

  const FixedTabSwitcher({Key? key,required this.isExpanded,required this.dateSlots,required this.services}) : super(key: key);

  @override
  _FixedTabSwitcherState createState() => _FixedTabSwitcherState();
}

class _FixedTabSwitcherState extends State<FixedTabSwitcher> {

  int _currentIndex = 0;

//This is invoked when user taps on names in bar 
void onTappedBar(int value) {
   setState(() {
     _currentIndex = value;
   });
 }

    int _morningChoiceIndex= 0;
    List<String> morningList = ['01:00 A.M','02:00 A.M','03:00 A.M','09:00 A.M','10:00 A.M'];

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ 
            Container(
              height: 80.0,
              width: size.width,
               color: kWhiteSmoke,
              padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                itemCount: widget.dateSlots.length,
                itemBuilder: (BuildContext context, int i){
                    return   GestureDetector(
                     onTap:  () {
                      onTappedBar(i);
                     },
                     child: Container(
                       width: 40,
                       margin: EdgeInsets.all(7.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(widget.dateSlots[i],style: mediumTextStyle(context).copyWith(
                             color: _currentIndex == i ? kPrimaryColor : kPrimaryColor),),
                           Container(
                             height: 35,
                             width: 35,
                             decoration: BoxDecoration(
                               color: _currentIndex == i ? kPrimaryColor : Colors.white,
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color:_currentIndex == i ? kPrimaryColor : kSlateGray),
                       ),
                             child: Center(child: Text("24",style: mediumTextStyle(context).copyWith(
                               color : _currentIndex == i ? Colors.white : kPrimaryColor,
                               fontFamily : kMuktaBold)))),
                         ],
                       ) 
                     ));
                }),
            ),
            kLargeDivider(context, dividerClr: kWhiteSmoke), 
            SlotChoiceChips(defaultChoiceIndex: _morningChoiceIndex, choicesList: morningList, title: "Morning"),
            SlotChoiceChips(defaultChoiceIndex: _morningChoiceIndex, choicesList: morningList, title: "Afternoon"),
            SlotChoiceChips(defaultChoiceIndex: _morningChoiceIndex, choicesList: morningList, title: "Night"),
            mediumCustomSizedBox(context),
            smallCustomSizedBox(context),

          ],
        ),
    );
    
  }
}

/* ------------------ Choice Chips ------------------ */
class SlotChoiceChips extends StatefulWidget {
  int defaultChoiceIndex;
  final List<dynamic> choicesList;
  final String title;
  SlotChoiceChips({ Key? key ,required this.defaultChoiceIndex,required this.choicesList,required this.title}) : super(key: key);

  @override
  _SlotChoiceChipsState createState() => _SlotChoiceChipsState();
}

class _SlotChoiceChipsState extends State<SlotChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return  Container(
             padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                    mediumCustomSizedBox(context),
                    smallCustomSizedBox(context),
                    Text(widget.title,style: mediumTextStyle(context)),
                    mediumCustomSizedBox(context),
          Wrap(
            spacing:  8,
            runSpacing: 10,
      children: List.generate(widget.choicesList.length, (index) {
        return ChoiceChip(
          labelPadding: EdgeInsets.all(2.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color:  kSlateGray ,width: 0.5)
          ),
          pressElevation: 0,
          label: Text(
            widget.choicesList[index],
            style: smallTextStyle(context).copyWith(color : kDimGray, fontFamily: kMuktaRegular)
          ),
          selected: widget.defaultChoiceIndex == index,
          selectedColor:Colors.white,
          onSelected: (val) {
            print(widget.choicesList[index]);
            setState(() {
              widget.defaultChoiceIndex = val ? index : widget.defaultChoiceIndex;
            });
          },
          backgroundColor: Colors.white, 
          elevation: 0,
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultScreenPaddingHorizontal(context)),
        );
      }),
    )                

               ],
             ),
           );
  }
}


/* --------------Editable Text Field Custom ------------*/
  Widget personalInfoDynamicTitle(
      {
      required BuildContext context,  
      required String title,
      required String hintTextField,
      required TextEditingController controller,
      required TextInputType textInputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        mediumCustomSizedBox(context),
        Text(
          title,
          style: mediumTextStyle(context).copyWith(letterSpacing: 0.2),
        ),
        smallCustomSizedBox(context),
        Container(
          height: 45,
          decoration: BoxDecoration(
                       color: kLightLavengerGrayColor,
           // border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: kBlackTextColor, fontSize: 17),
            keyboardType: textInputType,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: hintTextField,
              hintStyle: mediumTextStyle(context).copyWith(color: kDarkGray),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            ),
          ),
        )
      ],
    );
  }
