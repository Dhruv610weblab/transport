class RoutesModel {
  final bool? status;
  final String? message;
  final Data? data;

  RoutesModel({
    this.status,
    this.message,
    this.data,
  });

  RoutesModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return RoutesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  RoutesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
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
      : routes = (json['routes'] as List?)?.map((dynamic e) => Routes.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'routes' : routes?.map((e) => e.toJson()).toList()
  };
}

class Routes {
  final int? id;
  final int? vendorId;
  final int? driverId;
  final int? vehicleId;
  final int? routesId;
  final String? pickupEmail;
  final int? pickupPhone;
  final String? pickupAdd1;
  final dynamic pickupAdd2;
  final String? pickupCity;
  final String? pickupState;
  final String? pickupCountry;
  final String? pickupZip;
  final String? shipFirstName;
  final String? shipLastName;
  final String? shipEmail;
  final int? shipPhone;
  final String? shipAdd1;
  final dynamic shipAdd2;
  final String? shipCity;
  final String? shipState;
  final String? shipCountry;
  final String? shipZip;
  final String? loadType;
  final int? loadQuantity;
  final String? loadUnit;
  final String? pickupDate;
  final String? shipDate;
  final dynamic info;
  final String? status;
  final int? autoAssign;
  final dynamic tripStartDate;
  final dynamic tripEndDate;
  final dynamic latitude;
  final dynamic longitude;
  final String? createdAt;
  final String? updatedAt;
  final RoutesTo? routesTo;

  Routes({
    this.id,
    this.vendorId,
    this.driverId,
    this.vehicleId,
    this.routesId,
    this.pickupEmail,
    this.pickupPhone,
    this.pickupAdd1,
    this.pickupAdd2,
    this.pickupCity,
    this.pickupState,
    this.pickupCountry,
    this.pickupZip,
    this.shipFirstName,
    this.shipLastName,
    this.shipEmail,
    this.shipPhone,
    this.shipAdd1,
    this.shipAdd2,
    this.shipCity,
    this.shipState,
    this.shipCountry,
    this.shipZip,
    this.loadType,
    this.loadQuantity,
    this.loadUnit,
    this.pickupDate,
    this.shipDate,
    this.info,
    this.status,
    this.autoAssign,
    this.tripStartDate,
    this.tripEndDate,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.routesTo,
  });

  Routes copyWith({
    int? id,
    int? vendorId,
    int? driverId,
    int? vehicleId,
    int? routesId,
    String? pickupEmail,
    int? pickupPhone,
    String? pickupAdd1,
    dynamic pickupAdd2,
    String? pickupCity,
    String? pickupState,
    String? pickupCountry,
    String? pickupZip,
    String? shipFirstName,
    String? shipLastName,
    String? shipEmail,
    int? shipPhone,
    String? shipAdd1,
    dynamic shipAdd2,
    String? shipCity,
    String? shipState,
    String? shipCountry,
    String? shipZip,
    String? loadType,
    int? loadQuantity,
    String? loadUnit,
    String? pickupDate,
    String? shipDate,
    dynamic info,
    String? status,
    int? autoAssign,
    dynamic tripStartDate,
    dynamic tripEndDate,
    dynamic latitude,
    dynamic longitude,
    String? createdAt,
    String? updatedAt,
    RoutesTo? routesTo,
  }) {
    return Routes(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      driverId: driverId ?? this.driverId,
      vehicleId: vehicleId ?? this.vehicleId,
      routesId: routesId ?? this.routesId,
      pickupEmail: pickupEmail ?? this.pickupEmail,
      pickupPhone: pickupPhone ?? this.pickupPhone,
      pickupAdd1: pickupAdd1 ?? this.pickupAdd1,
      pickupAdd2: pickupAdd2 ?? this.pickupAdd2,
      pickupCity: pickupCity ?? this.pickupCity,
      pickupState: pickupState ?? this.pickupState,
      pickupCountry: pickupCountry ?? this.pickupCountry,
      pickupZip: pickupZip ?? this.pickupZip,
      shipFirstName: shipFirstName ?? this.shipFirstName,
      shipLastName: shipLastName ?? this.shipLastName,
      shipEmail: shipEmail ?? this.shipEmail,
      shipPhone: shipPhone ?? this.shipPhone,
      shipAdd1: shipAdd1 ?? this.shipAdd1,
      shipAdd2: shipAdd2 ?? this.shipAdd2,
      shipCity: shipCity ?? this.shipCity,
      shipState: shipState ?? this.shipState,
      shipCountry: shipCountry ?? this.shipCountry,
      shipZip: shipZip ?? this.shipZip,
      loadType: loadType ?? this.loadType,
      loadQuantity: loadQuantity ?? this.loadQuantity,
      loadUnit: loadUnit ?? this.loadUnit,
      pickupDate: pickupDate ?? this.pickupDate,
      shipDate: shipDate ?? this.shipDate,
      info: info ?? this.info,
      status: status ?? this.status,
      autoAssign: autoAssign ?? this.autoAssign,
      tripStartDate: tripStartDate ?? this.tripStartDate,
      tripEndDate: tripEndDate ?? this.tripEndDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      routesTo: routesTo ?? this.routesTo,
    );
  }

