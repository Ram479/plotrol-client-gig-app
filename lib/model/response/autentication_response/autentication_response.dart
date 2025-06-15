class LoginResponse {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;
  UserRequest? userRequest;

  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.userRequest,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    userRequest = json['UserRequest'] != null
        ? UserRequest.fromJson(json['UserRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    data['expires_in'] = expiresIn;
    data['scope'] = scope;
    if (userRequest != null) {
      data['UserRequest'] = userRequest!.toJson();
    }
    return data;
  }
}

class UserSearchResponse{
  List<UserRequest>? user;

  UserSearchResponse({
    this.user,
});

  UserSearchResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null
        ? (json['user'] as List).map((e) => UserRequest.fromJson(e)).toList()
        : [];;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user?.map((e) => e.toJson()).toList();
    return data;
  }
}

class UserRequest {
  int? id;
  String? uuid;
  String? userServiceUuid;
  String? userName;
  String? name;
  String? mobileNumber;
  int? dob;
  String? emailId;
  String? locale;
  String? type;
  List<Role>? roles;
  bool? active;
  String? tenantId;
  String? permanentCity;
  String? permanentPinCode;
  String? photo;
  String? permanentAddress;
  String? password;

  UserRequest({
    this.id,
    this.uuid,
    this.userName,
    this.name,
    this.mobileNumber,
    this.emailId,
    this.locale,
    this.type,
    this.roles,
    this.active,
    this.tenantId,
    this.permanentCity,
    this.permanentAddress,
    this.permanentPinCode,
    this.photo,
    this.userServiceUuid,
    this.dob,
    this.password,
  });

  UserRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    dob = json['dob'];
    userName = json['userName'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    emailId = json['emailId'];
    locale = json['locale'];
    type = json['type'];
    roles = json['roles'] != null
        ? (json['roles'] as List).map((e) => Role.fromJson(e)).toList()
        : [];
    active = json['active'];
    tenantId = json['tenantId'];
    password = json['password'];
    permanentCity = json['permanentCity'];
    permanentAddress = json['permanentAddress'];
    permanentPinCode = json['permanentPinCode'];
    photo = json['photo'];
    userServiceUuid = json['userServiceUuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['userName'] = userName;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    data['dob'] = dob;
    data['emailId'] = emailId;
    data['password'] = password;
    data['locale'] = locale;
    data['type'] = type;
    data['roles'] = roles?.map((e) => e.toJson()).toList();
    data['active'] = active;
    data['tenantId'] = tenantId;
    data['permanentCity'] = permanentCity;
    data['permanentPinCode'] = permanentPinCode;
    data['permanentAddress'] = permanentAddress;
    data['photo'] = photo;
    data['userServiceUuid'] = userServiceUuid;
    return data;
  }
}

class Role {
  String? name;
  String? code;
  String? tenantId;

  Role({this.name, this.code, this.tenantId});

  Role.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['tenantId'] = tenantId;
    return data;
  }
}

class OTPResponse{
  bool? isSuccessful;

  OTPResponse({this.isSuccessful});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    isSuccessful = json['isSuccessful'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccessful'] = isSuccessful;
    return data;
  }
}

class CreateRequest{
  String? name;
  String? otpReference;
  String? username;
  String? tenantId;

  CreateRequest({this.name, this.username, this.tenantId, this.otpReference,});

  CreateRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    otpReference = json['otpReference'];
    username = json['username'];
    tenantId = json['tenantId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['otpReference'] = otpReference;
    data['username'] = username;
    data['tenantId'] = tenantId;
    return data;
  }
}
