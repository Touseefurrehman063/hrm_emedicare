class LineManagerModel {
  int? status;
  List<Linemanagerdata>? data;

  LineManagerModel({this.status, this.data});

  LineManagerModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      data = <Linemanagerdata>[];
      json['Data'].forEach((v) {
        data!.add(Linemanagerdata.fromJson(v));
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

class Linemanagerdata {
  String? id;
  String? name;

  Linemanagerdata({this.id, this.name});

  Linemanagerdata.fromJson(Map<String, dynamic> json) {
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
