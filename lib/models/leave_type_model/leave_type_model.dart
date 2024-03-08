class LeavetypeModel {
  int? status;
  List<Leavedata>? leavedata;

  LeavetypeModel({this.status, this.leavedata});

  LeavetypeModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      leavedata = <Leavedata>[];
      json['Data'].forEach((v) {
        leavedata!.add(Leavedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    if (leavedata != null) {
      data['Data'] = leavedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leavedata {
  String? id;
  String? name;

  Leavedata({this.id, this.name});

  Leavedata.fromJson(Map<String, dynamic> json) {
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
