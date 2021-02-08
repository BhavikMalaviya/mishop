import 'package:micatalogs/controllers/base_controller.dart';

class PaymentListController extends BaseController {
  bool isCod = true;
  List paymentMethodList = [
    {
      "image": "https://www.warrington-worldwide.co.uk/wp-content/uploads/2020/07/paypal-784404_1280.png",
      "title": "PayPal",
      "isActive": true,
    },
    {
      "image": "https://upload.wikimedia.org/wikipedia/en/e/eb/Stripe_logo%2C_revised_2016.png",
      "title": "Stripe",
      "isActive": true,
    },
    {
      "image": "https://www.j2store.org/images/extensions/payment_plugins/Razorpay.png",
      "title": "Razorpay",
      "isActive": true,
    },
  ];
}
