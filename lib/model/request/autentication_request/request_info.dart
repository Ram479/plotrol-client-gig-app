import '../../../helper/api_constants.dart';

class RequestInfo {
  final apiId;
  final ver;
  final ts;
  final action;
  final did;
  final key;
  final msgId;
  final authToken;
  Map? userInfo;
  RequestInfo(
  {this.apiId = ApiConstants.API_MODULE_NAME,
  this.ver = ApiConstants.API_VERSION, 
  this.ts = ApiConstants.API_TS, 
  this.action = "_search", 
  this.did = ApiConstants.API_DID, 
  this.key = ApiConstants.API_KEY,
  this.msgId = ApiConstants.API_MESSAGE_ID, 
  this.authToken,
  this.userInfo
  });
  // var languageProvider = Provider.of<LanguageProvider>(
  //     navigatorKey.currentContext!,
  //     listen: false);
  Map<String, dynamic> toJson() => {
    "apiId": apiId == null ? null : apiId,
    "ver": ver == null ? 1 : ver,
    "ts": ts == null ? null : ts,
    "action": action == null ? null : action,
    "did": did == null ? null : did,
    "key": key == null ? null : key,
    "msgId": '20170310130900|en_IN',
    "authToken": authToken == null ? null : authToken,
    "userInfo": userInfo
  };
}

