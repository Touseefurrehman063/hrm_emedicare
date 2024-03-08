class UserModel {
  dynamic id;
  dynamic cNICNumber;
  dynamic email;
  dynamic username;
  dynamic fullName;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic branchId;
  dynamic status;
  dynamic errorMessage;
  dynamic workingSessionId;
  dynamic countryId;
  dynamic cityId;
  dynamic stateOrProvinceId;
  dynamic districtId;
  dynamic organizationId;
  dynamic cellNumber;
  dynamic telephoneNumber;
  dynamic userAddress;
  dynamic imagePath;
  dynamic userDisplayDesignation;
  dynamic designations;
  dynamic employeeNumber;

  UserModel(
      {this.id,
      this.cNICNumber,
      this.email,
      this.username,
      this.fullName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.branchId,
      this.status,
      this.errorMessage,
      this.workingSessionId,
      this.countryId,
      this.cityId,
      this.stateOrProvinceId,
      this.districtId,
      this.organizationId,
      this.cellNumber,
      this.telephoneNumber,
      this.userAddress,
      this.imagePath,
      this.userDisplayDesignation,
      this.designations,
      this.employeeNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    cNICNumber = json['CNICNumber'];
    email = json['Email'];
    username = json['Username'];
    fullName = json['FullName'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    branchId = json['BranchId'];
    status = json['Status'];
    errorMessage = json['ErrorMessage'];
    workingSessionId = json['WorkingSessionId'];
    countryId = json['CountryId'];
    cityId = json['CityId'];
    stateOrProvinceId = json['StateOrProvinceId'];
    districtId = json['DistrictId'];
    organizationId = json['OrganizationId'];
    cellNumber = json['CellNumber'];
    telephoneNumber = json['TelephoneNumber'];
    userAddress = json['UserAddress'];
    imagePath = json['ImagePath'];
    userDisplayDesignation = json['UserDisplayDesignation'];
    designations = json['Designations'];
    employeeNumber = json['EmployeeNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CNICNumber'] = cNICNumber;
    data['Email'] = email;
    data['Username'] = username;
    data['FullName'] = fullName;
    data['FirstName'] = firstName;
    data['MiddleName'] = middleName;
    data['LastName'] = lastName;
    data['BranchId'] = branchId;
    data['Status'] = status;
    data['ErrorMessage'] = errorMessage;
    data['WorkingSessionId'] = workingSessionId;
    data['CountryId'] = countryId;
    data['CityId'] = cityId;
    data['StateOrProvinceId'] = stateOrProvinceId;
    data['DistrictId'] = districtId;
    data['OrganizationId'] = organizationId;
    data['CellNumber'] = cellNumber;
    data['TelephoneNumber'] = telephoneNumber;
    data['UserAddress'] = userAddress;
    data['ImagePath'] = imagePath;
    data['UserDisplayDesignation'] = userDisplayDesignation;
    data['Designations'] = designations;
    data['EmployeeNumber'] = employeeNumber;
    return data;
  }
}
