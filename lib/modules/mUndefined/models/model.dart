class Undefined {
  final int id;
  final String data;
  final bool status;
  final double prices;

  Undefined({
    required this.id,
    required this.data,
    required this.status,
    required this.prices,
  });

  Undefined copyWith({
    int? id,
    String? data,
    bool? status,
    double? prices,
  }) =>
      Undefined(
        id: id ?? this.id,
        data: data ?? this.data,
        status: status ?? this.status,
        prices: prices ?? this.prices,
      );

  factory Undefined.fromJson(Map<String, dynamic> json) => Undefined(
        id: json["id"],
        data: json["data"],
        status: json["status"],
        prices: json["prices"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data,
        "status": status,
        "prices": prices,
      };
}
