import 'package:image_picker/image_picker.dart';

class SignUpBodyModel {
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? password;
  String? refCode;
  String? deviceToken;
  int? guestId;
  String? name;
  XFile? image;

  SignUpBodyModel({
    this.fName,
    this.lName,
    this.phone,
    this.email = '',
    this.password,
    this.refCode = '',
    this.deviceToken,
    this.guestId,
    this.name,
    this.image,
  });

  // SignUpBodyModel.fromJson(Map<String, dynamic> json) {
  //   fName = json['f_name'];
  //   lName = json['l_name'];
  //   phone = json['phone'];
  //   email = json['email'];
  //   password = json['password'];
  //   refCode = json['ref_code'];
  //   deviceToken = json['cm_firebase_token'];
  //   guestId = json['guest_id'];
  //   name = json['name'];
  // }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    if(fName != null) data['f_name'] = fName!;
    if(lName != null) data['l_name'] = lName!;
    if(phone != null) data['phone'] = phone!;
    if(email != null) data['email'] = email!;
    if(password != null) data['password'] = password!;
    if(refCode != null) data['ref_code'] = refCode!;
    if(deviceToken != null) data['cm_firebase_token'] = deviceToken!;
    if(guestId != null) data['guest_id'] = guestId!.toString();
    if(name != null) data['name'] = name!;
    return data;
  }
}
