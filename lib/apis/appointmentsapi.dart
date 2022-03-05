import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/screens/components/appcontroller.dart';

class AppointmentsAPI{ 
 
  Future<void> getPendingAppointments({required BuildContext context,required String queryId}) async {
    var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
     try {
      Response response = await dio.get("$APPOINTMENT_PENDING_URL?type=$queryId",options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments pending api");
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  Future<void> getHistoryAppointments({required BuildContext context}) async {
    var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
     try {
      Response response = await dio.get(APPOINTMENT_HISTORY_URL,options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments pending api");
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  Future<void> getAppointmentIndetail({required BuildContext context,required String appointmentId}) async{
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
     try {
      Response response = await dio.get("$APPOINTMENT_DETAILS_URL?appointmentid=$appointmentId",options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments indetail api");
        print(e.response?.data);
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  Future<dynamic> getDoctorSlotDetails({required BuildContext context,required String doctorId,required String queryDate}) async{
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
     try {
      Response response = await dio.get("$DOCTOR_SLOT_URL?doctorid=$doctorId&querydate=$queryDate",options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments indetail api");
        print(e.response?.data);
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  Future<dynamic> postChangeMemberBookings({required BuildContext context,required String memberID}) async{
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    print(memberID);
    FormData formData = FormData.fromMap({
      "memberid": memberID,
    });
     try {
      Response response = await dio.put(CHANGE_BOOKING_MEMBER_URL,data:formData,options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments indetail api");
        print(e.response?.data);
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  Future<void>  postConfirmBookingAppointment({required BuildContext context,required String selectedDate,required String selectedTime,required String patientId,required String doctorId}) async{
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";

     try {
      Response response = await dio.get("$CONFIRM_BOOKING_URL?date=$selectedDate&time=$selectedTime&patientid=$patientId&doctorid=$doctorId",options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['BODY'];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments indetail api");
        print(e.response?.data);
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }

  postMakeAppointmentBooking({required BuildContext context,required String selectedDate,required String selectedTime,required String patientId,required String doctorId}) async{
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";

    Map<dynamic , dynamic > data = {
      "patient_id" : patientId,
      "doctor_id" : doctorId,
      "date" : selectedDate,
      "time" : selectedTime,
    };

     try {
      Response response = await dio.post(MAKE_APPOINTMENT_URL,data:data,options : dioOptions);
      if(response.statusCode == 200) {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(customSnackSuccessBar(context, "Your appointments have been booked succesfully"));
        return true;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0054,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0051,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));  
      } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
        return defaultErrordialog(context: context, errorCode: ES_0050,onTapBtn: () => Navigator.of(context).pushReplacement(CustomSimplePageRoute(page: AppScreenController(indexScreen: 0),routeName: appcontroller)));
      } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in appointments indetail api");
        print(e.response?.data);
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  }


}
