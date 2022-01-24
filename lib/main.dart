import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/appcontroller.dart';
import 'package:patientapp/screens/home/home.dart';
import 'package:patientapp/screens/home/notification.dart';
import 'package:patientapp/screens/medical/medicalrecords.dart';
import 'package:patientapp/screens/profile/addnewmember.dart';
import 'package:patientapp/screens/profile/appointmenthistory.dart';
import 'package:patientapp/screens/profile/familymembers.dart';
import 'package:patientapp/screens/profile/personaldata.dart';
import 'package:patientapp/screens/profile/profilepage.dart';
import 'package:patientapp/screens/profile/updatemembers.dart';
import 'package:patientapp/screens/search/appointmentbook.dart';
import 'package:patientapp/screens/search/doctordisplay.dart';
import 'package:patientapp/screens/search/dynamicsearchpage.dart';
import 'package:patientapp/screens/search/searchpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomieTouch User App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home:AllFamilyMembersPage(),//const AppScreenController(indexScreen: 0,),
      routes: {
        //App Screens
        AppScreenController.routeName : (context) => const AppScreenController(), // Path :  /appcontroller

        //Main Nav screens
        HomePage.routeName : (context) => const HomePage(), // Path :  /homepage
        MedicalRecordsPage.routeName : (context) => const MedicalRecordsPage(), // Path :  /medicalrecords
        ProfilePage.routeName : (context) => const ProfilePage(), // Path :  /profilepage
        SearchPage.routeName : (context) => const SearchPage(), // Path :  /searchpage

        //Appointments Screen
        AppointmentHistoryPage.routeName : (context) => const AppointmentHistoryPage(), // Path :  /appointmenthistorypage
        NotificationPage.routeName : (context) => const NotificationPage(), // Path :  /notificationpage

        //Profile Page Screen
        PersonalDataPage.routeName : (context) => const PersonalDataPage(), // Path :  /personaldata

        //Search Page
        DynamicSearchPage.routeName : (context) => const DynamicSearchPage(), // Path :  /dynamicsearchpage
      
        //Doctors Display List
        DoctorsDisplayPage.routeName : (context) => const DoctorsDisplayPage(), // Path :  /doctorsdisplaypage

        //Appointment Booking Screen
        AppointmentBookingPage.routeName : (context) => const AppointmentBookingPage(), // Path :  /appointmentbookingpage

        //Add New Member Screen
        AddNewMemberPage.routeName : (context) => const AddNewMemberPage(), // Path :  /addnewmemberpage
        EditFamilyMembersPage.routeName : (context) => const EditFamilyMembersPage(), // Path :  /editfamilymemberspage
        AllFamilyMembersPage.routeName : (context) => const AllFamilyMembersPage(), // Path :  /allfamilymemberspage
      },
    );
  }
}