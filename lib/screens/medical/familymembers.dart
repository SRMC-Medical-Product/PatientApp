import 'package:patientapp/helpers/headers.dart'; 
import 'package:patientapp/screens/medical/specialisationpage.dart';

class FamilyMembers extends StatefulWidget {
  static const routeName = familmembers;
  const FamilyMembers({Key? key}) : super(key: key);

  @override
  State<FamilyMembers> createState() => _FamilyMembersState();
}

class _FamilyMembersState extends State<FamilyMembers> {
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
        child: Scaffold(
            body: Column(
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
                "Family Members",
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
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
                                    'Family Member',
                                    style: const TextStyle(
                                      fontFamily: kMuktaRegular,
                                    ),
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
                        })
                  ],
                ),
              )),
        ),
      ],
    )));
  }
}
