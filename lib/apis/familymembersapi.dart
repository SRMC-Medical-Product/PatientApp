import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/screens/components/appcontroller.dart';
import 'package:patientapp/screens/profile/familymembers.dart';

class FamilyMembersApi{
  Future<void> getFamilyMembers({required BuildContext context}) async {
     var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    
    try {
      Response response = await dio.get(FAMILY_MEMBERS_SCREEN_URL,options : dioOptions);
      if(response.statusCode == 200) { 
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
        AuthenticationAPI().performLogOut(context:context,userLogout: false);
        return defaultErrordialog(context: context, errorCode: ES_0041);
      } else if(e.response?.statusCode == 500){
        //Internal server error
               return defaultErrordialog(context: context, errorCode: ES_0052,onTapBtn: () => Navigator.of(context).pop());
  } else if(e.response?.statusCode == 503){
        //When server is under maintenance
        //TODO : redirect to Maintenance page
        return null;
      }else {
        print("${e.message} + ${e.type} in family members screen api");
        //Logout
        return defaultErrordialog(context: context, errorCode: ES_0040,);
      } 
    }
  } 

   postFamilyMembers(
      {required BuildContext context,String? filePath,String? fileName,required String name,required String? relation,String? gender, String? blood,String? dob,String? email }) async {
    FormData data = FormData.fromMap({
      "name": name,
      "relation": relation,
      "gender": gender,
      "blood": blood,
      "dob": dob,
      "email": email,
      "img" : isEmptyOrNull(filePath) != true ? await MultipartFile.fromFile("$filePath", filename: fileName) : "",

    });

       var bearerToken = await flutterSecureStorage.read(key: "BEARERTOKEN");
    dio.options.headers["authorization"] = "Bearer $bearerToken";
    
    try {
      Response response =
          await dio.post(FAMILY_MEMBERS_SCREEN_URL, options: dioOptions, data: data);
      if (response.statusCode == 200) {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(
            customSnackSuccessBar(context, "Family Members Added Successfully"));
        Loader.hide();
        return Navigator.pushReplacement(context,
            CustomSimplePageRoute(page: const AppScreenController(indexScreen: 3),routeName: appcontroller));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return false;
      } else if (e.response?.statusCode == 406) {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return false;
      } else {
        Loader.hide();
        print("Response Code is ${e.response?.statusCode}");
        print("${e.message} + ${e.type} in login api");
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context,
            "Oops! An unknown error occured. Please try again later."));
        return false;
      }
    }
  }

}