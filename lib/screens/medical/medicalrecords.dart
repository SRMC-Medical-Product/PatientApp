import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/medical/medicalfiles.dart';

class MedicalRecordsPage extends StatefulWidget {
  static const routeName = medicalrecordspage;
  
  const MedicalRecordsPage({Key? key}) : super(key: key);

  @override
  _MedicalRecordsPageState createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {
  @override
  Widget build(BuildContext context) {
var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: screenPads(context),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(
                'Medical Records',
                style: largeTextStyle(context) 
              ),
               mediumCustomSizedBox(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int i){
                    return GestureDetector(
                      onTap: () => Navigator.push(context,CustomRightPageRoute(page:const MedicalFilesPage(),routeName:  medicalrecordspage)),
                      child: Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                      boxShadow:const [
                        BoxShadow(
                          color: kSlateGray,
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0,0), // changes position of shadow
                        ),
                      ]
                      //border: Border.all(color:kDimGray)
                                        ),
                                        child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("record id ",style: mediumTextStyle(context).copyWith(fontFamily : kMuktaBold,letterSpacing: 0.2,color:Colors.black.withOpacity(0.8))),
                              Text("Dr. Testing title goes here for two lines ",
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: mediumTextStyle(context).copyWith(letterSpacing: 0.1,color:kPrimaryColor)),
                              Text("10-2-2022 , 06:00 PM",style:smallTextStyle(context)),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_right_alt_outlined,color: kPrimaryColor,size: isMobile(context) ? 25 : 35)
                        ]
                      ),
                      smallCustomSizedBox(context),
                      // lineDivider(context,color: kDimGray),
                      // smallCustomSizedBox(context),
                      // smallCustomSizedBox(context),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //        CircleAvatar(
                      //               maxRadius: isMobile(context) ? 20 : 25,
                      //               backgroundImage: const NetworkImage(
                      //                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU")),
                      //       RotatedBox(quarterTurns: 1,child:smallCustomSizedBox(context)),
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Text("Dr. Testing",
                      //           maxLines: 1,
                      //           softWrap: true,
                      //           overflow: TextOverflow.clip,
                      //           style: mediumTextStyle(context).copyWith(letterSpacing: 0.1,color:Colors.black.withOpacity(0.9))),
                      //           Text("Male | Cardiologist",style: smallTextStyle(context)),
                      //         ],
                      //       )        
                      //   ],
                      // ),  
                      ],
                                      ),
                                      ),
                    );
                  },
                ),
              ],
            )
          ),  
        ),
      ),
    );
  }
}
