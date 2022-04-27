import 'package:shared_preferences/shared_preferences.dart';

class MyPrefsFields {
  static late bool isAuthenticated;
  static late bool isRoot;
  static late bool isAccessDriver;
  static late bool isAccessEmployee;
  static late bool isOpenOnBrowser;

  static late int employeeRole;

  static late String employeeName;
  static late String employeeMail;
  static late String employeeToken;
  static late String aMail;
  static late String aPassword;
  static late String fMail;
  static late String fPassword;
  static late String cookieAzam;
  static late String cookieFalcon;

  static late int updateSecond;

  static List<dynamic> getList() => [
        isAuthenticated,
        isRoot,
        isAccessDriver,
        isAccessEmployee,
        isOpenOnBrowser,
        employeeRole,
        employeeName,
        employeeMail,
        employeeToken,
        aMail,
        aPassword,
        fMail,
        fPassword,
        cookieAzam,
        cookieFalcon,
        updateSecond,
      ];

  static void setList(List<dynamic> list) {
    isAuthenticated = list[0];
    isRoot = list[1];
    isAccessDriver = list[2];
    isAccessEmployee = list[3];
    isOpenOnBrowser = list[4];

    employeeRole = list[5];

    employeeName = list[6];
    employeeMail = list[7];
    employeeToken = list[8];
    aMail = list[9];
    aPassword = list[10];
    fMail = list[11];
    fPassword = list[12];
    cookieAzam = list[13];
    cookieFalcon = list[14];
    updateSecond = list[15];
  }
}

class MyPrefs {
  static final MyPrefs _myPrefs = MyPrefs._internal();

  MyPrefs._internal();

  factory MyPrefs() => _myPrefs;

  Future<void> initialize() async {
    final instance = await SharedPreferences.getInstance();

    MyPrefsFields.isAuthenticated =
        instance.getBool("is_authenticated") ?? false;
    MyPrefsFields.isRoot = instance.getBool("is_root") ?? false;
    MyPrefsFields.isAccessDriver =
        instance.getBool("is_access_driver") ?? false;
    MyPrefsFields.isAccessEmployee =
        instance.getBool("is_access_employee") ?? false;
    MyPrefsFields.isOpenOnBrowser =
        instance.getBool("is_open_on_browser") ?? false;

    MyPrefsFields.employeeRole = instance.getInt("employee_role") ?? 1;

    MyPrefsFields.employeeName = instance.getString("employee_name") ?? "";
    MyPrefsFields.employeeMail = instance.getString("employee_mail") ?? "";
    MyPrefsFields.employeeToken = instance.getString("employee_token") ?? "";
    MyPrefsFields.aMail = instance.getString("a_mail") ?? "";
    MyPrefsFields.aPassword = instance.getString("a_password") ?? "";
    MyPrefsFields.fMail = instance.getString("f_mail") ?? "";
    MyPrefsFields.fPassword = instance.getString("f_password") ?? "";
    MyPrefsFields.cookieAzam = instance.getString("cookie_azam") ?? "";
    MyPrefsFields.cookieFalcon = instance.getString("cookie_falcon") ?? "";

    MyPrefsFields.updateSecond = instance.getInt("update_second") ?? 7;
  }

  //=========================================================================
  //=========================================================================
  //=========================================================================
  // Setters (bool)
  //=========================================================================
  //=========================================================================
  //=========================================================================

  Future<bool> setIsAuthenticated(bool value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setBool("is_authenticated", value);
    MyPrefsFields.isAuthenticated = value;
    return result;
  }

  Future<bool> setIsRoot(bool value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setBool("is_root", value);
    MyPrefsFields.isRoot = value;
    return result;
  }

  Future<bool> setIsAccessDriver(bool value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setBool("is_access_driver", value);
    MyPrefsFields.isAccessDriver = value;
    return result;
  }

  Future<bool> setIsAccessEmployee(bool value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setBool("is_access_employee", value);
    MyPrefsFields.isAccessEmployee = value;
    return result;
  }

  Future<bool> setIsOpenOnBrowser(bool value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setBool("is_open_on_browser", value);
    MyPrefsFields.isOpenOnBrowser = value;
    return result;
  }

  //=========================================================================
  //=========================================================================
  //=========================================================================
  // Setters (int)
  //=========================================================================
  //=========================================================================
  //=========================================================================

  Future<bool> setEmployeeRole(int value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setInt("employee_role", value);
    MyPrefsFields.employeeRole = value;
    return result;
  }

  Future<bool> setUpdateSecond(int value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setInt("update_second", value);
    MyPrefsFields.updateSecond = value;
    return result;
  }

  //=========================================================================
  //=========================================================================
  //=========================================================================
  // Setters (String)
  //=========================================================================
  //=========================================================================
  //=========================================================================

  Future<bool> setEmployeeName(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("employee_name", value);
    MyPrefsFields.employeeName = value;
    return result;
  }

  Future<bool> setEmployeeMail(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("employee_mail", value);
    MyPrefsFields.employeeMail = value;
    return result;
  }

  Future<bool> setEmployeeToken(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("employee_token", value);
    MyPrefsFields.employeeToken = value;
    return result;
  }

  Future<bool> setAMail(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("a_mail", value);
    MyPrefsFields.aMail = value;
    return result;
  }

  Future<bool> setAPassword(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("a_password", value);
    MyPrefsFields.aPassword = value;
    return result;
  }

  Future<bool> setFMail(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("f_mail", value);
    MyPrefsFields.fMail = value;
    return result;
  }

  Future<bool> setFPassword(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("f_password", value);
    MyPrefsFields.fPassword = value;
    return result;
  }

  Future<bool> setCookieAzam(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("cookie_azam", value);
    MyPrefsFields.cookieAzam = value;
    return result;
  }

  Future<bool> setCookieFalcon(String value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString("cookie_falcon", value);
    MyPrefsFields.cookieFalcon = value;
    return result;
  }
}
