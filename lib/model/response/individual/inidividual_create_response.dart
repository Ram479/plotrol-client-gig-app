import 'individual_response.dart';

class IndividualCreateResponse {
  Individual? individual;

  IndividualCreateResponse({this.individual});

  IndividualCreateResponse.fromJson(Map<String, dynamic> json) {
    individual = json['Individual'] != null ? Individual.fromJson(json['Individual']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (individual != null) {
      data['Individual'] = individual!.toJson();
    }
    return data;
  }
}
