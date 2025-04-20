class OutletModel {
  OutletModel({
    required this.address,
    required this.name,
    required this.image,
    required this.outletSells,
    required this.createdAt,
    required this.id,
  });

  final String? address;
  final String? name;
  final String? image;
  final int? outletSells;
  final DateTime? createdAt;
  final String? id;

  factory OutletModel.fromJson(Map<String, dynamic> json) {
    return OutletModel(
      address: json["address"],
      name: json["name"],
      image: json["image"],
      outletSells: json["outlet_sells"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

  @override
  String toString() {
    return "$address, $name, $image, $outletSells, $createdAt, $id";
  }
}
