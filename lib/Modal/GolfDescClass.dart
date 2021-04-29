

class GolfDescClass {
  GolfDescClass({

    this.data,
  });


  List<Datum> data;

  factory GolfDescClass.fromJson(Map<String, dynamic> json) => GolfDescClass(

    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {

    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.rate,
    this.option,
    this.image,
    this.imageSubimageOne,
    this.imageSubimageTwo,
    this.imageSubimageThree,
    this.year,
    this.kmDriven,
    this.kmAway,
    this.color,
    this.fuel,
    this.insurance,
    this.ownership,
    this.overallLenght,
    this.overallWight,
    this.overallBase,
    this.overallHeight,
    this.whellBase,
    this.noOfDoord,
    this.seatingCapacity,
    this.maximumSpeed,
    this.power,
    this.torque,
    this.valueMechanisum,
    this.abs,
    this.ebd,
    this.childSafetyLock,
    this.immobilizer,
    this.tractionControl,
    this.powerSteering,
    this.description,
  });

  String id;
  String name;
  String rate;
  String option;
  String image;
  String imageSubimageOne;
  String imageSubimageTwo;
  String imageSubimageThree;
  String year;
  String kmDriven;
  String kmAway;
  String color;
  String fuel;
  String insurance;
  String ownership;
  String overallLenght;
  String overallWight;
  String overallBase;
  String overallHeight;
  String whellBase;
  String noOfDoord;
  String seatingCapacity;
  String maximumSpeed;
  String power;
  String torque;
  String valueMechanisum;
  String abs;
  String ebd;
  String childSafetyLock;
  String immobilizer;
  String tractionControl;
  String powerSteering;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    rate: json["rate"],
    option: json["option"],
    image: json["image"],
    imageSubimageOne: json["image_subimage_one"],
    imageSubimageTwo: json["image_subimage_two"],
    imageSubimageThree: json["image_subimage_three"],
    year: json["year"],
    kmDriven: json["km_driven"],
    kmAway: json["km_away"],
    color: json["color"],
    fuel: json["fuel"],
    insurance: json["insurance"],
    ownership: json["ownership"],
    overallLenght: json["overall_lenght"],
    overallWight: json["overall_wight"],
    overallBase: json["overall_base"],
    overallHeight: json["overall_height"],
    whellBase: json["whell_base"],
    noOfDoord: json["no_of_doord"],
    seatingCapacity: json["seating_capacity"],
    maximumSpeed: json["maximum_speed"],
    power: json["power"],
    torque: json["torque"],
    valueMechanisum: json["value_mechanisum"],
    abs: json["abs"],
    ebd: json["ebd"],
    childSafetyLock: json["child_safety_lock"],
    immobilizer: json["immobilizer"],
    tractionControl: json["traction_control"],
    powerSteering: json["power_steering"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rate": rate,
    "option": option,
    "image": image,
    "image_subimage_one": imageSubimageOne,
    "image_subimage_two": imageSubimageTwo,
    "image_subimage_three": imageSubimageThree,
    "year": year,
    "km_driven": kmDriven,
    "km_away": kmAway,
    "color": color,
    "fuel": fuel,
    "insurance": insurance,
    "ownership": ownership,
    "overall_lenght": overallLenght,
    "overall_wight": overallWight,
    "overall_base": overallBase,
    "overall_height": overallHeight,
    "whell_base": whellBase,
    "no_of_doord": noOfDoord,
    "seating_capacity": seatingCapacity,
    "maximum_speed": maximumSpeed,
    "power": power,
    "torque": torque,
    "value_mechanisum": valueMechanisum,
    "abs": abs,
    "ebd": ebd,
    "child_safety_lock": childSafetyLock,
    "immobilizer": immobilizer,
    "traction_control": tractionControl,
    "power_steering": powerSteering,
    "description": description,
  };
}
