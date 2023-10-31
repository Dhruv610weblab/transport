class UpdateProfileModel {
  final bool? status;
  final String? message;
  final dynamic error;

  UpdateProfileModel({
    this.status,
    this.message,
    this.error,
  });

  UpdateProfileModel copyWith({
    bool? status,
    String? message,
    dynamic error,
  }) {
    return UpdateProfileModel(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }

  UpdateProfileModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'error' : error
  };
}