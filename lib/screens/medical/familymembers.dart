import 'package:patientapp/apis/medicalrecordsapi.dart';
import 'package:patientapp/helpers/headers.dart'; 
import 'package:patientapp/screens/medical/specialisationpage.dart';

class FamilyMembers extends StatefulWidget {
  static const routeName = familmembers;
  const FamilyMembers({Key? key}) : super(key: key);

  @override
  State<FamilyMembers> createState() => _FamilyMembersState();
}

class _FamilyMembersState extends State<FamilyMembers> {

  Future? _familyMembersFuture;

  final MedicalRecordsAPI _medicalRecordsAPI = MedicalRecordsAPI();

  @override
    void initState() {
      super.initState();
      _familyMembersFuture = _fetchFamilyMembers();
    }    

  _fetchFamilyMembers() async{
    return await _medicalRecordsAPI.getFamilyMembers(context: context);
  }

  Future<void> _getRefreshedFamilyMembers() async{
    setState(() {
      _familyMembersFuture = _fetchFamilyMembers();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
        child: RefreshIndicator(
          onRefresh: _getRefreshedFamilyMembers,
          color: kPrimaryColor,
          strokeWidth: 3,
          child: Scaffold(
              body: FutureBuilder(
                future: _familyMembersFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    List<dynamic > familyMembers = snapshot.data['members'];
                    return Column(
              children: [
          Container(
            width: size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: kSlateGray,
                    width: 1.2,
                  ),
                )),
            padding: screenPads(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                smallCustomSizedBox(context),
                Text(
                  "Medical Records",
                  style: largeTextStyle(context),
                ),
                smallCustomSizedBox(context),
              ],
            ),
          ),
          smallCustomSizedBox(context),
          Expanded(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  margin: screenPads(context),
                  child: Column(
                    children: [
                    snapshot.data['isempty'] == false ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: familyMembers.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              children: [
                                Container(
                                 decoration : BoxDecoration(
                                   color: kAliceBlueColor,
                                   border: Border(
                                    left: BorderSide(
                                        width: 3.0,
                                        color: ([...Colors.primaries]..shuffle()).first
                                    ),
                                  ), 
                                 ), 
                                  child: ListTile(
                                    onTap: () => Navigator.push(context, 
                                    CustomRightPageRoute(page: SpecialisationPage(), routeName: specialisationpage)
                                    ), 
                                    title: Text(
                                      isEmptyOrNull(familyMembers[i]['name']) ? "Member" : "${familyMembers[i]['name']}",
                                      style: const TextStyle(
                                        fontFamily: kMuktaRegular,
                                      ),
                                    ),
                                    subtitle: Text(
                                      isEmptyOrNull(familyMembers[i]['relation']) ? "Relation" : "${familyMembers[i]['relation']}",
                                      style: smallTextStyle(context)
                                    ),
                                    trailing: const Icon(
                                      Icons.arrow_right_rounded,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                mediumCustomSizedBox(context),
                              ],
                            );
                          }) : isNullIcon(context: context, text: "You have no recent records", icon: Icons.medical_services)
                    ],
                  ),
                )),
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
                },
              )
            ),
        ));
  }
}
