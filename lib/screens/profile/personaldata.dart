import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientapp/apis/profilescreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class PersonalDataPage extends StatefulWidget {
  static const routeName = personaldatapage;
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final ProfileScreenApi _profileScreenApi = ProfileScreenApi();

  Future? _profileFuture;

  ///Edit Profile Bool values
  bool isNameEdited = false;
  bool isEmailEdited = false;
  bool isDateEdited = false;
  bool isGendersEdited = false;
  bool isBloodEdited = false;
  bool isRelationEdited = false;


  // Initial Selected Value for Gender
  String? genderDropDownValue;
  var genderDropDownItems = ["Male", "Female", "Other"];

  //Initial Selected Value for Blood Group
  String? bloodGroupValue;
  var bloodGroupDropDownItems = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'NA'
  ];


 XFile? imageFile;
  //  final ImagePicker _picker = ImagePicker();
  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
    }
  }

  @override
    void initState() {
      super.initState();
      _profileFuture = _fetchUserProfile();
    }    

    _fetchUserProfile() async{
      return await _profileScreenApi.getProfileUpdate(context: context)
      .then((res) {
        if(res['profile']['id'].toString().isNotEmpty == true){
          print("---------------------res---------------------");
             SchedulerBinding.instance!
                  .addPostFrameCallback((_) => setState(() {
          _nameController.text = res['profile']['name'];
          if(res['profile']['email'] != null){
          _emailController.text = res['profile']['email'];
          }
           if(res['profile']['gender'] != null){
                        genderDropDownValue = res['profile']['gender'];
                      }
                      if(res['profile']['blood'] != null){
                        bloodGroupValue = res['profile']['blood'];
                      }
                      genderDropDownItems = res['gender'].cast<String>();
                      bloodGroupDropDownItems = res['blood'].cast<String>();
               }));

        }

      return res;
      });
    }

    _putProfileUpdate({required String name,required String dob, required String email,String? blood,String? gender,String? relation,String? filePath,String? fileName}) async{
      return await _profileScreenApi.putProfile(context: context, name: name, dob: dob, email: email,blood: blood,gender: gender,relation: relation,fileName: fileName,filePath:filePath);
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
            future: _profileFuture,
            builder: (BuildContext context , AsyncSnapshot snapshot){

              if(snapshot.hasData){
                Map<dynamic , dynamic > userData = snapshot.data['profile'];
              
                return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                    margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                      height: isMobile(context) ? 140 : 180,
                      width: isMobile(context) ? 140 : 180,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                           child: imageFile != null ? Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.cover,
                            ) : Image.network(
                              isEmptyOrNull(snapshot.data['profile']['img']) ? PATIENT_DEFAULT_IMG : snapshot.data['profile']['img'].toString(),
                              fit: BoxFit.cover,
                            ),
                          //  _imageFileList!.isNotEmpty ? Image.network(
                          //    _image ?? PATIENT_DEFAULT_IMG,
                          //    ///isEmptyOrNull(snapshot.data['profile']['profileImg']) ? PATIENT_DEFAULT_IMG : _image.toString(),
                          //    fit: BoxFit.cover,
                          //  ) 
                         ),
                       ),
                       GestureDetector(
                         onTap: () => _getFromGallery(), // getPhotoProfile(),
                         child: Text("Edit",style: mediumTextStyle(context)))
                     ],
                   ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleText(
                        context: context,
                        text: "Personal Information",
                        color: Colors.black),
                    smallCustomSizedBox(context),

                    //Personal Information and Data not editable
                    personalInfoStaticTitle(
                        title: "Patient Id*", initialValue: "${userData['id']}"),
                    personalInfoStaticTitle(
                        title: "Phone Number*", initialValue: "${userData['phone']}"),
 
                    //Relation
                     personalInfoStaticTitle(
                        title: "Relation*", initialValue: "${userData['relation']}"),

                  /*-----Not necessary till now until confirmation of the external sources-----*/       
                /* 
                    personalInfoStaticTitle(
                        title: "Aadhar Number*", initialValue: "1234 5678 7643"), */

                    personalInfoDynamicTitle(
                      context: context,
                        title: "Patient Name*",
                        controller: _nameController, //..text = isEmptyOrNull(snapshot.data['profile']['name']) ? "" : "${snapshot.data['profile']['name']}",
                        hintTextField: "Your Name",
                        textInputType: TextInputType.text,
                        ),
                    personalInfoDynamicTitle(
                      context: context,
                        title: "Email",
                        controller: _emailController..text = isEmptyOrNull(snapshot.data['profile']['email']) ? "" : "${snapshot.data['profile']['email']}",
                        hintTextField: "Your Email",
                        textInputType: TextInputType.text),

                    //Date of birth
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mediumCustomSizedBox(context),
                            Text(
                              "Date of Birth",
                              style: mediumTextStyle(context).copyWith(letterSpacing: 0.2),
                            ),
                            smallCustomSizedBox(context),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                       color: kLightLavengerGrayColor,
            borderRadius: BorderRadius.circular(9),
                              ),
                              child: TextFormField(
                                controller: _dateController..text = isEmptyOrNull(snapshot.data['profile']['dob']) ? "" : "${snapshot.data['profile']['dob']}",
                                style: const TextStyle(color: kBlackTextColor, fontSize: 17),
                                keyboardType: TextInputType.datetime,
                                cursorColor: kPrimaryColor,
                                readOnly: true,
                                onTap: () async {
                                    var date = DateTime.now().toString();
                                      var lastDateParse = DateTime.parse(date);              
                                      
                                      var datePicking =  await showDatePicker(
                                            context: context, 
                                            initialDate:DateTime.now(),
                                            firstDate:DateTime(1900),
                                            lastDate: lastDateParse,
                                            builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: const ColorScheme.light(
                                                  primary: kPrimaryColor, // header background color
                                                ),
                                                textButtonTheme: TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.red, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                            );
                                      setState(() {
                                        var dateParse = DateTime.parse(datePicking.toString());              
                                        var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
                                        _dateController.text = formattedDate; //.substring(0,10);      
                                      });
                                    },
                                decoration: InputDecoration(
                                  hintText: "DOB",
                                  hintStyle: mediumTextStyle(context).copyWith(color: kDarkGray),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                ),
                              ),
                            )
                          ],
                        ),
                                        
                    //Gender and Blood Group
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Expanded(
                        flex: 1,
                        child: dropDownMenu(
                                            title: "Gender",
                                            widgetChild: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                alignedDropdown: true,
                                                child: DropdownButton(
                                                  borderRadius: BorderRadius.circular(5),
                                                  style: mediumTextStyle(context),
                                                  elevation: 1,
                                                hint: Text("Select",style: mediumTextStyle(context).copyWith(color: kDarkGray)),
                                                  value: genderDropDownValue,
                                                  items: genderDropDownItems.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      genderDropDownValue = newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                      ),
                        RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                    Expanded(
                      flex: 1,
                      child: dropDownMenu(
                        title: "Blood Group",
                        widgetChild: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(5),
                              style: mediumTextStyle(context),
                              elevation: 1,
                                                  
                              hint: Text("Select",
                              overflow: TextOverflow.clip,
                              style: mediumTextStyle(context).copyWith(color: kDarkGray),),
                              value: bloodGroupValue,
                              items: bloodGroupDropDownItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  bloodGroupValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                      ],
                    ),

                    //Save or update Buttonxt
                    primaryBtn(context: context,  isOutline: false,
                    onTap: ()async{
                      if(_emailController.text.isNotEmpty){
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
                        if(emailValid){
                          overlayLoader(context);
                      _putProfileUpdate(
                        name: _nameController.text.trim(), 
                        dob: _dateController.text.isEmpty ? "" : _dateController.text.trim(), 
                        email: _emailController.text.isEmpty ? "" : _emailController.text.trim(),
                        blood: (bloodGroupValue != null || bloodGroupValue != "null" || bloodGroupValue != "") ? bloodGroupValue.toString(): "",
                        gender: (genderDropDownValue != null || genderDropDownValue != "null" || genderDropDownValue != "") ? genderDropDownValue.toString(): "",
                        relation: "",
                         fileName: isEmptyOrNull(imageFile)  ? null : imageFile?.name.toString() ,
                        filePath: isEmptyOrNull(imageFile) ? null : imageFile?.path.toString(),
                        );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Please enter a valid email address"));
                        }
                      }else{
                          overlayLoader(context);
                      _putProfileUpdate(
                        name: _nameController.text.trim(), 
                        dob: _dateController.text.isEmpty ? "" : _dateController.text.trim(), 
                        email: _emailController.text.isEmpty ? "" : _emailController.text.trim(),
                        blood: (bloodGroupValue != null || bloodGroupValue != "null" || bloodGroupValue != "") ? bloodGroupValue.toString(): "",
                        gender: (genderDropDownValue != null || genderDropDownValue != "null" || genderDropDownValue != "") ? genderDropDownValue.toString(): "",
                        relation: "",
                         fileName: isEmptyOrNull(imageFile)  ? null : imageFile?.name.toString() ,
                        filePath: isEmptyOrNull(imageFile) ? null : imageFile?.path.toString(),
                        );
                      }
                    }, 
                    btnText: "Update".toUpperCase())
                  ],
                ),
              ),

              //kLargeDivider(context,dividerClr: kMenuColor),
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
      ),
    );
  }

  Widget personalInfoStaticTitle(
      {required String title, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        mediumCustomSizedBox(context),
        Text(
          title,
          style: mediumTextStyle(context).copyWith(letterSpacing: 0.2),
        ),
        smallCustomSizedBox(context),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: kLightLavengerGrayColor,
            //border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextFormField(
            style: const TextStyle(color: kBlackTextColor, fontSize: 17),
            keyboardType: TextInputType.text,
            readOnly: true,
            initialValue: initialValue,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            ),
          ),
        )
      ],
    );
  }


  Widget dropDownMenu(
      {required String title,
      required Widget widgetChild}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        mediumCustomSizedBox(context),
        Text(
          title,
          style: mediumTextStyle(context).copyWith(letterSpacing: 0.2),
        ),
        smallCustomSizedBox(context),
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
                       color: kLightLavengerGrayColor,
           // border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: widgetChild,
        ),
      ],
    );
  }
}
