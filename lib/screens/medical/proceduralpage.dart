import 'package:patientapp/apis/medicalrecordsapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';
import 'package:patientapp/screens/medical/medicalrecords.dart';

class ProceduralPage extends StatefulWidget {
  static const routeName = specialisationpage;

  final String patientId;
  const ProceduralPage({Key? key,required this.patientId}) : super(key: key);

  @override
  State<ProceduralPage> createState() => _ProceduralPageState();
}

class _ProceduralPageState extends State<ProceduralPage> {

  Future? _recordsFuture;
  final MedicalRecordsAPI _medicalRecordsAPI = MedicalRecordsAPI();


  @override
    void initState() {
      super.initState();
      print("------------------------");
      print(widget.patientId);
      _recordsFuture = fetchProceduralRecord();
    }    


  fetchProceduralRecord() async{
    return await _medicalRecordsAPI.getProceduralRecords(context: context, patientId: widget.patientId);
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
                List<dynamic> _proceduralList = snapshot.data['procedures'];
                return Container(
          margin : screenPads(context), 
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Procedural Records',
                style: largeTextStyle(context) 
              ),
               mediumCustomSizedBox(context),
               ListView.builder(
                 shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _proceduralList.length,
                  itemBuilder: (BuildContext context, int i){
                    return 
                Column(
                  children: [
                   Theme(
                                    data: ThemeData(
                    dividerColor: Colors.transparent,
                    unselectedWidgetColor: kPrimaryColor,
                    dialogBackgroundColor: Colors.white
              ),
                                    child: ExpansionTile(
                                      initiallyExpanded: false,
                                      onExpansionChanged: (isExpanded){
                                       
                                      },
                                      title: Container(
                                     margin:const EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 1,
                                            child: smallCustomSizedBox(context),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${_proceduralList[i]['title']}",
                                                  softWrap: true,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: mediumTextStyle(context)
                                                      .copyWith(
                                                        fontWeight :  FontWeight.w300,
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                                smallCustomSizedBox(context),
                                                Text(
                                                  "${_proceduralList[i]['dept'].length} Specialisation",
                                                  style: smallTextStyle(context).copyWith(
                                                    fontWeight : FontWeight.w300,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                smallCustomSizedBox(context),
                                                Text(
                                                  "Created by ${_proceduralList[i]['created_by']}",
                                                  style: smallTextStyle(context).copyWith(
                                                    fontWeight : FontWeight.w300,
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                      children: <Widget>[
                                       ListView.builder(
                                         shrinkWrap: true,
                                         physics: const NeverScrollableScrollPhysics(),
                                         itemCount: _proceduralList[i]['dept'].length,
                                         itemBuilder: (BuildContext context, int j){
                                           return Container(
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
                                      CustomRightPageRoute(page: MedicalRecordsPage(
                                       recordId :_proceduralList[i]['id'],
                                        deptId: _proceduralList[i]['dept'][j]['deptid'],
                                      ), routeName: medicalrecordspage),
                                      ), 
                                      leading:  Container(
                width: isMobile(context) ? 45 : 65, 
                height: isMobile(context) ? 45 : 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(isEmptyOrNull(_proceduralList[i]['dept'][j]['deptimg']) ? CATEGORY_DEFAULT_IMAGE : _proceduralList[i]['dept'][j]['deptimg'].toString(), ))
                            ),
              ),
                                      title: Text(
                                          '${_proceduralList[i]['dept'][j]['deptname']}',
                                          style: const TextStyle(
                                            fontFamily: kMuktaRegular,
                                          ),
                                      ),
                                      trailing: const Icon(
                                          Icons.arrow_right_rounded,
                                          color: kPrimaryColor,
                                      ),
                                    ),
                                       );
                                         },
                                       )
                                      ],
                                    ),
                                  ),
               mediumCustomSizedBox(context),
                                  lineDivider(context,
                                      color: kSlateGray, thickness: 1),
                  ],
                );
              
                  },
               )
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
            },
          )
          )));
  }
}
