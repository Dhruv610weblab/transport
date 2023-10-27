class LoginModel {
  final bool? status;
  final String? message;
  final Data? data;
  final Error? error;

  LoginModel({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  LoginModel copyWith({
    bool? status,
    String? message,
    Data? data,
    Error? error,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  LoginModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        error = (json['error'] as Map<String,dynamic>?) != null ? Error.fromJson(json['error'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson(),
    'error' : error?.toJson()
  };
}

class Data {
  final String? token;

  Data({
    this.token,
  });

  Data copyWith({
    String? token,
  }) {
    return Data(
      token: token ?? this.token,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'token' : token
  };
}

class Error {
  final List<String>? username;
  final List<String>? password;

  Error({
    this.username,
    this.password,
  });

  Error copyWith({
    List<String>? username,
    List<String>? password,
  }) {
    return Error(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Error.fromJson(Map<String, dynamic> json)
      : username = (json['username'] as List?)?.map((dynamic e) => e as String).toList(),
        password = (json['password'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'username' : username,
    'password' : password
  };
}