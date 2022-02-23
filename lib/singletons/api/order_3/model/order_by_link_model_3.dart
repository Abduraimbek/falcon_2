///
/// Created by Abduraimbek Yarkinov at 18:43 on 22.12.2021.
///

import 'package:html/parser.dart';
import 'package:collection/collection.dart';

class OrderByLinkModel3 {
  String? loadType;
  String? refNo;
  String? orderNo;
  String? miles;
  String? pieces;
  String? weight;
  String? dims;
  String? hazMaterial;
  String? dockLevel;
  String? csaLoad;
  String? notes;
  String? postedEmail;
  String? phone;
  String? companyName;
  String? companyAddress;
  String? postedBy;
  String? postedByPhone;

  OrderByLinkModel3({
    required this.loadType,
    required this.refNo,
    required this.orderNo,
    required this.miles,
    required this.pieces,
    required this.weight,
    required this.dims,
    required this.hazMaterial,
    required this.dockLevel,
    required this.csaLoad,
    required this.notes,
    required this.postedEmail,
    required this.phone,
    required this.companyName,
    required this.postedBy,
    required this.companyAddress,
    required this.postedByPhone,
  });

  factory OrderByLinkModel3.nullModel() {
    return OrderByLinkModel3(
      loadType: null,
      refNo: null,
      orderNo: null,
      miles: null,
      pieces: null,
      weight: null,
      dims: null,
      hazMaterial: null,
      dockLevel: null,
      csaLoad: null,
      notes: null,
      postedEmail: null,
      companyName: null,
      phone: null,
      companyAddress: null,
      postedBy: null,
      postedByPhone: null,
    );
  }

  factory OrderByLinkModel3.fromHtml(String html) {
    final model = OrderByLinkModel3.nullModel();

    final trList = parse(html).querySelectorAll("tr");
    final elementEmail =
        trList.firstWhereOrNull((element) => element.text.contains("E-MAIL:"));
    final elementCompanyName = trList
        .firstWhereOrNull((element) => element.text.contains("COMPANY NAME:"));
    final elementPhone =
        trList.firstWhereOrNull((element) => element.text.contains("PHONE:"));
    final elementPostedBy = trList
        .firstWhereOrNull((element) => element.text.contains("POSTED BY:"));
    final elementPostedByPhone = trList.firstWhereOrNull(
        (element) => element.text.contains("POSTED BY PHONE:"));
    final elementCompanyAddress = trList.firstWhereOrNull(
        (element) => element.text.contains("COMPANY ADDRESS:"));

    if (elementEmail != null) {
      model.postedEmail = elementEmail.children[1].text;
    }
    if (elementCompanyName != null) {
      model.companyName = elementCompanyName.children[1].text;
    }
    if (elementPhone != null) {
      model.phone = elementPhone.children[1].text;
    }
    if (elementPostedBy != null) {
      model.postedBy = elementPostedBy.children[1].text;
    }
    if (elementPostedByPhone != null) {
      model.postedByPhone = elementPostedByPhone.children[1].text;
    }
    if (elementCompanyAddress != null) {
      model.companyAddress = elementCompanyAddress.children[1].text;
    }

    int start = trList
        .indexWhere((element) => element.text.contains("ORDER INFORMATION:"));

    final needTrList = trList.sublist(start);
    final mustTrList =
        needTrList.where((element) => element.children.length == 2).toList();

    model.loadType = mustTrList[0].children[1].text;
    model.refNo = mustTrList[1].children[1].text;
    model.orderNo = mustTrList[2].children[1].text;
    model.miles = mustTrList[3].children[1].text;
    model.pieces = mustTrList[4].children[1].text;
    model.weight = mustTrList[5].children[1].text;
    model.dims = mustTrList[6].children[1].text;
    model.hazMaterial = mustTrList[7].children[1].text;
    model.dockLevel = mustTrList[8].children[1].text;
    model.csaLoad = mustTrList[9].children[1].text;
    model.notes = mustTrList[10].children[1].text;

    // print(model.loadType);
    // print(model.refNo);
    // print(model.orderNo);
    // print(model.miles);
    // print(model.pieces);
    // print(model.weight);
    // print(model.dims);
    // print(model.hazMaterial);
    // print(model.dockLevel);
    // print(model.csaLoad);
    // print(model.notes);

    return model;
  }
}

OrderByLinkModel3 orderByLinkModel3OrderByLinkModel3 =
    OrderByLinkModel3.nullModel();
