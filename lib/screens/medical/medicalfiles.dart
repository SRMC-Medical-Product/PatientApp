import 'package:patientapp/apis/medicalrecordsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/contenttile.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalFilesPage extends StatefulWidget {
  static const routeName = medicalfilespage;
  final String recordId;
  final String deptId;
  final String appointmentId;

  const MedicalFilesPage({ Key? key,required this.appointmentId,required this.deptId,required this.recordId}) : super(key: key);

  @override
  _MedicalFilesPageState createState() => _MedicalFilesPageState();
}

class _MedicalFilesPageState extends State<MedicalFilesPage> {

  Future? _recordsFuture;
  final MedicalRecordsAPI _medicalRecordsAPI = MedicalRecordsAPI();

  @override
    void initState() {
      super.initState();
      _recordsFuture = fetchAppointmentMedicalRecords();
    }    

  fetchAppointmentMedicalRecords() async {
    return await _medicalRecordsAPI.getAppointmentsRecords(context: context, recordId: widget.recordId, deptId: widget.deptId, appointmentId: widget.appointmentId);
  }

Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Oops! Couldn't open the file.Try again later"));
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        appBar: commonNavbar(context: context, isBack: true),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: _recordsFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              Map<dynamic , dynamic > _recordsData = snapshot.data;
              Map<dynamic , dynamic > _doctorData = _recordsData['doctor'];
              List<dynamic> _files = _recordsData['records']['files'];
              return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              contentDescTile(
                context: context,
                title: "Appointment ID", subtitle: "#${_recordsData['aid']}"),
              mediumCustomSizedBox(context),
              contentDescTile(
                context: context,
                title: "Date & Time", subtitle:"${_recordsData['date']} , ${_recordsData['time']}"),
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
                      backgroundImage: NetworkImage(isEmptyOrNull(_doctorData['img']) ? DOCTOR_DEFAULT_IMG : _doctorData['img'].toString() )),
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
                "${_doctorData['name']}", 
                maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                style: mediumTextStyle(context)
                    .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
              ),
                        Text(
                          "${_doctorData['qualification']} | ${_doctorData['specialisation']}",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: smallTextStyle(context).copyWith(
                              height: 1.2,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                        Text(
                          "${_doctorData['gender']}",
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
          // kSmallDivider(context),
          // smallCustomSizedBox(context),
          // Container(
          //   margin: screenPads(context),
          //   child: Text(
          //                 " *Tap on the file to download it",
          //                 maxLines: 2,
          //                 softWrap: true,
          //                 overflow: TextOverflow.clip,
          //                 style: mediumTextStyle(context)
          //                     .copyWith(color: kPrimaryColor,fontFamily:kMuktaRegular),
          //               ),
          // ),
          // smallCustomSizedBox(context),
          kSmallDivider(context),
          Container(
            margin: screenPads(context),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount : _files.length,
              itemBuilder: (BuildContext context, int i){
                return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumCustomSizedBox(context),
                Text(
                      "${_files[i]['created_at']}",
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                smallCustomSizedBox(context),
               GestureDetector(
                 onTap: () => _launchInBrowser( _files[i]['url'].toString()),
                 child: Container(
                        margin: const EdgeInsets.all(5.0),
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
                          "${_files[i]['title']}",
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: mediumTextStyle(context)
                              .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaRegular),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            smallCustomSizedBox(context),
                            kSmallDivider(context),
                            smallCustomSizedBox(context),
                            Text(
                              "Uploaded by Dr. ${_files[i]['username']}",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: mediumTextStyle(context)
                                  .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaRegular),
                            ),
                          ],
                        ),
                        ),
                      ),
               )
               ],
            );
              },
            )
          )
            ],
          ),
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
    );
  }
}