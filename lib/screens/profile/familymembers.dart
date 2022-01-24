import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/profile/addnewmember.dart';
import 'package:patientapp/screens/profile/personaldata.dart';
import 'package:patientapp/screens/profile/updatemembers.dart';

class AllFamilyMembersPage extends StatefulWidget {
  static const routeName = allfamilymemberspage;
  const AllFamilyMembersPage({ Key? key }) : super(key: key);

  @override
  _AllFamilyMembersPageState createState() => _AllFamilyMembersPageState();
}

class _AllFamilyMembersPageState extends State<AllFamilyMembersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  
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
                  Text("Rohith ND",style: mediumLargeTextStyle(context),),
                  smallCustomSizedBox(context),
                  Text("1234567890",style: mediumTextStyle(context).copyWith(color:kDimGray),),
                  Text("testing01@gmail.com",style: mediumTextStyle(context).copyWith(color:kDimGray),)
                    ]),
                ),
                IconButton(onPressed:() {}, 
                    icon: const Icon(Icons.person_pin_sharp,color: kPrimaryColor,size: 26),),
                  ],
                ),
                mediumCustomSizedBox(context),
              ],
            ),
          ),
                
                kMediumDivider(context),
                smallCustomSizedBox(context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),vertical: kDefaultScreenPaddingVertical(context)),
                  child: titleText(context: context, text: "Your Family Members", color: Colors.black),
                ),  
                GestureDetector(
                                              onTap: () => Navigator.push(context, CustomSimplePageRoute(page: AddNewMemberPage(), routeName: addnewmemberpage)),
                                              child: Container(
                                                height: 35, 
                                                margin:EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context) * 2,vertical: 5),
                                                decoration: BoxDecoration(
                                                  color : kWhiteSmoke,
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.add,color:Colors.black,size:15),
                                                      Text("Add new member",style: mediumTextStyle(context))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                smallCustomSizedBox(context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),vertical: kDefaultScreenPaddingVertical(context)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int i){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          smallCustomSizedBox(context), 
                          ListTile(
                            onTap: () => Navigator.push(context, CustomSimplePageRoute(page: EditFamilyMembersPage(), routeName: editfamilymemberspage)),
                            title: Text("Loga Subramani", style: mediumTextStyle(context)),
                             trailing: Text("Edit".toUpperCase(), style: smallTextStyle(context).copyWith(color: kPrimaryColor,fontFamily:kMuktaBold)),
                          ),
                          lineDivider(context,color: kWhiteSmoke,thickness: 1),
                          smallCustomSizedBox(context)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}