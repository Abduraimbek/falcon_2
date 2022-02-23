export 'login/login_api.dart';

export 'employee/api/employee_api.dart';
export 'employee/model/employee_model.dart';
export 'employee/model/delete_employee_model.dart';
export 'employee/model/edit_employee_model.dart';
export 'employee/singletons/employee_singleton.dart';

export 'orders/api/quote_api.dart';
export 'orders/model/nearby_driver_model.dart';
export 'orders/model/quote_model.dart';
export 'orders/model/additional_parameter_model.dart';
export 'orders/singleton/quote_singleton.dart';

export 'driver/api/driver_api.dart';
export 'driver/model/driver_model.dart';
export 'driver/model/create_driver_model.dart';
export 'driver/singleton/driver_singleton.dart';

export 'quoted_orders/api/quoted_orders_api.dart';
export 'quoted_orders/model/quoted_order_model.dart';
export 'quoted_orders/model/quote_by_id_model.dart';
export 'quoted_orders/singleton/quoted_orders_singleton.dart';

export 'order_3/api/order_api_3.dart';
export 'order_3/model/order_model_3.dart';
export 'order_3/model/order_by_link_model_3.dart';
export 'order_3/model/order_falcon_model.dart';
export 'order_3/model/order_azam_model.dart';
export 'order_3/singleton/order_falcon_singleton.dart';
export 'order_3/singleton/order_azam_singleton.dart';

export 'token/token_api.dart';

import 'package:falcon_2/utils/utils.dart';

class ApiConst {
  static const baseUrl = "http://89.223.71.112:9292/";

  static Map<String, String> postHeaders() {
    final headers = {
      "Content-Type": "application/json",
    };

    return headers;
  }

  static Map<String, String> postHeadersWithToken() {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": MyPrefsFields.employeeToken,
    };

    return headers;
  }

  static Map<String, String> postHeadersWithTokenThread() {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": MyPrefsFields.employeeToken,
    };

    return headers;
  }

  static Map<String, String> getHeaders() {
    final headers = {
      "Authorization": MyPrefsFields.employeeToken,
    };

    return headers;
  }

  static Map<String, String> getHeadersThread() {
    final headers = {
      "Authorization": MyPrefsFields.employeeToken,
    };

    return headers;
  }
}
