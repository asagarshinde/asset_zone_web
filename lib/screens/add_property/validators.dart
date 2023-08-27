
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