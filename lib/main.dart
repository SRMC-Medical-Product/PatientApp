import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/appointmentsindetail.dart';
import 'package:patientapp/screens/auth/info.dart';
import 'package:patientapp/screens/auth/login.dart';
import 'package:patientapp/screens/auth/otppage.dart';
import 'package:patientapp/screens/auth/registerpage.dart';
import 'package:patientapp/screens/components/appcontroller.dart';
import 'package:patientapp/screens/home/home.dart';
import 'package:patientapp/screens/home/notification.dart';
import 'package:patientapp/screens/appointments/appointmentcontroller.dart';
import 'package:patientapp/screens/medical/medicalfiles.dart';
import 'package:patientapp/screens/medical/medicalrecords.dart';
import 'package:patientapp/screens/profile/addnewmember.dart';
import 'package:patientapp/screens/profile/appointmenthistory.dart';
import 'package:patientapp/screens/profile/familymembers.dart';
import 'package:patientapp/screens/profile/personaldata.dart';
import 'package:patientapp/screens/profile/profilepage.dart';
import 'package:patientapp/screens/search/appointmentbook.dart';
import 'package:patientapp/screens/search/appointmentconfirmation.dart';
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
      title: 'SRMC User App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: const AppScreenController(indexScreen: 1,),
      routes: {
        //Auth Screens
        LoginPage.routeName: (context) => const LoginPage(), //Path : /loginpage
        LoginInfo.routeName: (context) => const LoginInfo(), //Path : /loginpage
        RegisterPage.routeName : (context) => const RegisterPage(), // Path :  /registerpage
        OtpPage.routeName : (context) => OtpPage(secretCode: "",phoneNumber: "",), // Path :  /otppage

        //App Screens
        AppScreenController.routeName : (context) => const AppScreenController(), // Path :  /appcontroller

        //Main Nav screens
        HomePage.routeName : (context) => const HomePage(), // Path :  /homepage
        MedicalRecordsPage.routeName : (context) => const MedicalRecordsPage(deptId: "",recordId: "",), // Path :  /medicalrecords
        ProfilePage.routeName : (context) => const ProfilePage(), // Path :  /profilepage
        SearchPage.routeName : (context) => const SearchPage(), // Path :  /searchpage

        //Appointments Screen
        AppointmentHistoryPage.routeName : (context) => const AppointmentHistoryPage(), // Path :  /appointmenthistorypage
        NotificationPage.routeName : (context) => const NotificationPage(), // Path :  /notificationpage

        //Profile Page Screen
        PersonalDataPage.routeName : (context) => const PersonalDataPage(patientId: "",), // Path :  /personaldata

        //Search Page
        DynamicSearchPage.routeName : (context) => const DynamicSearchPage(isOneTimePop: true,), // Path :  /dynamicsearchpage
      
        //Doctors Display List
        DoctorsDisplayPage.routeName : (context) => DoctorsDisplayPage(searchType: "first",), // Path :  /doctorsdisplaypage

        //Appointment Booking Screen
        AppointmentBookingPage.routeName : (context) => const AppointmentBookingPage(doctorId: "",), // Path :  /appointmentbookingpage
        AppointmentConfirmationPage.routeName : (context) => const AppointmentConfirmationPage(date: "",doctorId: "",patientId: "",time: "",), // Path :  /appointmentconfirmationpage
        AppointmentController.routeName : (context) => const AppointmentController(), // Path :  /upcomingappointments
        AppointmentsDetailsPage.routeName : (context) => const AppointmentsDetailsPage(appointmentId: "",), // Path :  /appointmentdetailspage

        //Add New Member Screen
        AddNewMemberPage.routeName : (context) => const AddNewMemberPage(), // Path :  /addnewmemberpage
        AllFamilyMembersPage.routeName : (context) => const AllFamilyMembersPage(), // Path :  /allfamilymemberspage

        //Medical Records
        MedicalFilesPage.routeName : (context) => const MedicalFilesPage(appointmentId: "",deptId: "",recordId: "",), // Path :  /medicalfilespage

      },
    );
  }
}