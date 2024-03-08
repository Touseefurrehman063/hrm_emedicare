class LeaveBalanceModel {
  String? leaveTypeName;
  int? allocatedLeaves;
  int? availedLeaves;

  LeaveBalanceModel(
      {this.leaveTypeName, this.allocatedLeaves, this.availedLeaves});

  LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    leaveTypeName = json['LeaveTypeName'];
    allocatedLeaves = json['AllocatedLeaves'];
    availedLeaves = json['AvailedLeaves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LeaveTypeName'] = leaveTypeName;
    data['AllocatedLeaves'] = allocatedLeaves;
    data['AvailedLeaves'] = availedLeaves;
    return data;
  }
}
