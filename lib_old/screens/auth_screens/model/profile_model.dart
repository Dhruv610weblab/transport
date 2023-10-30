class ProfileModel {
  final bool? status;
  final String? message;
  final Data? data;

  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  ProfileModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return ProfileModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  ProfileModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data?.toJson()};
}

class Data {
  final Driver? driver;

  Data({
    this.driver,
  });

  Data copyWith({
    Driver? driver,
  }) {
    return Data(
      driver: driver ?? this.driver,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : driver = (json['driver'] as Map<String, dynamic>?) != null
            ? Driver.fromJson(json['driver'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'driver': driver?.toJson()};
}

class Driver {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? dob;
  final int? sinNo;
  final int? phone;
  final String? email;
  final String? address;
  final String? country;
  final String? state;
  final String? city;
  final String? zip;
  final String? licenseNo;
  final String? licenseNoFile;
  final String? licenseClass;
  final String? licenseIssueCountry;
  final String? licenseIssueState;
  final String? licenseIssueDate;
  final String? licenseExpireDate;
  final String? statusInCanada;
  final String? canadaDocFile;
  final String? expireDocDate;
  final String? jobJoinDate;
  final String? offerLetterFile;
  final String? jobLeaveDate;
  final String? emergencyContactName;
  final int? emergencyContactNo;
  final String? emergencyContactAddress;
  final String? deviceId;
  final String? tokens;
  final dynamic oneTimePin;
  final int? verifyOtp;
  final String? otherDoc;
  final String? createdAt;
  final String? updatedAt;

  Driver({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.sinNo,
    this.phone,
    this.email,
    this.address,
    this.country,
    this.state,
    this.city,
    this.zip,
    this.licenseNo,
    this.licenseNoFile,
    this.licenseClass,
    this.licenseIssueCountry,
    this.licenseIssueState,
    this.licenseIssueDate,
    this.licenseExpireDate,
    this.statusInCanada,
    this.canadaDocFile,
    this.expireDocDate,
    this.jobJoinDate,
    this.offerLetterFile,
    this.jobLeaveDate,
    this.emergencyContactName,
    this.emergencyContactNo,
    this.emergencyContactAddress,
    this.deviceId,
    this.tokens,
    this.oneTimePin,
    this.verifyOtp,
    this.otherDoc,
    this.createdAt,
    this.updatedAt,
  });

  Driver copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? dob,
    int? sinNo,
    int? phone,
    String? email,
    String? address,
    String? country,
    String? state,
    String? city,
    String? zip,
    String? licenseNo,
    String? licenseNoFile,
    String? licenseClass,
    String? licenseIssueCountry,
    String? licenseIssueState,
    String? licenseIssueDate,
    String? licenseExpireDate,
    String? statusInCanada,
    String? canadaDocFile,
    String? expireDocDate,
    String? jobJoinDate,
    String? offerLetterFile,
    String? jobLeaveDate,
    String? emergencyContactName,
    int? emergencyContactNo,
    String? emergencyContactAddress,
    String? deviceId,
    String? tokens,
    dynamic oneTimePin,
    int? verifyOtp,
    String? otherDoc,
    String? createdAt,
    String? updatedAt,
  }) {
    return Driver(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      sinNo: sinNo ?? this.sinNo,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      licenseNo: licenseNo ?? this.licenseNo,
      licenseNoFile: licenseNoFile ?? this.licenseNoFile,
      licenseClass: licenseClass ?? this.licenseClass,
      licenseIssueCountry: licenseIssueCountry ?? this.licenseIssueCountry,
      licenseIssueState: licenseIssueState ?? this.licenseIssueState,
      licenseIssueDate: licenseIssueDate ?? this.licenseIssueDate,
      licenseExpireDate: licenseExpireDate ?? this.licenseExpireDate,
      statusInCanada: statusInCanada ?? this.statusInCanada,
      canadaDocFile: canadaDocFile ?? this.canadaDocFile,
      expireDocDate: expireDocDate ?? this.expireDocDate,
      jobJoinDate: jobJoinDate ?? this.jobJoinDate,
      offerLetterFile: offerLetterFile ?? this.offerLetterFile,
      jobLeaveDate: jobLeaveDate ?? this.jobLeaveDate,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactNo: emergencyContactNo ?? this.emergencyContactNo,
      emergencyContactAddress:
          emergencyContactAddress ?? this.emergencyContactAddress,
      deviceId: deviceId ?? this.deviceId,
      tokens: tokens ?? this.tokens,
      oneTimePin: oneTimePin ?? this.oneTimePin,
      verifyOtp: verifyOtp ?? this.verifyOtp,
      otherDoc: otherDoc ?? this.otherDoc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Driver.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        gender = json['gender'] as String?,
        dob = json['dob'] as String?,
        sinNo = json['sin_no'] as int?,
        phone = json['phone'] as int?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        country = json['country'] as String?,
        state = json['state'] as String?,
        city = json['city'] as String?,
        zip = json['zip'] as String?,
        licenseNo = json['license_no'] as String?,
        licenseNoFile = json['license_no_file'] as String?,
        licenseClass = json['license_class'] as String?,
        licenseIssueCountry = json['license_issue_country'] as String?,
        licenseIssueState = json['license_issue_state'] as String?,
        licenseIssueDate = json['license_issue_date'] as String?,
        licenseExpireDate = json['license_expire_date'] as String?,
        statusInCanada = json['status_in_canada'] as String?,
        canadaDocFile = json['canada_doc_file'] as String?,
        expireDocDate = json['expire_doc_date'] as String?,
        jobJoinDate = json['job_join_date'] as String?,
        offerLetterFile = json['offer_letter_file'] as String?,
        jobLeaveDate = json['job_leave_date'] as String?,
        emergencyContactName = json['emergency_contact_name'] as String?,
        emergencyContactNo = json['emergency_contact_no'] as int?,
        emergencyContactAddress = json['emergency_contact_address'] as String?,
        deviceId = json['deviceId'] as String?,
        tokens = json['tokens'] as String?,
        oneTimePin = json['one_time_pin'],
        verifyOtp = json['verify_otp'] as int?,
        otherDoc = json['other_doc'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'dob': dob,
        'sin_no': sinNo,
        'phone': phone,
        'email': email,
        'address': address,
        'country': country,
        'state': state,
        'city': city,
        'zip': zip,
        'license_no': licenseNo,
        'license_no_file': licenseNoFile,
        'license_class': licenseClass,
        'license_issue_country': licenseIssueCountry,
        'license_issue_state': licenseIssueState,
        'license_issue_date': licenseIssueDate,
        'license_expire_date': licenseExpireDate,
        'status_in_canada': statusInCanada,
        'canada_doc_file': canadaDocFile,
        'expire_doc_date': expireDocDate,
        'job_join_date': jobJoinDate,
        'offer_letter_file': offerLetterFile,
        'job_leave_date': jobLeaveDate,
        'emergency_contact_name': emergencyContactName,
        'emergency_contact_no': emergencyContactNo,
        'emergency_contact_address': emergencyContactAddress,
        'deviceId': deviceId,
        'tokens': tokens,
        'one_time_pin': oneTimePin,
        'verify_otp': verifyOtp,
        'other_doc': otherDoc,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
