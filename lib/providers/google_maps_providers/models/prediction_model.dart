///
/// Created by Abduraimbek Yarkinov at 18:24 on 16.12.2021.
///

class PredictionModel {
  String? description;
  String? placeId;

  PredictionModel({
    required this.description,
    required this.placeId,
  });

  factory PredictionModel.fromJson(dynamic json) {
    return PredictionModel(
      description: json["description"],
      placeId: json["place_id"],
    );
  }
}
