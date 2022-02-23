///
/// Created by Abduraimbek Yarkinov at 17:29 on 08.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final additionalParametersProvider =
    FutureProvider.autoDispose<List<AdditionalParameterModel>?>((ref) async {
  final cancelToken = CancelToken();
  ref.maintainState = false;

  ref.onDispose(() {
    cancelToken.cancel();
  });

  try {
    final dio = Dio();
    final uri = Uri.parse("${ApiConst.baseUrl}additional_parametrs");
    final headers = ApiConst.getHeaders();
    final response = await dio.getUri(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: headers,
        sendTimeout: 3000,
        receiveTimeout: 3000,
      ),
    );

    if (response.data["code"] == 0 && response.data["message"] == "OK") {
      final parameters = (response.data["data"] as List)
          .map((e) => AdditionalParameterModel.fromJson(e));
      return parameters.toList();
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
});
