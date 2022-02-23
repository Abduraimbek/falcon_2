// ///
// /// Created by Abduraimbek Yarkinov at 17:56 on 13.12.2021.
// ///
//
// import 'package:flutter/material.dart';
// import 'package:falcon/providers/providers.dart';
// import 'package:falcon/utils/utils.dart';
//
// class VehicleTypeFilter extends ConsumerStatefulWidget {
//   const VehicleTypeFilter({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _VehicleTypeFilterState();
// }
//
// class _VehicleTypeFilterState extends ConsumerState<VehicleTypeFilter> {
//   late String value;
//   late List<String> values;
//
//   @override
//   void initState() {
//     super.initState();
//     value = "All";
//     values = ["All", ...MyStrings.vehicleTypes];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final style = MyTextStyles.interMediumFirst();
//
//     return DropdownButton<String>(
//       value: value,
//       onChanged: (v) {
//         if (v != null) {
//           setState(() {
//             value = v;
//           });
//         }
//       },
//       items: values
//           .map(
//             (e) => DropdownMenuItem<String>(
//               value: e,
//               child: Text(e, style: style),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
