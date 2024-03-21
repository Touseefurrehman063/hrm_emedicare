import 'dart:convert';
import 'dart:developer';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/department_model/department_model.dart';
import 'package:hrm_emedicare/models/leave_status/leave_status.dart';
import 'package:hrm_emedicare/models/leave_type_model/leave_balance_model.dart';
import 'package:hrm_emedicare/models/leave_type_model/leave_type_model.dart';
import 'package:hrm_emedicare/models/line_manager_model/line_manager_model.dart';
import 'package:hrm_emedicare/models/submit_model/submit_model.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class LeaveRepository {
  static getdepartment() async {
    String? userid = await Prefs().getUserId();
    var body = {
      "UserId": userid,
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.getdepartment),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        DepartmentModel? data;

        data = DepartmentModel.fromJson(result);

        try {
          var bdody = {
            "DepartmentId": data.data?.first.departmentId,
          };
          var response = await http.post(
              Uri.parse(AppConstants.getSubDepartments),
              body: jsonEncode(bdody),
              headers: headers);
          var result = jsonDecode(response.body);
          if (response.statusCode == 200) {
            // DepartmentModel? data;
            Iterable dt = result['Data'];
            // data = DepartmentModel.fromJson(result);
            List<SubDepartment> subdata =
                dt.map((e) => SubDepartment.fromJson(e)).toList();
            return subdata;
          } else {}
        } catch (e) {
          return e;
        }
      } else {}
    } catch (e) {
      return e;
    }
  }

  static leavetype() async {
    var body = {};
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.leavetype),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Prefs().init();
        Iterable dt = result['Data'];
        List<Leavedata> leavedata =
            dt.map((e) => Leavedata.fromJson(e)).toList();
        return leavedata;
        // AuthController.i.getuserprofile();
        // Showtoaster().classtoaster(result['ErrorMessage']);
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }

  static leavebalance() async {
    var body = {
      "UserId": AuthController.i.userProfile?.id,
      "LeaveTypeId": LeaveController.i.selectleavetype?.id
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.leavebalance),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LeaveBalanceModel? data;

        data = LeaveBalanceModel.fromJson(result);

        LeaveController.i.updateleavebalance(data);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        return data;
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }

  static leaves(dynamic leaveid) async {
    var body = {
      "UserId": AuthController.i.userProfile?.id,
      "LeaveTypeId": leaveid,
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.leavebalance),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LeaveBalanceModel? data;

        data = LeaveBalanceModel.fromJson(result);

        LeaveController.i.updateleavebalance(data);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        return data;
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }

  static submitleave() async {
    String? userid = await Prefs().getUserId();
    var body = {
      "UserId": userid,
      "LeaveTypeId": LeaveController.i.selectleavetype?.id,
      "IsShortLeave": LeaveController.i.selectedLeaveType.toString(),
      "LeaveAttachmentPath": LeaveController.i.pmcfile?.path,
      "CreatedById": AuthController.i.userProfile?.id,
      "Description": LeaveController.i.descripController.toString(),
      "EndDateTime": LeaveController.i.selectedDate1.toString(),
      "IsActive": 1,
      "ModifiedById": AuthController.i.userProfile?.id,
      "NumberOfDays": "",
      "StartDateTime": LeaveController.i.selectedDate1.toString(),
      "Title": LeaveController.i.titleController.toString(),
      "LineManagerId": LeaveController.i.selectedmanager?.id,
      "Remarks": "hshzshshxhx"
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.submitleave),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SubmitModel? data;

        data = SubmitModel.fromJson(result);
        Showtoaster().classtoaster(data.message, ColorManager.kPrimaryColor);
        // LeaveController.i.updateleavebalance(data);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        return data;
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }

  static getleavestatus() async {
    String? userid = await Prefs().getUserId();
    var body = {
      "UserId": userid,
      "Start": 0,
      "Length": 100,
      "FilterRecord": ""
    };

    var headers = {'Content-Type': 'application/json'};

    try {
      LeaveController.i.updateisLeaveLoading(true);
      var response = await http.post(Uri.parse(AppConstants.leaveStatus),
          body: jsonEncode(body), headers: headers);

      // ignore: unused_local_variable
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LeaveStatusModel leavestatusdata =
            LeaveStatusModel.fromJson(jsonDecode(response.body));
        LeaveController.i.updateisLeaveLoading(false);
        return leavestatusdata;
      } else {
        LeaveController.i.updateisLeaveLoading(false);
      }
    } catch (e) {
      LeaveController.i.updateisLeaveLoading(false);
      return e;
    }
  }

  static getLineManagers() async {
    String? userid = await Prefs().getUserId();
    String? organizationid = await Prefs().getOrganizationId();
    var body = {
      "UserId": userid,
      "OrganizationId": organizationid,
    };
    var headers = {'Content-Type': 'application/json'};
    log(jsonEncode(body));
    try {
      var response = await http.post(Uri.parse(AppConstants.getlinemanager),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Iterable dt = result['Data'];
        // ignore: non_constant_identifier_names
        List<Linemanagerdata> Managerdata =
            dt.map((e) => Linemanagerdata.fromJson(e)).toList();
        return Managerdata;
      } else {}
    } catch (e) {
      log(e.toString());
      return e;
    }
  }
}
