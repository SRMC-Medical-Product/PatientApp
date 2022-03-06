import 'package:patientapp/apis/medicalrecordsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/medical/medicalfiles.dart';

class MedicalRecordsPage extends StatefulWidget {
  static const routeName = medicalrecordspage;
  
  final String recordId;
  final String deptId;

  const MedicalRecordsPage({Key? key,required this.deptId,required this.recordId}) : super(key: key);

  @override
  _MedicalRecordsPageState createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {

  Future? _recordsFuture;

  final MedicalRecordsAPI _medicalRecordsAPI = MedicalRecordsAPI();

  @override
    void initState() {
      super.initState();
      _recordsFuture = fetchAllDisplayRecords();
    }    

  fetchAllDisplayRecords() async {
    return await _medicalRecordsAPI.getAllDisplayRecords(context: context, recordId: widget.recordId, deptId: widget.deptId);
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
            future: _recordsFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                List<dynamic> _recordList = snapshot.data['records'];
                return Container(
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
                  itemCount: _recordList.length,
                  itemBuilder: (BuildContext context, int i){
                    return GestureDetector(
                      onTap: () => Navigator.push(context,CustomRightPageRoute(page:MedicalFilesPage(
                        appointmentId: _recordList[i]['appointmentid'].toString(),
                        deptId: snapshot.data['deptid'].toString(),
                        recordId: snapshot.data['recordid'].toString(),
                      ),routeName:  medicalrecordspage)),
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
                              Text("${_recordList[i]['appointmentid']}",style: mediumTextStyle(context).copyWith(fontFamily : kMuktaBold,letterSpacing: 0.2,color:Colors.black.withOpacity(0.8))),
                              Text("Dr. ${_recordList[i]['doctorname']}",
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: mediumTextStyle(context).copyWith(letterSpacing: 0.1,color:kPrimaryColor)),
                              Text("${_recordList[i]['created_at']}",style:smallTextStyle(context)),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_right_alt_outlined,color: kPrimaryColor,size: isMobile(context) ? 25 : 35)
                        ]
                      ),
                      smallCustomSizedBox(context), 
                      ],
                                      ),
                                      ),
                    );
                  },
                ),
              ],
            )
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
            }
          )
        ),
      ),
    );
  }
}
