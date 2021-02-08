import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/controllers/dashboard/services/payment/add_edit_payment_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddEditPaymentScreen extends StatefulWidget {
  @override
  _AddEditPaymentScreenState createState() => _AddEditPaymentScreenState();
}

class _AddEditPaymentScreenState extends StateMVC<AddEditPaymentScreen> {
  AddEditPaymentController _con;
  _AddEditPaymentScreenState() : super(AddEditPaymentController()) {
    _con = controller;
  } 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
        title: Text(
          'Payment Method',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightBox(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment Keys",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            heightBox(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  DropdownButton<Map>(
                    value: _con.selectedPayment,
                    hint: Text(
                      'Select payment method',
                      overflow: TextOverflow.ellipsis,
                    ),
                    itemHeight: SizeConfig.safeBlockVertical * 10,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color: Colors.black38,
                    ),
                    onChanged: (Map newValue) {
                      setState(() {
                        _con.selectedPayment = newValue;
                        _con.url = newValue['url'];
                      });
                    },
                    items: _con.paymentMethodList.map((Map model) {
                      return DropdownMenuItem<Map>(
                        value: model,
                        child: Row(
                          children: <Widget>[
                            new Text(
                              "${model['title']}",
                            ),
                            Spacer(),
                            Image(
                              width: SizeConfig.safeBlockHorizontal * 12,
                              fit: BoxFit.contain,
                              image: NetworkImage(model['image']),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  urlWidget(url: _con.url, title: "Get Help ?"),
                  keyWidget(data: _con.publicKey, title: "Public Key"),
                  keyWidget(data: _con.privateKey, title: "Private Key"),
                ],
              ),
            ),
            heightBox(SizeConfig.safeBlockVertical * 8),
            appButton(onTap: () => Navigator.pop(context), text: "Save"),
          ],
        ),
      ),
    );
  }

  Widget keyWidget({
    String data,
    String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightBox(15),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        heightBox(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/svg/colorkey.svg",
              ),
              widthBox(10),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              widthBox(10),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  onChanged: (val) => setState(() => data = val),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "********",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        heightBox(15),
      ],
    );
  }

  Widget urlWidget({
    String url,
    String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightBox(15),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        heightBox(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/svg/link.svg",
                height: 20,
                color: AppColors.appColor,
              ),
              widthBox(10),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              widthBox(10),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      url,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: AppColors.lightTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        heightBox(15),
      ],
    );
  }
}
