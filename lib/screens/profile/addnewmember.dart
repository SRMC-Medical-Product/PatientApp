import 'package:patientapp/apis/familymembersapi.dart';
import 'package:patientapp/apis/profilescreenapi.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

// TODO Main feature : Add a new family member dropdown not working

class AddNewMemberPage extends StatefulWidget {
  static const routeName = addnewmemberpage;
  const AddNewMemberPage({Key? key}) : super(key: key);

  @override
  _AddNewMemberPageState createState() => _AddNewMemberPageState();
}

class _AddNewMemberPageState extends State<AddNewMemberPage> {
  
Future? _profileFuture;
  @override
  void initState() {
    super.initState();
    _profileFuture = _getProfile();
  }

  _getProfile() async {
    return await ProfileScreenApi().getProfile(context: context);
  }

  // Initial Selected Value for Gender
  String? genderDropDownValue; 
  String? relationDropDownValue; 

  //Initial Selected Value for Blood Group
  String? bloodGroupValue;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

  final FamilyMembersApi _familyMembersApi = FamilyMembersApi();

  _postNewMember(
      {required String name,
      required String relation,
      required String gender,
      required String blood,
      required String email,
      required String dob,
      required FileImage img,
      String? aadhar}) async {
    return await _familyMembersApi.postFamilyMembers(
        context: context,
        name: name,
        relation: relation,
        gender: gender,
        blood: blood,
        dob: dob,
        email: email,
        img: img,
        aadhar: aadhar);
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
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot);
                print(snapshot.data);
            if (snapshot.hasData) {  
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleText(
                        context: context,
                        text: "Add Family Member",
                        color: Colors.black),
                    mediumCustomSizedBox(context),

                    personalInfoDynamicTitle(
                        context: context,
                        title: "Patient Name*",
                        controller: _nameController,
                        hintTextField: "Your Name",
                        textInputType: TextInputType.text),

                    personalInfoDynamicTitle(
                        context: context,
                        title: "Email",
                        controller: _emailController,
                        hintTextField: "Your Email",
                        textInputType: TextInputType.emailAddress),
                    Expanded( 
                          child: dropDownMenu(
                            title: "Relation",
                            widgetChild: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(5),
                                  style: mediumTextStyle(context),
                                  elevation: 1,
                                  hint: Text(
                                    "Select",
                                    overflow: TextOverflow.clip,
                                    style: mediumTextStyle(context)
                                        .copyWith(color: kDarkGray),
                                  ),
                                  value: relationDropDownValue,
                                  items: snapshot.data['relation']
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      relationDropDownValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                    personalInfoDynamicTitle(
                        context: context,
                        title: "Aadhar Card (Optional)",
                        controller: _aadharController,
                        hintTextField: "Your Aadhar Number",
                        textInputType: TextInputType.number),

                    //Date of birth
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        mediumCustomSizedBox(context),
                        Text(
                          "Date of Birth",
                          style: mediumTextStyle(context)
                              .copyWith(letterSpacing: 0.2),
                        ),
                        smallCustomSizedBox(context),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: kLightLavengerGrayColor,
                            // border: Border.all(color: kPrimaryColor, width: 1),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: TextFormField(
                            controller: _dobController,
                            style: const TextStyle(
                                color: kBlackTextColor, fontSize: 17),
                            keyboardType: TextInputType.datetime,
                            cursorColor: kPrimaryColor,
                            readOnly: true,
                            onTap: () async {
                              var date = DateTime.now().toString();
                              var lastDateParse = DateTime.parse(date);

                              var datePicking = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: lastDateParse,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary:
                                            kPrimaryColor, // header background color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary:
                                              Colors.red, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              setState(() {
                                var dateParse =
                                    DateTime.parse(datePicking.toString());
                                var formattedDate =
                                    "${dateParse.day}-${dateParse.month}-${dateParse.year}";
                                _dobController.text =
                                    formattedDate; //.substring(0,10);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "DOB",
                              hintStyle: mediumTextStyle(context)
                                  .copyWith(color: kDarkGray),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 8),
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
                                  hint: Text("Select",
                                      style: mediumTextStyle(context)
                                          .copyWith(color: kDarkGray)),
                                  value: genderDropDownValue,
                                  items: snapshot.data['gender']
                                      .map((String items) {
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
                        RotatedBox(
                          quarterTurns: 1,
                          child: mediumCustomSizedBox(context),
                        ),
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
                                  hint: Text(
                                    "Select",
                                    overflow: TextOverflow.clip,
                                    style: mediumTextStyle(context)
                                        .copyWith(color: kDarkGray),
                                  ),
                                  value: bloodGroupValue,
                                  items: snapshot.data['blood']
                                      .map((String items) {
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

                    //Save or update Button
                    primaryBtn(
                        context: context,
                        isOutline: false,
                        onTap: () {},
                        btnText: "Add member".toUpperCase())
                  ],
                ),
              );
            } else if (snapshot.hasError) {
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

  Widget dropDownMenu({required String title, required Widget widgetChild}) {
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