  Routes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        vendorId = json['vendor_id'] as int?,
        driverId = json['driver_id'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        routesId = json['routes_id'] as int?,
        pickupEmail = json['pickup_email'] as String?,
        pickupPhone = json['pickup_phone'] as int?,
        pickupAdd1 = json['pickup_add1'] as String?,
        pickupAdd2 = json['pickup_add2'],
        pickupCity = json['pickup_city'] as String?,
        pickupState = json['pickup_state'] as String?,
        pickupCountry = json['pickup_country'] as String?,
        pickupZip = json['pickup_zip'] as String?,
        shipFirstName = json['ship_first_name'] as String?,
        shipLastName = json['ship_last_name'] as String?,
        shipEmail = json['ship_email'] as String?,
        shipPhone = json['ship_phone'] as int?,
        shipAdd1 = json['ship_add1'] as String?,
        shipAdd2 = json['ship_add2'],
        shipCity = json['ship_city'] as String?,
        shipState = json['ship_state'] as String?,
        shipCountry = json['ship_country'] as String?,
        shipZip = json['ship_zip'] as String?,
        loadType = json['load_type'] as String?,
        loadQuantity = json['load_quantity'] as int?,
        loadUnit = json['load_unit'] as String?,
        pickupDate = json['pickup_date'] as String?,
        shipDate = json['ship_date'] as String?,
        info = json['info'],
        status = json['status'] as String?,
        autoAssign = json['auto_assign'] as int?,
        tripStartDate = json['trip_start_date'],
        tripEndDate = json['trip_end_date'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        routesTo = (json['routes_to'] as Map<String,dynamic>?) != null ? RoutesTo.fromJson(json['routes_to'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'vendor_id' : vendorId,
    'driver_id' : driverId,
    'vehicle_id' : vehicleId,
    'routes_id' : routesId,
    'pickup_email' : pickupEmail,
    'pickup_phone' : pickupPhone,
    'pickup_add1' : pickupAdd1,
    'pickup_add2' : pickupAdd2,
    'pickup_city' : pickupCity,
    'pickup_state' : pickupState,
    'pickup_country' : pickupCountry,
    'pickup_zip' : pickupZip,
    'ship_first_name' : shipFirstName,
    'ship_last_name' : shipLastName,
    'ship_email' : shipEmail,
    'ship_phone' : shipPhone,
    'ship_add1' : shipAdd1,
    'ship_add2' : shipAdd2,
    'ship_city' : shipCity,
    'ship_state' : shipState,
    'ship_country' : shipCountry,
    'ship_zip' : shipZip,
    'load_type' : loadType,
    'load_quantity' : loadQuantity,
    'load_unit' : loadUnit,
    'pickup_date' : pickupDate,
    'ship_date' : shipDate,
    'info' : info,
    'status' : status,
    'auto_assign' : autoAssign,
    'trip_start_date' : tripStartDate,
    'trip_end_date' : tripEndDate,
    'latitude' : latitude,
    'longitude' : longitude,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'routes_to' : routesTo?.toJson()
  };
}

class RoutesTo {
  final int? id;
  final int? userId;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  RoutesTo({
    this.id,
    this.userId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  RoutesTo copyWith({
    int? id,
    int? userId,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return RoutesTo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  RoutesTo.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        name = json['name'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'name' : name,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}