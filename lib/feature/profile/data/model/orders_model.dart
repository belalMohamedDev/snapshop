class OrdersModel {
  Orders? orders;
  bool? status;

  OrdersModel({this.orders, this.status});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {if (orders != null) 'orders': orders!.toJson(), 'status': status};
  }
}

class Orders {
  List<Order>? active;
  List<Order>? canceled;
  List<Order>? completed;

  Orders({this.active, this.canceled, this.completed});

  Orders.fromJson(Map<String, dynamic> json) {
    active = (json['active'] as List?)?.map((e) => Order.fromJson(e)).toList();

    canceled = (json['canceled'] as List?)
        ?.map((e) => Order.fromJson(e))
        .toList();

    completed = (json['completed'] as List?)
        ?.map((e) => Order.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      if (active != null) 'active': active!.map((e) => e.toJson()).toList(),
      if (canceled != null)
        'canceled': canceled!.map((e) => e.toJson()).toList(),
      if (completed != null)
        'completed': completed!.map((e) => e.toJson()).toList(),
    };
  }
}

class Order {
  Driver? driver;
  int? id;
  List<Item>? items;
  String? orderChangeDate;
  String? orderDate;

  double? shipping;
  int? status;
  double? subtotal;
  double? tax;
  double? total;

  Order({
    this.driver,
    this.id,
    this.items,
    this.orderChangeDate,
    this.orderDate,
    this.shipping,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
  });

  Order.fromJson(Map<String, dynamic> json) {
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;

    id = json['id'];

    items = (json['items'] as List?)?.map((e) => Item.fromJson(e)).toList();

    orderChangeDate = json['order_change_date'];
    orderDate = json['order_date'];

    shipping = (json['shipping'] as num?)?.toDouble();
    status = json['status'];
    subtotal = (json['subtotal'] as num?)?.toDouble();
    tax = (json['tax'] as num?)?.toDouble();
    total = (json['total'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      if (driver != null) 'driver': driver!.toJson(),
      'id': id,
      if (items != null) 'items': items!.map((e) => e.toJson()).toList(),
      'order_change_date': orderChangeDate,
      'order_date': orderDate,
      'shipping': shipping,
      'status': status,
      'subtotal': subtotal,
      'tax': tax,
      'total': total,
    };
  }
}

class Driver {
  double? latitude;
  double? longitude;
  String? name;
  String? phone;

  Driver({this.latitude, this.longitude, this.name, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'phone': phone,
    };
  }
}

class Item {
  String? description;
  int? id;
  String? imagePath;
  String? name;

  double? price;
  int? quantity;
  double? rating;
  double? totalPrice;

  Item({
    this.description,
    this.id,
    this.imagePath,
    this.name,
    this.price,
    this.quantity,
    this.rating,
    this.totalPrice,
  });

  Item.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];

    price = (json['price'] as num?)?.toDouble();
    quantity = json['quantity'];
    rating = (json['rating'] as num?)?.toDouble();
    totalPrice = (json['total_price'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'image_path': imagePath,
      'name': name,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'total_price': totalPrice,
    };
  }
}
