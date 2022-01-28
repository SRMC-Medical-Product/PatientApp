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
  final TextEditingController _mobileController = TextEditingController();

  @override
    void initState() {
      super.initState();
      _nameController.text = "testing";//widget.name;
      _emailController.text = "email@email.com"; //widget.email;
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
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: screenPads(context),
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

                 /*-----Not necessary till now until confirmation of the external sources-----*/       
                /* personalInfoDynamicTitle(
                      context: context,
                        title: "Aadhar Card (Optional)",
                        controller: _aadharController,
                        hintTextField: "Your Aadhar Number",
                        textInputType: TextInputType.number),  */

                //Save or update Button
                  primaryBtn(context: context,  isOutline: false,
                    onTap: (){}, btnText: "Update Member".toUpperCase())                            
              ],
            ),
          ),
        ),
      ),
    );
  }

}