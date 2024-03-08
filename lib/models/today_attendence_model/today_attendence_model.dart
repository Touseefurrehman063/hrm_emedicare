class TodayAttendenceModel {
  int? status;
  List<Data>? data;
  int? totalRecord;
  int? filterRecord;

  TodayAttendenceModel(
      {this.status, this.data, this.totalRecord, this.filterRecord});

  TodayAttendenceModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    totalRecord = json['TotalRecord'];
    filterRecord = json['FilterRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['TotalRecord'] = totalRecord;
    data['FilterRecord'] = filterRecord;
    return data;
  }
}

class Data {
  String? shiftId;
  String? date;
  String? status;
  dynamic remarks;
  dynamic designationName;
  dynamic designationId;
  dynamic departmentName;
  dynamic departmentId;
  String? hoursWorked;
  String? timeCategory;
  String? expectedHours;
  String? timeDiff;
  dynamic timeShiftName;
  dynamic employeeNumber;
  dynamic genderId;
  dynamic genderName;
  dynamic userName;
  dynamic cellNumber;
  String? timeIn;
  String? timeOut;
  String? overTimeIn;
  String? overTimeOut;
  bool? isManual;
  dynamic manualText;
  int? srNo;
  bool? isManualTimeIn;
  bool? isManualTimeOut;

  Data(
      {this.shiftId,
      this.date,
      this.status,
      this.remarks,
      this.designationName,
      this.designationId,
      this.departmentName,
      this.departmentId,
      this.hoursWorked,
      this.timeCategory,
      this.expectedHours,
      this.timeDiff,
      this.timeShiftName,
      this.employeeNumber,
      this.genderId,
      this.genderName,
      this.userName,
      this.cellNumber,
      this.timeIn,
      this.timeOut,
      this.overTimeIn,
      this.overTimeOut,
      this.isManual,
      this.manualText,
      this.srNo,
      this.isManualTimeIn,
      this.isManualTimeOut});

  Data.fromJson(Map<String, dynamic> json) {
    shiftId = json['ShiftId'];
    date = json['Date'];
    status = json['Status'];
    remarks = json['Remarks'];
    designationName = json['DesignationName'];
    designationId = json['DesignationId'];
    departmentName = json['DepartmentName'];
    departmentId = json['DepartmentId'];
    hoursWorked = json['HoursWorked'];
    timeCategory = json['TimeCategory'];
    expectedHours = json['ExpectedHours'];
    timeDiff = json['TimeDiff'];
    timeShiftName = json['TimeShiftName'];
    employeeNumber = json['EmployeeNumber'];
    genderId = json['GenderId'];
    genderName = json['GenderName'];
    userName = json['UserName'];
    cellNumber = json['CellNumber'];
    timeIn = json['TimeIn'];
    timeOut = json['TimeOut'];
    overTimeIn = json['OverTimeIn'];
    overTimeOut = json['OverTimeOut'];
    isManual = json['IsManual'];
    manualText = json['ManualText'];
    srNo = json['SrNo'];
    isManualTimeIn = json['IsManualTimeIn'];
    isManualTimeOut = json['IsManualTimeOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ShiftId'] = shiftId;
    data['Date'] = date;
    data['Status'] = status;
    data['Remarks'] = remarks;
    data['DesignationName'] = designationName;
    data['DesignationId'] = designationId;
    data['DepartmentName'] = departmentName;
    data['DepartmentId'] = departmentId;
    data['HoursWorked'] = hoursWorked;
    data['TimeCategory'] = timeCategory;
    data['ExpectedHours'] = expectedHours;
    data['TimeDiff'] = timeDiff;
    data['TimeShiftName'] = timeShiftName;
    data['EmployeeNumber'] = employeeNumber;
    data['GenderId'] = genderId;
    data['GenderName'] = genderName;
    data['UserName'] = userName;
    data['CellNumber'] = cellNumber;
    data['TimeIn'] = timeIn;
    data['TimeOut'] = timeOut;
    data['OverTimeIn'] = overTimeIn;
    data['OverTimeOut'] = overTimeOut;
    data['IsManual'] = isManual;
    data['ManualText'] = manualText;
    data['SrNo'] = srNo;
    data['IsManualTimeIn'] = isManualTimeIn;
    data['IsManualTimeOut'] = isManualTimeOut;
    return data;
  }
}
