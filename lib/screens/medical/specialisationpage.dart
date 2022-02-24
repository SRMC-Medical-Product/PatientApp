import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/medical/medicalrecords.dart';

class SpecialisationPage extends StatefulWidget {
  static const routeName = specialisationpage;
  const SpecialisationPage({Key? key}) : super(key: key);

  @override
  State<SpecialisationPage> createState() => _SpecialisationPageState();
}

class _SpecialisationPageState extends State<SpecialisationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
          margin : screenPads(context), 
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Specialisation',
                style: largeTextStyle(context) 
              ),
               mediumCustomSizedBox(context),
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
                                     border: Border.all(
                                      color: kSlateGray,
                                      width : 1.0
                                    ), 
                                    borderRadius: BorderRadius.circular(8.0)
                                   ), 
                                    child: ListTile(
                                      onTap: () => Navigator.push(context, 
                                      CustomRightPageRoute(page: MedicalRecordsPage(), routeName: medicalrecordspage)
                                      ), 
                                      leading:  Container(
                width: isMobile(context) ? 45 : 65, 
                height: isMobile(context) ? 45 : 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/5198299/screenshots/14167964/media/e02fde5c1b63f593cf926cdd737d3b00.jpg?compress=1&resize=1200x900&vertical=top"))
                            ),
              ),
                                      title: Text(
                                        'Cardiology',
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
                            }),
            ],
          )
          ))));
  }
}
