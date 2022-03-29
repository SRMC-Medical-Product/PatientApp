import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:patientapp/helpers/apiheaders.dart';
import 'package:patientapp/screens/auth/login.dart';
import 'package:patientapp/screens/auth/otppage.dart';
import 'package:patientapp/screens/components/appcontroller.dart';

class AuthenticationAPI {
  //Initialize the plugin dio
  //Dio dio = new Dio(dioOptions);
  postLoginUser(
      {required BuildContext context, required String phonenumber}) async {
    FormData data =  FormData.fromMap({
      "number": phonenumber,
    });

    try {
      Response response =
          await dio.post(LOGIN_URL, options: dioOptions, data: data);
      if (response.statusCode == 200) {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(
            customSnackSuccessBar(context, "OTP was sent successfully"));
        Loader.hide();
        return Navigator.push(context,
            CustomSimplePageRoute(page: OtpPage(secretCode: response.data['BODY']['code'],phoneNumber: phonenumber,), routeName: otppage));
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

  postOtpVerification(
      {required BuildContext context,
      required String otp,
      required String code}) async {
    FormData data = FormData.fromMap({"otp": otp, "code": code});

    try {
      Response response = await dio.post(OTP_URL,options : dioOptions,data : data);
      if(response.statusCode == 200) {
        var bearerToken = response.data['BODY']['token'];
        await flutterSecureStorage.write(key: "BEARERTOKEN", value: bearerToken);
        Loader.hide();
        return Navigator.pushReplacement(context, CustomSimplePageRoute(page: const AppScreenController(indexScreen: 0), routeName: appcontroller));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "OTP expired or incorrect.Try again"));
        return false;
      } else if (e.response?.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(
            context, "The OTP entered was incorrect.Try again"));
        return false;
      } else {
        print("Response Code is ${e.response?.statusCode}");
        print("${e.message} + ${e.type} in login api");
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context,
            "Oops! An unknown error occured. Please try again later."));
        return false;
      }
    }
  }

  postRegisterUser(
      {required BuildContext context,
      required String userName,
      required String phonenumber}) async {
    FormData data = FormData.fromMap({"number": phonenumber, "name": userName});

    try {
      Response response =
          await dio.post(REGISTER_URL, options: dioOptions, data: data);
      if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackSuccessBar(context, "OTP was sent successfully"));     
        Loader.hide();
        return Navigator.push(context,
            CustomSimplePageRoute(page: OtpPage(secretCode: response.data['BODY']['code'],phoneNumber: phonenumber,), routeName: otppage));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return false;
      } else if (e.response?.statusCode == 406) {
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return false;
      } else {
        print("Response Code is ${e.response?.statusCode}");
        print("${e.message} + ${e.type} in login api");
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context,
            "Oops! An unknown error occured. Please try again later."));
        return false;
      }
    }
  }

 postResendOtp(
      {required BuildContext context, required String phonenumber}) async {
    FormData data =  FormData.fromMap({
      "number": phonenumber,
    });

    try {
      Response response =
          await dio.post(LOGIN_URL, options: dioOptions, data: data);
      if (response.statusCode == 200) {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(
            customSnackSuccessBar(context, "OTP was sent successfully"));
        Loader.hide();
        dynamic data = {
          "status" : true,
          "code" : response.data['BODY']['code']
        };
        return data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return {"status":false};
      } else if (e.response?.statusCode == 406) {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(
            customsnackErrorBar(context, "${e.response?.data["ERR"]}"));
        return {"status":false};
      } else {
        Loader.hide();
        print("Response Code is ${e.response?.statusCode}");
        print("${e.message} + ${e.type} in login api");
        ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context,
            "Oops! An unknown error occured. Please try again later."));
        return {"status":false};
      }
    }
  }

  ///userLogout - Refers to user performing logout on his own and not through external factors
  performLogOut({required BuildContext context,required bool userLogout}) async {
    await flutterSecureStorage.delete(key: "BEARERTOKEN");
    if(userLogout == true) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackSuccessBar(context, "Logged out successfully"));
    }
    return Navigator.pushReplacement(context,
        CustomSimplePageRoute(page: LoginPage(), routeName: loginpage));
  }
}
