import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/appointments/futureappointments.dart';
import 'package:patientapp/screens/appointments/presentappointments.dart';
import 'package:patientapp/screens/components/navbar.dart';

class AppointmentController extends StatefulWidget {
  static const routeName = appointmentcontroller;
  const AppointmentController({ Key? key }) : super(key: key);

  @override
  _AppointmentControllerState createState() => _AppointmentControllerState();
}

class _AppointmentControllerState extends State<AppointmentController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey, 
          backgroundColor: Colors.white,
          endDrawerEnableOpenDragGesture: false,
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: kPrimaryColor,
              labelColor: Colors.black.withOpacity(0.9),
              labelStyle: mediumTextStyle(context)
                            .copyWith(fontFamily:kMuktaBold),
              unselectedLabelColor: kDimGray,
              unselectedLabelStyle: mediumTextStyle(context)
                            .copyWith(color: kDimGray,fontFamily:kMuktaBold),
              tabs: const [
                Tab(
                    child: Text(
                        "Live",
                      ),),
                Tab(
                  child: Text(
                        "Upcoming",
                      ),
                ),
              ],
            ),
            elevation: 2,
            shadowColor: kSlateGray,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back,color: kBlackTextColor,size: isMobile(context) ? 19 : 23,)),
          ),
          body: const TabBarView(
            children: [
              PresentAppointmentsPage(),
              FutureAppointments()
            ],
          ),
        ),
      ),
    );
  }
}