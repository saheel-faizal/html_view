
class GolfClass {
  GolfClass({
    this.vehicleList,
  });

  List<VehicleList> vehicleList;

  factory GolfClass.fromJson(Map<String, dynamic> json) => GolfClass(
    vehicleList: List<VehicleList>.from(json["vehicle_list"].map((x) => VehicleList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "vehicle_list": List<dynamic>.from(vehicleList.map((x) => x.toJson())),
  };
}

class VehicleList {
  VehicleList({
    this.id,
    this.name,
    this.model,
    this.rate,
    this.image,
    this.description,
  });

  String id;
  String name;
  String model;
  String rate;
  String image;
  String description;

  factory VehicleList.fromJson(Map<String, dynamic> json) => VehicleList(
    id: json["id"],
    name: json["name"],
    model: json["model"],
    rate: json["rate"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "model": model,
    "rate": rate,
    "image": image,
    "description": description,
  };
}
