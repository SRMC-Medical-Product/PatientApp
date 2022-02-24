import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/screens/auth/login.dart';
import 'package:patientapp/screens/components/appcontroller.dart';

class AuthenticationAPI {
  //Initialize the plugin dio
  //Dio dio = new Dio(dioOptions);
  postLoginUser({required BuildContext context,required String phonenumber}) async {
    FormData data = new FormData.fromMap({
      "number": phonenumber,
    });

    try {
      // Response response = await dio.post(LOGIN_URL,options : dioOptions,data : data);
      // if(response.statusCode == 200) {
      //   print(response.data);
      //   ScaffoldMessenger.of(context).showSnackBar(customSnackSuccessBar(context, "OTP was sent successfully"));
      //   return response.data;
      // }
    } on DioError catch (e) {
        if(e.response?.statusCode == 404){
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Number does not exist.Try Sign Up"));
          return false;
        }
        else{
          print("Response Code is ${e.response?.statusCode}");
          print("${e.message} + ${e.type} in login api");
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Oops! An unknown error occured. Please try again later."));
          return false;
        }   
    }
  }


  postOtpVerification({required BuildContext context,required String otp,required String code}) async {
    FormData data = new FormData.fromMap({
      "otp" : otp,
      "code" : code
    });

    try {
      
      // Response response = await dio.post(VALIDATION_URL,options : dioOptions,data : data);
      // if(response.statusCode == 200) {
      //   print(response.data);
      //   var bearerToken = response.data['RESPONSE']['token'];
      //   await flutterSecureStorage.write(key: "BEARERTOKEN", value: bearerToken);
      //   return Navigator.pushReplacement(context, CustomSimplePageRoute(page: AppScreenController(indexScreen: 0), routeName: appcontroller));
      // }
    } on DioError catch (e) {
        if(e.response?.statusCode == 400){
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "OTP expired.Try again"));
          return false;
        }else if(e.response?.statusCode == 409){
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "The OTP entered was incorrect.Try again"));
          return false;
        }
        else{
          print("Response Code is ${e.response?.statusCode}");
          print("${e.message} + ${e.type} in login api");
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Oops! An unknown error occured. Please try again later."));
          return false;
        }   
    }
  }

  postRegisterUser({required BuildContext context,required String userName,required String phonenumber}) async {
    FormData data = new FormData.fromMap({
      "number": phonenumber,
      "name" : userName
    });

    try {
      // Response response = await dio.post(SIGNUP_URL,options : dioOptions,data : data);
      // if(response.statusCode == 200) {
      //   ScaffoldMessenger.of(context).showSnackBar(customSnackSuccessBar(context, "OTP was sent successfully"));
      //   print(response.data);
      //   return response.data;
      // }
    } on DioError catch (e) {
        if(e.response?.statusCode == 409){
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Number already exists.Try with new number"));
          return false;
        }
        else{
          print("Response Code is ${e.response?.statusCode}");
          print("${e.message} + ${e.type} in login api");
          ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Oops! An unknown error occured. Please try again later."));
          return false;
        }   
    }
  }

 performLogOut(BuildContext context)async{
    await flutterSecureStorage.delete(key: "BEARERTOKEN");
    return Navigator.pushReplacement(context, CustomSimplePageRoute(page: LoginPage(), routeName: loginpage));
  }

}
