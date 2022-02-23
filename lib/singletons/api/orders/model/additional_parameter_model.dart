///
/// Created by Abduraimbek Yarkinov at 17:26 on 08.12.2021.
///

class AdditionalParameterModel {
  int? id;
  String? name;

  AdditionalParameterModel({
    required this.id,
    required this.name,
  });

  factory AdditionalParameterModel.fromJson(dynamic json) {
    return AdditionalParameterModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
