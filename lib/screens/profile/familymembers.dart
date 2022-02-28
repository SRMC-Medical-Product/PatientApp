import 'package:patientapp/apis/familymembersapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/profile/addnewmember.dart';
import 'package:patientapp/screens/profile/updatemembers.dart';


// TODO Main feature : Edit a new family member not working
 
class AllFamilyMembersPage extends StatefulWidget {
  static const routeName = allfamilymemberspage;
  const AllFamilyMembersPage({Key? key}) : super(key: key);

  @override
  _AllFamilyMembersPageState createState() => _AllFamilyMembersPageState();
}

class _AllFamilyMembersPageState extends State<AllFamilyMembersPage> {
  @override
  void initState() {
    super.initState();
    allFamilyMembersFuture = _getAllFamilyMembers();
  }

  _getAllFamilyMembers() async {
    return await FamilyMembersApi().getFamilyMembers(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
              future: allFamilyMembersFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map<dynamic , dynamic> user = snapshot.data['user'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(7),
                        padding: EdgeInsets.symmetric(
                            horizontal: kScreenMarginHorizontal(context)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${user['name']}",
                                          style: mediumLargeTextStyle(context),
                                        ),
                                        smallCustomSizedBox(context),
                                        Text(
                                          "${user['patientid']}",
                                          style: mediumTextStyle(context)
                                              .copyWith(color: kDimGray),
                                        ),
                                        Text( "${user['mobile']}",
                                          style: mediumTextStyle(context)
                                              .copyWith(color: kDimGray),
                                        )
                                      ]),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.person_pin_sharp,
                                      color: kPrimaryColor, size: 26),
                                ),
                              ],
                            ),
                            mediumCustomSizedBox(context),
                          ],
                        ),
                      ),
                      kMediumDivider(context),
                      smallCustomSizedBox(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                kDefaultScreenPaddingHorizontal(context),
                            vertical: kDefaultScreenPaddingVertical(context)),
                        child: titleText(
                            context: context,
                            text: "Your Family Members",
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CustomSimplePageRoute(
                                page: const AddNewMemberPage(),
                                routeName: addnewmemberpage)),
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  kDefaultScreenPaddingHorizontal(context) * 2,
                              vertical: 5),
                          decoration: BoxDecoration(
                            color: kWhiteSmoke,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add,
                                    color: Colors.black, size: 15),
                                Text("Add new member",
                                    style: mediumTextStyle(context))
                              ],
                            ),
                          ),
                        ),
                      ),
                      smallCustomSizedBox(context),
                      snapshot.data['isempty'] == true ?
                      isNullIcon(context: context, text: "No family Members", icon: Icons.family_restroom_rounded)
                       : 
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                kDefaultScreenPaddingHorizontal(context),
                            vertical: kDefaultScreenPaddingVertical(context)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: user['family_members'].length,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                smallCustomSizedBox(context),
                                ListTile(
                                  onTap: () => Navigator.push(
                                      context,
                                      CustomSimplePageRoute(
                                          page: const EditFamilyMembersPage(),
                                          routeName: editfamilymemberspage)),
                                  title: Text("${user['family_members'][i]['name']}",
                                      style: mediumTextStyle(context)),
                                  trailing: Text("Edit".toUpperCase(),
                                      style: smallTextStyle(context).copyWith(
                                          color: kPrimaryColor,
                                          fontFamily: kMuktaBold)),
                                ),
                                lineDivider(context,
                                    color: kWhiteSmoke, thickness: 1),
                                smallCustomSizedBox(context)
                              ],
                            );
                          },
                        ),
                      ),
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
              }),
        ),
      ),
    );
  }
}
