class LoginRequest {
  String? username;
  String? password;
  String? grant_type;
  String? scope;
  String? userType;
  String? tenantId;

  LoginRequest(
      {
        this.username,
        this.password,
        this.grant_type = 'password',
        this.scope = 'read',
        this.tenantId = 'mz',
        this.userType = 'EMPLOYEE',
      });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    grant_type = json['grant_type'];
    scope = json['scope'];
    username = json['username'];
    tenantId = json['tenantId'];
    userType = json['userType'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['scope'] = this.scope;
    data['userType'] = this.userType;
    data['tenantId']= this.tenantId;
    data['username'] = this.username;
    data['grant_type']= this.grant_type;
    return data;
  }
}

class OTPRequest {
  String? mobileNumber;
  String? type;
  String? userType;
  String? tenantId;

  OTPRequest(
      {
        this.mobileNumber,
        this.type = 'login',
        this.tenantId = 'mz',
        this.userType = 'CITIZEN',
      });

  OTPRequest.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mobileNumber = json['mobileNumber'];
    tenantId = json['tenantId'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['userType'] = this.userType;
    data['tenantId']= this.tenantId;
    data['type']= this.type;
    return data;
  }
}

