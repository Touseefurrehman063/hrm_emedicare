class AttachFileModel {
  int? status;
  String? path;
  String? errorMessage;

  AttachFileModel({this.status, this.path, this.errorMessage});

  AttachFileModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    path = json['Path'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Path'] = path;
    data['ErrorMessage'] = errorMessage;
    return data;
  }
}
