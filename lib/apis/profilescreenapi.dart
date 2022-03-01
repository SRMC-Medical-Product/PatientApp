import 'package:patientapp/helpers/apiheaders.dart';

class ProfileScreenApi {

   Future<void> getProfile({required BuildContext context}) async {
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    
    try {
      Response response = await dio.get(PROFILE_SCREEN_URL,options : dioOptions);
      if(response.statusCode == 200) { 
        print(response.data);
        return response.data['BODY'];
      }
    }
    on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        //Send Timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pop());
      } else if (e.type == DioErrorType.receiveTimeout) {
        //Receive timeout
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pop());
        } else if (e.type == DioErrorType.connectTimeout) {
        //When connection is taking too long or not connecting at all
        return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pop());
         } else if(e.response?.statusCode == 401){
        //When anonymous user is requesting for data
        AuthenticationAPI().performLogOut(context: context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
               return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pop());
  } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in profile screen api");
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  } 
}