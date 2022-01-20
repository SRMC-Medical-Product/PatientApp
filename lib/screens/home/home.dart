import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/searchbox.dart';

class HomePage extends StatefulWidget {

  static const routeName = homepage;

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAppointment = true;
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SingleChildScrollView(
     physics: const BouncingScrollPhysics(),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         //Top Bar with name and notification icon
         Container(
           height: isMobile(context) ? 100 : 130,
            width: size.width,
            padding: EdgeInsets.only(left:kScreenMarginHorizontal(context),right:kScreenMarginHorizontal(context),top:10,bottom:10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex : 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello",style : largeTextStyle(context).copyWith(fontFamily:kMuktaRegular)),
                          Text("Loga Subramani",
                          style : ultraLargeTextStyle(context).copyWith(color:Colors.black.withOpacity(0.7)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,

                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color:  kWhiteSmoke,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.notifications,color:kDimGray),
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
              vertical: isMobile(context) ? 10 : 14),
          child: const StaticSearch(
            radius: 5.0,
            searchHint: "Search here",
          ),
        ),

        //promotion Box
        mediumCustomSizedBox(context),
        const SinglePromotionBox(imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"),
        mediumCustomSizedBox(context),
        
        //Services
        // GridView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         childAspectRatio: 1,
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 5,
        //         mainAxisSpacing: 5),
        //     itemCount: 2,
        //     itemBuilder: (BuildContext context, int i) {
        //       return displayHomeBoxGrid(
        //         txtColor : Colors.black,
        //         icon: Icons.add,
        //         circleClr: kSecondaryColor,
        //         title: "Book Now", 
        //         subTitle: "View appointments", 
        //         bgColor: Colors.white, 
        //         onTap: (){});
        //     }),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: displayHomeBoxGrid(
                txtColor : Colors.black,
                icon: Icons.add,
                circleClr: kSecondaryColor,
                title: "Book Now", 
                subTitle: "Make appointments", 
                bgColor: Colors.white, 
                onTap: (){})
            ),
            Expanded(
              child: displayHomeBoxGrid(
                txtColor : Colors.white,
                icon: Icons.medical_services_outlined,
                circleClr: Colors.white,
                title: "Visit In", 
                subTitle: "View appointments", 
                bgColor: kPrimaryColor, 
                onTap: (){})
            ),
            
           ],
        ),

        mediumCustomSizedBox(context),
        //Appointments Today
        Container(
          margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),
          vertical: kDefaultScreenPaddingVertical(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Today's appointment",style:largeTextStyle(context).copyWith(color:Colors.black.withOpacity(0.7))),
              mediumCustomSizedBox(context),

              ///If no appointments are available,then use this
             isAppointment == false ? Container(
                height: 110,
                width: size.width,
                padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  border: Border(
                    left: BorderSide(width: 2,color: kPrimaryColor),
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("No appointments for today",style:largeTextStyle(context).copyWith(color: kPrimaryColor)),
                          Text("Book an appointment now",style:mediumTextStyle(context).copyWith(color: kDimGray,fontFamily:kMuktaRegular)),
                        ],
                      ),
                      ),
                    
                  ],
                ),
              )
              ///If appointments are available,then use this
              :  Container(
                height: isMobile(context) ? 140 : 180,
                width: size.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color:kSecondaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: isMobile(context) ? 50 : 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: isMobile(context) ? 50 : 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"))
                            ),
                            ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding:const EdgeInsets.only(left:10,right:10,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dr . Testing Subba Raoss",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: isMobile(context) ? mediumTextStyle(context).copyWith(color: kPrimaryColor,fontSize: 17.5) : largeTextStyle(context).copyWith(color: kPrimaryColor)),
                                  Text("ENT",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: isMobile(context) ? smallTextStyle(context).copyWith(color: kDimGray,fontFamily:kMuktaRegular) : mediumTextStyle(context).copyWith(color: kDimGray,fontFamily:kMuktaRegular)),
                                  ],
                              ),
                              ),
                          ),
                           Container(
                      height: isMobile(context) ? 40 : 55,
                      width:  isMobile(context) ? 40 : 55,
                      decoration: BoxDecoration(
                        color:  kSecondaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.arrow_right_alt_outlined,color:kPrimaryColor),
                    )
                           ],
                      ),
                      ),
                    mediumCustomSizedBox(context),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? 6 : 14,vertical:4),
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: kSecondaryColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             iconText(
                               icon: Icons.calendar_today_sharp,
                               text: "Monday, Aug 19"
                             ),
                           RotatedBox(quarterTurns: 1,child:mediumCustomSizedBox(context)),
                           iconText(
                               icon: Icons.access_time,
                               text: "11:00 am"
                             ),
                           
                         ],
                        ),
                      ),
                      ),
                    
                  ],
                ),
              ),
              
              mediumCustomSizedBox(context),
              
            ],
          ),
        )
       ],
     ),
    );
  }

Widget displayHomeBoxGrid({required Color txtColor,required IconData icon,required Color circleClr,required String title,required String subTitle,required Color bgColor,required Function onTap}) {
  var size = sizeMedia(context);
  return Container(
      width: size.width,
      height: isMobile(context) ? size.height / 4.0 : size.height / 3.2,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),
          vertical: kDefaultScreenPaddingVertical(context)),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          border: Border.all(color: circleClr),
          color: bgColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CircleAvatar(
                  maxRadius: isMobile(context) ? 26 : 32,
                  backgroundColor: circleClr,
                  child: Center(
                    child: Icon(icon,color:kPrimaryColor,size: isMobile(context) ? 32 : 38),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    smallCustomSizedBox(context),
                Text(title,style: smallMobile(context) ? mediumTextStyle(context).copyWith(wordSpacing: 2.0,color:txtColor) : largeTextStyle(context).copyWith(wordSpacing: 2.0,color:txtColor),),
                Text(subTitle,
                maxLines: 2,
                softWrap: true,
                style: smallMobile(context) 
                ? smallTextStyle(context).copyWith(wordSpacing: 1.0,color:txtColor)
                : mediumTextStyle(context).copyWith(wordSpacing: 1.0,color:txtColor)
                )
                  ],
                ),
              )
            ],
          ),
              );
}

Widget iconText({required IconData icon, required String text}){
  return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Icon(icon,color:kPrimaryColor, size: smallMobile(context) ? 16.5 : 24),
                          Container(
                            margin: const EdgeInsets.only(left:7.0),
                            child: Text(text,
                            style:smallMobile(context) ? smallTextStyle(context).copyWith(color:kIndigocolor,fontFamily:kMuktaRegular)
                              : mediumTextStyle(context).copyWith(color:kIndigocolor,fontFamily:kMuktaRegular)),
                          ),
                          ],
                        );
}
}