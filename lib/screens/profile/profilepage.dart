import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/profile/appointmenthistory.dart';
import 'package:patientapp/screens/profile/personaldata.dart';

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
return SingleChildScrollView(
  physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          mediumCustomSizedBox(context),
          mediumCustomSizedBox(context),
          ///User Details
          Container(
            padding: EdgeInsets.symmetric(horizontal:kScreenMarginHorizontal(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Text("Rohith ND",style: largeTextStyle(context),),
                  smallCustomSizedBox(context),
                  Text("1234567890",style: mediumTextStyle(context).copyWith(color:kDimGray),),
                  Text("testing01@gmail.com",style: mediumTextStyle(context).copyWith(color:kDimGray),)
                    ]),
                ),
                IconButton(onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.edit,color: kPrimaryColor,size: 18),),
                  ],
                ),
                mediumCustomSizedBox(context),
              ],
            ),
          ),
          kLargeDivider(context),
          mediumCustomSizedBox(context),
          mediumCustomSizedBox(context),
          ///Profiles
          profileTiles(title: "Personal Data", icon: Icons.person,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: PersonalDataPage(), routeName: personaldatapage))),
          profileTiles(title: "Appointments History",icon: Icons.history,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: AppointmentHistoryPage(), routeName: appointmenthistorypage))),
          profileTiles(title: "Help & Support", icon:Icons.help,onTap: (){}),
          profileTiles(title: "Terms & Conditions", icon: Icons.rule_sharp,onTap: (){}),
          profileTiles(title: "Logout", icon:Icons.logout,onTap: (){}),

          ///Version
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: kScreenMarginHorizontal(context)),
            child: Column(
              children: [
          mediumCustomSizedBox(context),
          mediumCustomSizedBox(context),
          lineDivider(context,thickness: 0.5,color: kBlackTextColor),
          mediumCustomSizedBox(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("v1.1.0",style: smallTextStyle(context),),
                ),
          mediumCustomSizedBox(context),
          
              ],
            ),
          )  
        ],
      )
    );
}
Widget profileTiles({required String title, required IconData icon,required Function() onTap}){
 return Container(
            padding: EdgeInsets.symmetric(horizontal: kScreenMarginHorizontal(context)),
            child: Column(
              children: [
                ListTile(
                  onTap: onTap,
                  leading: CircleAvatar(
                    maxRadius: isMobile(context) ? 16 : 18,
                    backgroundColor: kSecondaryColor,
                    child: Center(child: Icon(icon,color: kPrimaryColor,size: 16,))),
                  title: Text(title,
                  style: const TextStyle(
                    fontFamily: kMuktaRegular,
                  ),
                  ),
                  trailing: const Icon(Icons.arrow_right_rounded,color: kPrimaryColor,),
                ),
                smallCustomSizedBox(context),
              ],
            ),
          );
}
}
