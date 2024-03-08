class DepartmentModel {
  int? status;
  List<Data>? data;

  DepartmentModel({this.status, this.data});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? departmentId;

  Data({this.userId, this.departmentId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    departmentId = json['DepartmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['DepartmentId'] = departmentId;
    return data;
  }
}

class SubDepartment {
  String? id;
  String? name;

  SubDepartment({this.id, this.name});

  SubDepartment.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
