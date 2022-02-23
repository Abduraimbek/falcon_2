///
/// Created by Abduraimbek Yarkinov at 17:11 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'components/quote_price.dart';
import 'components/additional_charges.dart';
import 'components/miles_out.dart';
import 'components/comments.dart';
import 'components/vehicle_type.dart';
import 'components/dimensions.dart';
import 'components/additional_parameters.dart';
import 'package:falcon_2/singletons/singletons.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({
    Key? key,
    required this.quoteByIdModel,
  }) : super(key: key);

  final QuoteByIdModel quoteByIdModel;

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: const EdgeInsets.only(left: 15, right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 7),
          QuotePrice(quotePrice: widget.quoteByIdModel.quotePrice ?? 0),
          AdditionalCharges(
            additionalCharges: widget.quoteByIdModel.additionalCharges ?? 0,
            pricePerMile: widget.quoteByIdModel.pricePerMile ?? 0,
          ),
          const SizedBox(height: 10),
          MilesOut(milesOut: widget.quoteByIdModel.milesOut ?? 0),
          // SizedBox(height: 15),
          // TimeToPickUp(timeToPickUp: quoteByIdModel!.),
          const SizedBox(height: 15),
          Comments(comments: widget.quoteByIdModel.comments ?? ""),
          const SizedBox(height: 15),
          VehicleType(vehicleType: widget.quoteByIdModel.vehicleType ?? ""),
          const SizedBox(height: 15),
          Dimensions(
            height: widget.quoteByIdModel.height ?? "",
            width: widget.quoteByIdModel.width ?? "",
            length: widget.quoteByIdModel.length ?? "",
          ),
          const SizedBox(height: 25),
          AdditionalParameters(
            addParams: widget.quoteByIdModel.additionalParameters,
          ),
        ],
      ),
    );
  }
}
