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

   Future<dynamic> getProfileUpdate({required BuildContext context,String? patientId}) async {
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    
    try {
      Response response = await dio.get("$PROFILE_SCREEN_URL?patientid=$patientId",options : dioOptions);
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

 
   putProfile({required BuildContext context,required String patientId,String? filePath,String? fileName,required String name,String? relation,String? gender, String? blood,required String dob,required String email }) async {
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    
    FormData data = FormData.fromMap({
      "patientid" : patientId,
      "name" :name,
      "relation" : relation,
      "gender" : gender,
      "blood" : blood,
      "dob" : dob,
      "email" : email,
      "img" : isEmptyOrNull(filePath) != true ? await MultipartFile.fromFile("$filePath", filename: fileName) : "",
    });

    try {
      Response response = await dio.put(PROFILE_SCREEN_URL,options : dioOptions,data : data);
      if(response.statusCode == 200) { 
        Loader.hide();
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(customSnackSuccessBar(context, "Profile updated successfully"));
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