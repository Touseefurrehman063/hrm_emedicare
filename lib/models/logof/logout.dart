class LogoutModel {
  int? status;
  String? successMessage;

  LogoutModel({this.status, this.successMessage});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    successMessage = json['SuccessMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['SuccessMessage'] = successMessage;
    return data;
  }
}
