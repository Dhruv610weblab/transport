class UpdateStatusModel {
  final bool? status;
  final String? message;
  final dynamic error;

  UpdateStatusModel({
    this.status,
    this.message,
    this.error,
  });

  UpdateStatusModel copyWith({
    bool? status,
    String? message,
    dynamic error,
  }) {
    return UpdateStatusModel(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }

  UpdateStatusModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'error' : error
  };
}