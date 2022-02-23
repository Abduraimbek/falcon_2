///
/// Created by Abduraimbek Yarkinov at 15:23 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearbyDriversList extends ConsumerStatefulWidget {
  const NearbyDriversList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NearbyDriversListState();
}

class _NearbyDriversListState extends ConsumerState<NearbyDriversList> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.5);
    final style2 = MyTextStyles.interMediumSecond(fontSize: 3.4);

    final drivers = driversDriversDrivers;

    ref.watch(fromToStopProvider);

    return ListView.separated(
      itemCount: drivers.length,
      controller: controller,
      itemBuilder: (context, index) {
        final d = drivers[index];

        return InkWell(
          onTap: () {
            if (d.lat != null && d.long != null) {
              final stop = "${d.lat}, ${d.long}";
              ref.read(fromToStopProvider).changeStop(stop);
            }
          },
          child: buildItem(
            style: style,
            style2: style2,
            num: index + 1,
            driver: d,
          ),
        );
      },
      separatorBuilder: (_, __) {
        return Container(
          width: double.infinity,
          height: 1,
          color: MyColors.secondTextColor,
        );
      },
    );
  }

  Widget buildItem({
    required TextStyle style,
    required TextStyle style2,
    required int num,
    required NearbyDriverModel driver,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            child: Center(
              child: Text("$num", style: style2),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${driver.firstName ?? ""}" " ${driver.lastName ?? ""}",
              style: style,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${(driver.distance ?? 0).toStringAsFixed(2)} mi away",
              style: style2,
            ),
          ),
          Expanded(
            flex: 2,
            child: buildPhoneAndMessageButtons(style2: style2),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneAndMessageButtons({
    required TextStyle style2,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("01:24 min", style: style2),
        const Spacer(),
        SvgPicture.asset(
          "assets/svg1/phone.svg",
          color: MyColors.backgroundColor,
          fit: BoxFit.cover,
          width: 1.56.vertical,
          height: 1.56.vertical,
        ),
        const SizedBox(width: 20),
        SvgPicture.asset(
          "assets/svg1/messages.svg",
          color: MyColors.backgroundColor,
          fit: BoxFit.cover,
          width: 1.56.vertical,
          height: 1.56.vertical,
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
