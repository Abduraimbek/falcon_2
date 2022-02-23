///
/// Created by Abduraimbek Yarkinov at 17:11 on 22.11.2021.
///

import 'package:falcon_2/singletons/api/api.dart';
import 'package:flutter/material.dart';
import 'components/quote_price.dart';
import 'components/additional_charges.dart';
import 'components/miles_out.dart';
import 'components/time_to_pick_up.dart';
import 'components/comments.dart';
import 'components/vehicle_type.dart';
import 'components/dimensions.dart';
import 'components/additional_parameters.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({
    Key? key,
    required this.orderByLinkModel3,
  }) : super(key: key);

  final OrderByLinkModel3 orderByLinkModel3;

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final miles = double.tryParse(widget.orderByLinkModel3.miles ?? "0") ?? 0;

    return SingleChildScrollView(
      controller: controller,
      padding: const EdgeInsets.only(left: 15, right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 7),
          const QuotePrice(),
          AdditionalCharges(
            totalMiles: miles,
          ),
          const SizedBox(height: 10),
          const MilesOut(),
          const SizedBox(height: 15),
          const TimeToPickUp(),
          const SizedBox(height: 15),
          const Comments(),
          const SizedBox(height: 15),
          const VehicleType(),
          const SizedBox(height: 15),
          const Dimensions(),
          const SizedBox(height: 25),
          const AdditionalParameters(),
        ],
      ),
    );
  }
}
