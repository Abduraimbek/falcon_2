import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.orderModel,
    required this.blackSimpleStyle,
    required this.timeStyle,
    required this.isViewing,
  }) : super(key: key);

  final OrderModel4 orderModel;
  final TextStyle blackSimpleStyle;
  final TextStyle timeStyle;
  final bool isViewing;

  @override
  Widget build(BuildContext context) {
    final blackStyle = MyTextStyles.interMediumFirst(
      isBold: orderModel.seen == false,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: isViewing
              ? Colors.red.withOpacity(.4)
              : orderModel.seen == false
                  ? MyColors.backgroundColor.withOpacity(.3)
                  : Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    MyStringHelper.minusWhenNull(orderModel.postDate),
                    style: timeStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  MyStringHelper.minusWhenNull(orderModel.vehicle),
                  maxLines: 1,
                  style: blackStyle,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  MyStringHelper.minusWhenNull(orderModel.pickUpAt),
                  style: blackStyle,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  MyStringHelper.minusWhenNull(orderModel.deliverTo),
                  style: blackStyle,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  MyStringHelper.minusWhenNull(orderModel.postedBy),
                  style: blackSimpleStyle,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  MyStringHelper.minusWhenNull(
                      "${orderModel.orderId} (${orderModel.host})"),
                  textAlign: TextAlign.end,
                  style: blackSimpleStyle,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      MyStringHelper.minusWhenNull(orderModel.miles),
                      textAlign: TextAlign.end,
                      style: blackSimpleStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset(
                        "assets/svg1/messages.svg",
                        color: MyColors.secondTextColor,
                        fit: BoxFit.cover,
                        width: 1.95.vertical,
                        height: 1.95.vertical,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: MyColors.secondTextColor,
        ),
      ],
    );
  }
}

// class Item2 extends StatelessWidget {
//   const Item2({
//     Key? key,
//     required this.orderModel,
//     required this.selected,
//     required this.animation,
//   }) : super(key: key);
//
//   final OrderModel4 orderModel;
//   final bool selected;
//   final Animation<double> animation;
//
//   @override
//   Widget build(BuildContext context) {
//     final blackStyle = MyTextStyles.interMediumFirst(
//       isBold: orderModel.seen == false,
//     );
//     final blackSimpleStyle = MyTextStyles.interMediumFirst();
//     final timeStyle = MyTextStyles.interMediumFirst(
//       fontSize: 3,
//       isBold: true,
//     );
//
//     return SizeTransition(
//       sizeFactor: animation,
//       axis: Axis.vertical,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             color: selected
//                 ? MyColors.backgroundColor.withOpacity(.3)
//                 : Colors.transparent,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Text(
//                       MyStringHelper.minusWhenNull(orderModel.postDate),
//                       style: timeStyle,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Text(
//                     MyStringHelper.minusWhenNull(orderModel.vehicle),
//                     maxLines: 1,
//                     style: blackStyle,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     MyStringHelper.minusWhenNull(orderModel.pickUpAt),
//                     style: blackStyle,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     MyStringHelper.minusWhenNull(orderModel.deliverTo),
//                     style: blackStyle,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     MyStringHelper.minusWhenNull(orderModel.postedBy),
//                     style: blackSimpleStyle,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     MyStringHelper.minusWhenNull(orderModel.orderId),
//                     textAlign: TextAlign.end,
//                     style: blackSimpleStyle,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         MyStringHelper.minusWhenNull(orderModel.miles),
//                         textAlign: TextAlign.end,
//                         style: blackSimpleStyle,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5),
//                         child: SvgPicture.asset(
//                           "assets/svg1/messages.svg",
//                           color: MyColors.secondTextColor,
//                           fit: BoxFit.cover,
//                           width: 1.95.vertical,
//                           height: 1.95.vertical,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 1,
//             width: double.infinity,
//             color: MyColors.secondTextColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
