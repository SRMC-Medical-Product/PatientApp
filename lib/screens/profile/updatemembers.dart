import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class EditFamilyMembersPage extends StatefulWidget {
  static const routeName = editfamilymemberspage;
  final String? name;
  final String? mobile;
  final String? aadhar;
  final String? email;
  const EditFamilyMembersPage({Key? key,this.name,this.mobile,this.aadhar,this.email}) : super(key: key);

  @override
  _EditFamilyMembersPageState createState() => _EditFamilyMembersPageState();
}

class _EditFamilyMembersPageState extends State<EditFamilyMembersPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
    void initState() {
      super.initState();
      _nameController.text = "testing";//widget.name;
      _emailController.text = "email@email.com"; //widget.email;
      _aadharController.text = "1234 5432 7612";//widget.aadhar;
      _mobileController.text = "1234567890";//widget.mobile;
    }    

  @override
  Widget build(BuildContext context) {

    //TODO : Make non editable fields 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),vertical: kDefaultScreenPaddingVertical(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: titleText(context: context, text: "Update or Delete Family Member", color: Colors.black))),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text("Delete",style: smallTextStyle(context).copyWith(color:Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
                mediumCustomSizedBox(context),

                personalInfoDynamicTitle(
                      context: context,
                        title: "Patient Name*",
                        controller: _nameController,
                        hintTextField: "Your Name",
                        textInputType: TextInputType.text),
                personalInfoDynamicTitle(
                      context: context,
                        title: "Mobile Number*",
                        controller: _mobileController,
                        hintTextField: "Your Mobile Number",
                        textInputType: TextInputType.text),
                personalInfoDynamicTitle(
                      context: context,
                        title: "Email (Optional)",
                        controller: _emailController,
                        hintTextField: "Your Email",
                        textInputType: TextInputType.emailAddress),
                personalInfoDynamicTitle(
                      context: context,
                        title: "Aadhar Card (Optional)",
                        controller: _aadharController,
                        hintTextField: "Your Aadhar Number",
                        textInputType: TextInputType.number),  

                //Save or update Button
                    GestureDetector(
                      onTap: () => setState(() {
                        
                      }),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryColor,
                          //border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            "Update Member".toUpperCase(),
                            style: mediumTextStyle(context).copyWith(color: Colors.white,letterSpacing : 0.3),
                          ),
                        ),
                      ),
                    )                              
              ],
            ),
          ),
        ),
      ),
    );
  }

}