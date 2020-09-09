import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class RazorPayCheckoutPage extends StatefulWidget {
  @override
  _RazorPayCheckoutPageState createState() => _RazorPayCheckoutPageState();
}

class _RazorPayCheckoutPageState extends State<RazorPayCheckoutPage> {

  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHECKOUT"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("CHECKOUT & PAY"),
          onPressed: openCheckout
        ),
      )
    );
  }

  void openCheckout() async{
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };

    _razorpay.open(options); // Razorpay payment page :)
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "PAYMENT SUCCESS "+response.paymentId, timeInSecForIosWeb: 5);
    Navigator.pop(context, "PAYMENT SUCCESS ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "PAYMENT FAILED "+response.message, timeInSecForIosWeb: 5);
    Navigator.pop(context, "PAYMENT FAILED ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "PAYMENT FROM WALLET "+response.walletName, timeInSecForIosWeb: 5);
    Navigator.pop(context, "PAYMENT FROM WALLET");
  }

}


