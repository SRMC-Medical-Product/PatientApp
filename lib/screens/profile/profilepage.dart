import 'package:flutter/cupertino.dart';
import 'package:patientapp/apis/authapi.dart';
import 'package:patientapp/apis/profilescreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/auth/info.dart';
import 'package:patientapp/screens/home/notification.dart';
import 'package:patientapp/screens/profile/appointmenthistory.dart';
import 'package:patientapp/screens/profile/familymembers.dart';
import 'package:patientapp/screens/profile/personaldata.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = profilepage;
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
Future? _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _getProfile();
  }

  _getProfile() async {
    return await ProfileScreenApi().getProfile(context: context);
  }

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
          ///User Details
          FutureBuilder(
            future: _profileFuture,
            builder: (BuildContext context , AsyncSnapshot snapshot) {
             if (snapshot.hasData) {
               Map<dynamic , dynamic> user = snapshot.data['user'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                    Text("${user['name']}",style: largeTextStyle(context),),
                    smallCustomSizedBox(context),
                    Text("${user['mobile']}",style: mediumTextStyle(context).copyWith(color:kDimGray),),
                    Text(snapshot.data['profile']['email'] ==  null ? "Email not yet updated" : "${snapshot.data['profile']['email']}",style: mediumTextStyle(context).copyWith(color:kDimGray),)
                      ]),
                  ),
                  IconButton(onPressed:() => Navigator.of(context).push(CustomRightPageRoute(page: const PersonalDataPage(), routeName: personaldatapage)), 
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
                  profileTiles(title: "Personal Data", icon: Icons.person,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: const PersonalDataPage(), routeName: personaldatapage))),
                  profileTiles(title: "Appointments History",icon: Icons.history,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: const AppointmentHistoryPage(), routeName: appointmenthistorypage))),
                  profileTiles(title: "Family Members", icon:Icons.family_restroom_outlined,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: const AllFamilyMembersPage(), routeName: allfamilymemberspage))),
                  profileTiles(title: "Notifications", icon:Icons.notifications_active,onTap: () => Navigator.of(context).push(CustomRightPageRoute(page: const NotificationPage(), routeName: notificationpage))),
                  profileTiles(title: "Raised Issues", icon:Icons.report_problem_outlined,onTap: () {}),
                  profileTiles(title: "Help & Support", icon:Icons.help,onTap: (){}),
                  profileTiles(title: "Terms & Conditions", icon: Icons.rule_sharp,onTap: (){}),
                  profileTiles(title: "Logout", icon:Icons.logout,
                  onTap: () async{
                    AuthenticationAPI().performLogOut(context:context,userLogout: true);
                  }
                  ),

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
   }
          ),
          
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
