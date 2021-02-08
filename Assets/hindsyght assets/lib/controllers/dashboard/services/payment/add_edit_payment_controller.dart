import 'package:micatalogs/controllers/base_controller.dart';

class AddEditPaymentController extends BaseController {
  List<Map> paymentMethodList = [
    {
      "image":
          "https://www.warrington-worldwide.co.uk/wp-content/uploads/2020/07/paypal-784404_1280.png",
      "url": "https://example.net/bridge/blood.php?bomb=bat",
      "title": "PayPal",
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/eb/Stripe_logo%2C_revised_2016.png",
      "url": "https://www.example.com/",
      "title": "Stripe",
    },
    {
      "image":
          "https://www.j2store.org/images/extensions/payment_plugins/Razorpay.png",
      "url": "https://www.example.net/bedroom.php",
      "title": "Razorpay",
    },
  ];
  String publicKey = "";
  String url = "";
  Map selectedPayment;
  String privateKey = "";
}
