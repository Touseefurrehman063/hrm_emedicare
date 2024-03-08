class UserProfile {
  int? status;
  String? id;
  String? cNICNumber;
  String? userName;
  String? personTitleId;
  String? title;
  dynamic prefix;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? genderId;
  String? relationshipTypeId;
  String? relationshipTypeName;
  String? guardianName;
  String? maritalStatusId;
  String? maritalStatus;
  String? dateOfBirth;
  dynamic picturePath;
  String? country;
  String? countryId;
  String? stateOrProvince;
  String? stateOrProvinceId;
  String? city;
  String? cityId;
  String? address;
  String? cellNumber;
  String? telephoneNumber;
  String? email;
  String? nOKFirstName;
  String? nOKLastName;
  dynamic nOKRelation;
  dynamic nOKRelationshipTypeId;
  String? nOKCNICNumber;
  String? nOKCellNumber;
  String? bloodGroup;
  String? bloodGroupId;
  String? age;
  String? departmentId;
  String? department;

  UserProfile(
      {this.status,
      this.id,
      this.cNICNumber,
      this.userName,
      this.personTitleId,
      this.title,
      this.prefix,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.genderId,
      this.relationshipTypeId,
      this.relationshipTypeName,
      this.guardianName,
      this.maritalStatusId,
      this.maritalStatus,
      this.dateOfBirth,
      this.picturePath,
      this.country,
      this.countryId,
      this.stateOrProvince,
      this.stateOrProvinceId,
      this.city,
      this.cityId,
      this.address,
      this.cellNumber,
      this.telephoneNumber,
      this.email,
      this.nOKFirstName,
      this.nOKLastName,
      this.nOKRelation,
      this.nOKRelationshipTypeId,
      this.nOKCNICNumber,
      this.nOKCellNumber,
      this.bloodGroup,
      this.bloodGroupId,
      this.age,
      this.departmentId,
      this.department});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    id = json['Id'];
    cNICNumber = json['CNICNumber'];
    userName = json['UserName'];
    personTitleId = json['PersonTitleId'];
    title = json['Title'];
    prefix = json['Prefix'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    gender = json['Gender'];
    genderId = json['GenderId'];
    relationshipTypeId = json['RelationshipTypeId'];
    relationshipTypeName = json['RelationshipTypeName'];
    guardianName = json['GuardianName'];
    maritalStatusId = json['MaritalStatusId'];
    maritalStatus = json['MaritalStatus'];
    dateOfBirth = json['DateOfBirth'];
    picturePath = json['PicturePath'];
    country = json['Country'];
    countryId = json['CountryId'];
    stateOrProvince = json['StateOrProvince'];
    stateOrProvinceId = json['StateOrProvinceId'];
    city = json['City'];
    cityId = json['CityId'];
    address = json['Address'];
    cellNumber = json['CellNumber'];
    telephoneNumber = json['TelephoneNumber'];
    email = json['Email'];
    nOKFirstName = json['NOKFirstName'];
    nOKLastName = json['NOKLastName'];
    nOKRelation = json['NOKRelation'];
    nOKRelationshipTypeId = json['NOKRelationshipTypeId'];
    nOKCNICNumber = json['NOKCNICNumber'];
    nOKCellNumber = json['NOKCellNumber'];
    bloodGroup = json['BloodGroup'];
    bloodGroupId = json['BloodGroupId'];
    age = json['Age'];
    departmentId = json['DepartmentId'];
    department = json['Department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Id'] = id;
    data['CNICNumber'] = cNICNumber;
    data['UserName'] = userName;
    data['PersonTitleId'] = personTitleId;
    data['Title'] = title;
    data['Prefix'] = prefix;
    data['FirstName'] = firstName;
    data['MiddleName'] = middleName;
    data['LastName'] = lastName;
    data['Gender'] = gender;
    data['GenderId'] = genderId;
    data['RelationshipTypeId'] = relationshipTypeId;
    data['RelationshipTypeName'] = relationshipTypeName;
    data['GuardianName'] = guardianName;
    data['MaritalStatusId'] = maritalStatusId;
    data['MaritalStatus'] = maritalStatus;
    data['DateOfBirth'] = dateOfBirth;
    data['PicturePath'] = picturePath;
    data['Country'] = country;
    data['CountryId'] = countryId;
    data['StateOrProvince'] = stateOrProvince;
    data['StateOrProvinceId'] = stateOrProvinceId;
    data['City'] = city;
    data['CityId'] = cityId;
    data['Address'] = address;
    data['CellNumber'] = cellNumber;
    data['TelephoneNumber'] = telephoneNumber;
    data['Email'] = email;
    data['NOKFirstName'] = nOKFirstName;
    data['NOKLastName'] = nOKLastName;
    data['NOKRelation'] = nOKRelation;
    data['NOKRelationshipTypeId'] = nOKRelationshipTypeId;
    data['NOKCNICNumber'] = nOKCNICNumber;
    data['NOKCellNumber'] = nOKCellNumber;
    data['BloodGroup'] = bloodGroup;
    data['BloodGroupId'] = bloodGroupId;
    data['Age'] = age;
    data['DepartmentId'] = departmentId;
    data['Department'] = department;
    return data;
  }
}
