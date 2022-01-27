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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                        title: "Patient Id*", initialValue: "4hSSETKS6"),
                    personalInfoStaticTitle(
                        title: "Phone Number*", initialValue: "9876543211"),

                  /*-----Not necessary till now until confirmation of the external sources-----*/       
                /* 
                    personalInfoStaticTitle(
                        title: "Aadhar Number*", initialValue: "1234 5678 7643"), */

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
           // border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(9),
                              ),
                              child: TextFormField(
                                controller: _dateController,
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
 
                    //Save or update Button
                    GestureDetector(
                      onTap: () => setState(() {
                        
                      }),
                      child: Container(
                        height: 45,
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryColor,
                          //border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            "Update".toUpperCase(),
                            style: mediumTextStyle(context).copyWith(color: Colors.white,letterSpacing : 0.3),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //kLargeDivider(context,dividerClr: kMenuColor),
            ],
          ),
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
