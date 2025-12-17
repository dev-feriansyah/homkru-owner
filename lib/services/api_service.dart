// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fortune/core/utils/navigation_service.dart';
// import 'package:fortune/routes/app_routes.dart';
// import 'package:fortune/theme/theme_helper.dart';
// import 'package:fortune/widgets/common_widget.dart';
// import 'package:http/http.dart' as http;
// import '../core/utils/constants.dart';



// class ApiService {

//   String access_token = "";

//   //Create common function for post request endpoint name and body data need
//   Future<Map<String, dynamic>?> post(String endpoint, data) async {
//     try {
//       access_token = await getAccessToken();
//      // print("Token ==>>"+access_token);
//       var headerData = {
//         "device_id": '12345',
//         "authorization": "Bearer ${access_token}",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         "true", // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//       };
//       print("------------------------>$data");
//       print("------------------------>${Constants.baseUrl + endpoint}");

//       final response = await http.post(Uri.parse(Constants.baseUrl + endpoint),
//           headers: headerData, body: data);
//       print("+++++++++++++response++++++++++++++${response.statusCode}");
//       print("+++++++++++++response++++++++++++++${response.body}");
//       if(response.statusCode == 403){
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.clear();
//         final responseBody = json.decode(response.body);
//         CommonWidget().showToast (
//           responseBody['message'] ?? 'lbl_your_account_login_another_mobile'.tr, // Use the message from the response or a default message
//           appTheme.amber300,
//           ToastGravity.BOTTOM,
//         );

//         NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginRegisterScreen);
//       }
//       else if (response.statusCode == 200) {
//         return json.decode(response.body);
//       }else {
//          return {"status": "Server error", "message":json.decode(response.body)['message']};
//       }
//     } catch(e) {
//       CommonWidget().showToast(e.toString(), appTheme.lightRed, ToastGravity.BOTTOM);
//       return {"status": "Server error", "message":e.toString()};
//     }
//   }

//   Future<Map<String, dynamic>?> get(String endpoint) async {
//     try {
//       final accessToken = await getAccessToken();
//       final headerData = {
//         "Authorization": "Bearer $accessToken",
//       };

//       print("+++++++++++++api endpoint++++++++++++++${Constants.baseUrl}$endpoint");
//       final uri = Uri.parse('${Constants.baseUrl}$endpoint');
//       final response = await http.get(uri, headers: headerData);
//       print("+++++++++++++response++++++++++++++${response.statusCode}");
//       print("+++++++++++++response++++++++++++++${response.body}");

//       if(response.statusCode == 403 ) {
//         final SharedPrefrences prefs = await SharedPreferences.getInstance();
//         prefs.clear();
//         final responseBody = json.decode(response.body);
        
//         CommonWidget().showToast (
//           responseBody['message'] ?? 'lbl_your_account_login_another_mobile'.tr, // Use the message from the response or a default message
//           appTheme.gray500,
//           ToastGravity.BOTTOM,
//         );

//         NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginRequestOtpScreen);
//       }
//       else if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else {
//         final responseBody = json.decode(response.body);
//         return {
//           "status": "Error",
//           "message": responseBody['message'] ?? 'An unknown error occurred'
//         };
//       }
//     } catch (e) {
//       print("Error: $e");
//       return {
//         "status": "Server error",
//         "message": e.toString()
//       };
//     }
//   }

//    //Create common function for put request endpoint name and body data need
//   Future<Map<String, dynamic>?> put(String endpoint, http.MultipartRequest request) async {
//     try {
//       var accessToken = await getAccessToken();
//       request.headers.addAll({
//         "device_id": '12345',
//         "authorization": "Bearer $accessToken",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//       });

//       print("LINE105");
//       print(request);
//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();

//       print("+++++++++++++response++++++++++++++$responseBody");
//       if(response.statusCode == 403){
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.clear();
//         NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginRequestOtpScreen);
//       }
//       else if (response.statusCode == 200) {
//         return json.decode(responseBody);
//       } else {
//         return {"status": "Server error", "message": json.decode(responseBody)['message']};
//       }
//     } catch (e) {
//       return {"servererror": "Server error"};
//     }
//   }


//   Future<Map<String, dynamic>?> deleteList(String endpoint, Map<String, dynamic> req) async {
//     try {
//       access_token = await getAccessToken();

//       var headerData = {
//         "device_id": '12345',
//         "authorization": "Bearer ${access_token}",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         "true", // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//       };

//       print("------------------------>${Constants.baseUrl + endpoint}");
//       final response = await http.delete(
//         Uri.parse(Constants.baseUrl + endpoint),
//         headers: headerData,
//         body: json.encode(req), // Assuming the data needs to be encoded
//       );

//       print("+++++++++++++response++++++++++++++${response.statusCode}");
//       print("+++++++++++++response++++++++++++++${response.body}");

//       if (response.statusCode == 403) {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.clear();
//         final responseBody = json.decode(response.body);
//         CommonWidget().showToast (
//           responseBody['message'] ?? 'lbl_your_account_login_another_mobile'.tr, // Use the message from the response or a default message
//           appTheme.gray500,
//           ToastGravity.BOTTOM,
//         );
//         NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginRequestOtpScreen);
//       } else if (response.statusCode == 200) {

//         return json.decode(response.body);
//       } else {
//         return {
//           "status": "Server error",
//           "message": json.decode(response.body)['message']
//         };
//       }
//     } catch (e) {
//       CommonWidget().showToast(e.toString(), appTheme.lightRed, ToastGravity.BOTTOM);
//       return {"status": "Server error", "message": e.toString()};
//     }
//   }

// }