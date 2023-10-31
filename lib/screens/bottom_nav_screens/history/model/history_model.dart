class HistoryModel {
  final bool? status;
  final String? message;
  final Data? data;

  HistoryModel({
    this.status,
    this.message,
    this.data,
  });

  HistoryModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return HistoryModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  HistoryModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data?.toJson()};
}

class Data {
  final List<Routes>? routes;

  Data({
    this.routes,
  });

  Data copyWith({
    List<Routes>? routes,
  }) {
    return Data(
      routes: routes ?? this.routes,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : routes = (json['routes'] as List?)
            ?.map((dynamic e) => Routes.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'routes': routes?.map((e) => e.toJson()).toList()};
}

class Routes {
  final int? id;
  final int? vendorId;
  final int? driverId;
  final int? vehicleId;
  final String? routeName;
  final String? pickupAdd1;
  final dynamic pickupAdd2;
  final String? pickupCity;
  final String? pickupState;
  final String? pickupCountry;
  final String? pickupZip;
  final String? shipAdd1;
  final dynamic shipAdd2;
  final String? shipCity;
  final String? shipState;
  final String? shipCountry;
  final String? shipZip;
  final String? loadType;
  final int? loadQuantity;
  final String? pickupDate;
  final String? shipDate;
  final dynamic info;
  final String? status;
  final int? autoAssign;
  final String? createdAt;
  final String? updatedAt;

  Routes({
    this.id,
    this.vendorId,
    this.driverId,
    this.vehicleId,
    this.routeName,
    this.pickupAdd1,
    this.pickupAdd2,
    this.pickupCity,
    this.pickupState,
    this.pickupCountry,
    this.pickupZip,
    this.shipAdd1,
    this.shipAdd2,
    this.shipCity,
    this.shipState,
    this.shipCountry,
    this.shipZip,
    this.loadType,
    this.loadQuantity,
    this.pickupDate,
    this.shipDate,
    this.info,
    this.status,
    this.autoAssign,
    this.createdAt,
    this.updatedAt,
  });

  Routes copyWith({
    int? id,
    int? vendorId,
    int? driverId,
    int? vehicleId,
    String? routeName,
    String? pickupAdd1,
    dynamic pickupAdd2,
    String? pickupCity,
    String? pickupState,
    String? pickupCountry,
    String? pickupZip,
    String? shipAdd1,
    dynamic shipAdd2,
    String? shipCity,
    String? shipState,
    String? shipCountry,
    String? shipZip,
    String? loadType,
    int? loadQuantity,
    String? pickupDate,
    String? shipDate,
    dynamic info,
    String? status,
    int? autoAssign,
    String? createdAt,
    String? updatedAt,
  }) {
    return Routes(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      driverId: driverId ?? this.driverId,
      vehicleId: vehicleId ?? this.vehicleId,
      routeName: routeName ?? this.routeName,
      pickupAdd1: pickupAdd1 ?? this.pickupAdd1,
      pickupAdd2: pickupAdd2 ?? this.pickupAdd2,
      pickupCity: pickupCity ?? this.pickupCity,
      pickupState: pickupState ?? this.pickupState,
      pickupCountry: pickupCountry ?? this.pickupCountry,
      pickupZip: pickupZip ?? this.pickupZip,
      shipAdd1: shipAdd1 ?? this.shipAdd1,
      shipAdd2: shipAdd2 ?? this.shipAdd2,
      shipCity: shipCity ?? this.shipCity,
      shipState: shipState ?? this.shipState,
      shipCountry: shipCountry ?? this.shipCountry,
      shipZip: shipZip ?? this.shipZip,
      loadType: loadType ?? this.loadType,
      loadQuantity: loadQuantity ?? this.loadQuantity,
      pickupDate: pickupDate ?? this.pickupDate,
      shipDate: shipDate ?? this.shipDate,
      info: info ?? this.info,
      status: status ?? this.status,
      autoAssign: autoAssign ?? this.autoAssign,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Routes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        vendorId = json['vendor_id'] as int?,
        driverId = json['driver_id'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        routeName = json['route_name'] as String?,
        pickupAdd1 = json['pickup_add1'] as String?,
        pickupAdd2 = json['pickup_add2'],
        pickupCity = json['pickup_city'] as String?,
        pickupState = json['pickup_state'] as String?,
        pickupCountry = json['pickup_country'] as String?,
        pickupZip = json['pickup_zip'] as String?,
        shipAdd1 = json['ship_add1'] as String?,
        shipAdd2 = json['ship_add2'],
        shipCity = json['ship_city'] as String?,
        shipState = json['ship_state'] as String?,
        shipCountry = json['ship_country'] as String?,
        shipZip = json['ship_zip'] as String?,
        loadType = json['load_type'] as String?,
        loadQuantity = json['load_quantity'] as int?,
        pickupDate = json['pickup_date'] as String?,
        shipDate = json['ship_date'] as String?,
        info = json['info'],
        status = json['status'] as String?,
        autoAssign = json['auto_assign'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'vendor_id': vendorId,
        'driver_id': driverId,
        'vehicle_id': vehicleId,
        'route_name': routeName,
        'pickup_add1': pickupAdd1,
        'pickup_add2': pickupAdd2,
        'pickup_city': pickupCity,
        'pickup_state': pickupState,
        'pickup_country': pickupCountry,
        'pickup_zip': pickupZip,
        'ship_add1': shipAdd1,
        'ship_add2': shipAdd2,
        'ship_city': shipCity,
        'ship_state': shipState,
        'ship_country': shipCountry,
        'ship_zip': shipZip,
        'load_type': loadType,
        'load_quantity': loadQuantity,
        'pickup_date': pickupDate,
        'ship_date': shipDate,
        'info': info,
        'status': status,
        'auto_assign': autoAssign,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
