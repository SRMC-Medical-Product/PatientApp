import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/contenttile.dart';
import 'package:patientapp/screens/components/navbar.dart';

class MedicalFilesPage extends StatefulWidget {
  static const routeName = medicalfilespage;
  const MedicalFilesPage({ Key? key }) : super(key: key);

  @override
  _MedicalFilesPageState createState() => _MedicalFilesPageState();
}

class _MedicalFilesPageState extends State<MedicalFilesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonNavbar(context: context, isBack: true),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kMediumDivider(context),
          //Appointment Details
          Container(
          margin: EdgeInsets.symmetric(
              horizontal: kDefaultScreenPaddingHorizontal(context),
              vertical: kDefaultScreenPaddingVertical(context)),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              contentDescTile(
                context: context,
                title: "Appointment ID", subtitle: "#1234567SHDH"),
              mediumCustomSizedBox(context),
              contentDescTile(
                context: context,
                title: "Date & Time", subtitle:"12-12-2020 , 10:00 AM"),
              mediumCustomSizedBox(context),
          lineDivider(context),
            ],
          ),
          ),  
          //Doctor Details
          Container(
           margin: EdgeInsets.symmetric(
              horizontal: kDefaultScreenPaddingHorizontal(context),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      maxRadius: isMobile(context) ? 25 : 35,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU")),
                  RotatedBox(
                    quarterTurns: 1,
                    child: mediumCustomSizedBox(context),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       
                        Text(
                "Testing Doctor",
                maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                style: mediumTextStyle(context)
                    .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
              ),
                        Text(
                          "MBBS MD | Cardiologist",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: smallTextStyle(context).copyWith(
                              height: 1.2,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                        Text(
                          "Male",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: smallTextStyle(context).copyWith(
                              height: 1.2,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                        smallCustomSizedBox(context),
                      ],
                    ),
                  ),
                ],
              ),
              smallCustomSizedBox(context),
            ],
          ),
          ),              
          kSmallDivider(context),
          Container(
            margin: screenPads(context),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount : 4,
              itemBuilder: (BuildContext context, int i){
                return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumCustomSizedBox(context),
                Text(
                      "01-02-2022",
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                smallCustomSizedBox(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount : 2,
                  itemBuilder: (BuildContext context, int i){
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: kPinkRedishColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(Icons.download_rounded,size:20,color:Colors.white),
                          ),
                        ),
                        title: Text(
                        "first_report.pdf",
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: mediumTextStyle(context)
                            .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaRegular),
                      ),
                      ),
                    );
                  },
                )
              ],
            );
              },
            )
          )
            ],
          ),
        ),
      ),
    );
  }
}