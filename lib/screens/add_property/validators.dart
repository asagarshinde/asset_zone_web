
defaultTextValidators (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
}

emailValidator(value) {
  if (value == null ||
      value.isEmpty ||
      !value.contains('@') ||
      !value.contains('.')) {
    return 'Invalid Email';
  }
  return null;
}

mobileNumberValidator(value){
  //if (value != null)
  if (value?.length != 10) {
    return 'Mobile Number must be of 10 digit';
  } else {
    return null;
  }
}

panValidator(value) {
  if (value.toString().isEmpty) {
    return "";
  }
  if (!value!.contains(
      r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$')) {
    return 'Pan Number is not valid';
  } else {
    return null;
  }
}


isValidPincode(String pincode) {
  // Check if the pincode is a 6-digit number
  if (pincode.isEmpty) {
    return "Please enter pincode";
  }

  // Remove any non-digit characters (like spaces)
  String cleanedPincode = pincode.replaceAll(RegExp(r'[^0-9]'), '');

  // Check if the cleaned pincode has exactly 6 digits
  if (cleanedPincode.length != 6) {
    return "Pincode should be 6 digits";
  }

  return null; // Return true if the pincode is valid
}


isValidDouble(String input) {
  if (input.isEmpty) {
    return "Please enter valid numbers";
  }

  // Remove any non-digit characters except for the decimal point
  String cleanedInput = input.replaceAll(RegExp(r'[^\d.]'), '');

  // Check if the cleaned input is a valid number
  try {
    double parsedValue = double.parse(cleanedInput);
    // You can also add additional conditions for valid price range, if needed
    return parsedValue; // Check for positive value
  } catch (e) {
    return null;
  }
}