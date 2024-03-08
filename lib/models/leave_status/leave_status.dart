class LeaveStatusModel {
  List<Table>? table;

  LeaveStatusModel({this.table});

  LeaveStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Table>[];
      json['Table'].forEach((v) {
        table!.add(Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (table != null) {
      data['Table'] = table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  String? userId;
  String? id;
  String? leaveFrom;
  String? leaveTo;
  String? title;
  String? description;
  String? applicationNo;
  String? designationName;
  String? departmentName;
  int? leaveStatusvalue;
  String? leaveStatusId;
  bool? isClosed;
  String? file;
  String? fullName;
  String? leaveType;
  String? leaveStatus;
  String? applyDate;
  bool? isShortLeave;
  double? numberOfDays;
  String? updateLeaveTypeId;
  String? modifiedOn;
  String? approvedByName;
  String? lineManagerName;
  String? attachment;
  dynamic action;

  Table(
      {this.userId,
      this.id,
      this.leaveFrom,
      this.leaveTo,
      this.title,
      this.description,
      this.applicationNo,
      this.designationName,
      this.departmentName,
      this.leaveStatusvalue,
      this.leaveStatusId,
      this.isClosed,
      this.file,
      this.fullName,
      this.leaveType,
      this.leaveStatus,
      this.applyDate,
      this.isShortLeave,
      this.numberOfDays,
      this.updateLeaveTypeId,
      this.modifiedOn,
      this.approvedByName,
      this.lineManagerName,
      this.attachment,
      this.action});

  Table.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    id = json['Id'];
    leaveFrom = json['LeaveFrom'];
    leaveTo = json['LeaveTo'];
    title = json['Title'];
    description = json['Description'];
    applicationNo = json['ApplicationNo'];
    designationName = json['DesignationName'];
    departmentName = json['DepartmentName'];
    leaveStatusvalue = json['LeaveStatusvalue'];
    leaveStatusId = json['LeaveStatusId'];
    isClosed = json['IsClosed'];
    file = json['File'];
    fullName = json['FullName'];
    leaveType = json['LeaveType'];
    leaveStatus = json['LeaveStatus'];
    applyDate = json['ApplyDate'];
    isShortLeave = json['IsShortLeave'];
    numberOfDays = json['NumberOfDays'];
    updateLeaveTypeId = json['UpdateLeaveTypeId'];
    modifiedOn = json['ModifiedOn'];
    approvedByName = json['ApprovedByName'];
    lineManagerName = json['LineManagerName'];
    attachment = json['Attachment'];
    action = json['Action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['Id'] = id;
    data['LeaveFrom'] = leaveFrom;
    data['LeaveTo'] = leaveTo;
    data['Title'] = title;
    data['Description'] = description;
    data['ApplicationNo'] = applicationNo;
    data['DesignationName'] = designationName;
    data['DepartmentName'] = departmentName;
    data['LeaveStatusvalue'] = leaveStatusvalue;
    data['LeaveStatusId'] = leaveStatusId;
    data['IsClosed'] = isClosed;
    data['File'] = file;
    data['FullName'] = fullName;
    data['LeaveType'] = leaveType;
    data['LeaveStatus'] = leaveStatus;
    data['ApplyDate'] = applyDate;
    data['IsShortLeave'] = isShortLeave;
    data['NumberOfDays'] = numberOfDays;
    data['UpdateLeaveTypeId'] = updateLeaveTypeId;
    data['ModifiedOn'] = modifiedOn;
    data['ApprovedByName'] = approvedByName;
    data['LineManagerName'] = lineManagerName;
    data['Attachment'] = attachment;
    data['Action'] = action;
    return data;
  }
}
