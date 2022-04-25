///
/// Created by Abduraimbek Yarkinov at 16:12 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';

final quoteDetailsProvider =
    ChangeNotifierProvider.autoDispose<_QuoteDetails>((ref) {
  return _QuoteDetails();
});

class _QuoteDetails extends ChangeNotifier {
  int template = 1;
  double quotePrice = 0;
  double additionalCharges = 0;
  double pricePerMile = 0;
  double milesOut = 0;
  String timeToPickUp = "";
  String comments = "";
  String vehicleType = MyStrings.vehicleTypes.first;
  double width = 0;
  double height = 0;
  double length = 0;
  List<AdditionalParameterModel> parameters = [];

  bool buttonEnable = false;

  void _checkButtonEnable() {
    buttonEnable = quotePrice > 0;

    notifyListeners();
  }

  void changeTemplate(int i) {
    if (template != i) {
      template = i;
    }
    notifyListeners();
  }

  void typeQuotePrice(String value) {
    value = value.replaceAll(",", "");
    quotePrice = double.tryParse(value) ?? 0;
    _checkButtonEnable();
  }

  void typeAdditionalCharges(String value) {
    value = value.replaceAll(",", "");
    additionalCharges = double.tryParse(value) ?? 0;
  }

  void typePricePerMile(String value) {
    value = value.replaceAll(",", "");
    pricePerMile = double.tryParse(value) ?? 0;
  }

  void typeMilesOut(String value) {
    milesOut = double.tryParse(value) ?? 0;
    _checkButtonEnable();
  }

  void typeTimeToPickUp(String timeToPickUp) {
    this.timeToPickUp = timeToPickUp;
  }

  void clearTimeToPickUp() {
    timeToPickUp = "";
  }

  void typeComments(String value) {
    comments = value;
  }

  void typeVehicleType(String value) {
    vehicleType = value;
    notifyListeners();
  }

  void typeWidth(String value) {
    width = double.tryParse(value) ?? 0;
  }

  void typeHeight(String value) {
    height = double.tryParse(value) ?? 0;
  }

  void typeLength(String value) {
    length = double.tryParse(value) ?? 0;
  }

  void addToParameters(AdditionalParameterModel additionalParameterModel) {
    if (!parameters.any((e) => e.id == additionalParameterModel.id)) {
      parameters.add(additionalParameterModel);
      notifyListeners();
    }
  }

  void removeFromParameters(int id) {
    parameters.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> pressBidButton({
    required BuildContext context,
  }) async {
    showWaitingDialog(context);

    final quoteModel = QuoteModel(
      orderId: orderIdOrderId,
      quotePrice: quotePrice,
      additionalCharges: additionalCharges,
      pricePerMile: pricePerMile,
      milesOut: milesOut,
      timeToPickup: timeToPickUp,
      comments: comments,
      vehicleType: vehicleType,
      width: width,
      height: height,
      template: template,
      length: length,
      additionalParameters: parameters.map((e) => e.id ?? 0).toList(),
    );

    final quoteModel2 = QuoteModel2(
      postedBy: orderModel4OrderModel4!.postedBy ?? "",
      weight: orderModel4OrderModel4!.weight ?? "",
      mail: orderByLinkModel3OrderByLinkModel3.postedEmail ?? "",
      status: 0,
      destination: orderModel4OrderModel4!.deliverTo ?? "",
      origin: orderModel4OrderModel4!.pickUpAt ?? "",
      vehicleType: orderModel4OrderModel4!.vehicle ?? "",
      createdDate: 32423324,
      //orderModel4OrderModel4!.writeTime,
      totalMiles: "$milesOut miles",
      //orderModel4OrderModel4!.miles ?? "",
      requestRef: orderModel4OrderModel4!.orderId ?? "",
      createdDateStr: orderModel4OrderModel4!.postDate ?? "",
      nearbyTrucks: 0,
      subject: "",
      quote: quoteModel,
    );

    final result = await QuoteApi.quote(quoteModel2: quoteModel2);

    Navigator.pop(context);

    if (result) {
      Navigator.pop(context);
    }
  }
}

final fromToStopProvider =
    ChangeNotifierProvider.autoDispose<_FromToStop>((ref) {
  return _FromToStop();
});

class _FromToStop extends ChangeNotifier {
  String from = fromFrom;
  String to = toTo;
  String stop = stopStop;

  void changeStop(String stop) {
    this.stop = stop;
    notifyListeners();
  }
}

String fromFrom = "";
String toTo = "";
String stopStop = "";

int orderIdOrderId = 0;
OrderModel4? orderModel4OrderModel4;
