import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AddNewMemberPage extends StatefulWidget {
  static const routeName = addnewmemberpage;
  const AddNewMemberPage({ Key? key }) : super(key: key);

  @override
  _AddNewMemberPageState createState() => _AddNewMemberPageState();
}

class _AddNewMemberPageState extends State<AddNewMemberPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonNavbar(context: context, isBack: true),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context),vertical: kDefaultScreenPaddingVertical(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                titleText(context: context, text: "Add Family Member", color: Colors.black),
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
                    primaryBtn(context: context, 
                    onTap: (){}, btnText: "Add member".toUpperCase())                           
              ],
            ),
          ),
        ),
      ),
    );
  }

}