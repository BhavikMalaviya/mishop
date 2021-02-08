import 'package:micatalogs/controllers/base_controller.dart';

class UpdateProfileController extends BaseController {
  String fullName;
  String email;
  String phoneCode;
  String phoneNo;
  String country;

  List<String> countryList = ["India", "USA", "China", "Nepal"];
  List<String> phoneCodeList = ["91", "12", "34", "78"];
}
