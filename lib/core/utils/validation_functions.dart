import 'package:intl/intl.dart';

bool isValidPhone(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == null ? true : inputString.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    if(inputString.length > 16 || inputString.length < 6) return false;
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}


String? validatePhoneNumber(String? value) {
  final phoneRegExp = RegExp(r'^\+?1?\d{9,15}$');
  if (value == null || value.isEmpty) {
    return 'please enter phone';
  }if(value.length>10||value.length<10){
    return 'please enter valid phone';
  }
  else if (!phoneRegExp.hasMatch(value)) {
    return 'please enter valid phone';
  }
  return null;
}

bool isValidPassword(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == null ? true : inputString.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    const pattern = r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isText(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == '' ? true : inputString!.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    const pattern = r'^[a-zA-Z\s-]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}


String? checkEmpty(String? value, String error) {
  if (value == null || value.isEmpty) {
    return error;
  } else {
    return null;
  }
}

bool isPlanExpired(String planExpiringDate) {
  // Parse the plan expiring date from the string
  DateTime expiryDate = DateTime.parse(planExpiringDate);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Compare the dates
  if (currentDate.isAfter(expiryDate)) {
    // Plan is expired
    return true;
  } else {
    // Plan is still valid
    return false;
  }
}




String convertDateFormat(String originalDate) {
  try {
    // Parse the original date (dd-MMM-yyyy)
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(originalDate);

    // Format it to the new format (yyyy-MM-dd)
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return formattedDate;
  } catch (e) {
    // Handle the error gracefully, return null or an error message if parsing fails
    print('Error parsing date: $e');
    return 'Invalid date format';
  }
}