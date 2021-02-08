import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/dashboard/services/payment/payment_list_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/packages/switch.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PaymentListScreen extends StatefulWidget {
  @override
  _PaymentListScreenState createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends StateMVC<PaymentListScreen> {
  PaymentListController _con;
  _PaymentListScreenState() : super(PaymentListController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () =>
            Navigator.pushNamed(context, RouteKeys.ADDEDITPAYMENTSCREEN),
        child: Icon(Icons.add),
      ),
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
              width: SizeConfig.safeBlockHorizontal * 90,
              height: SizeConfig.safeBlockVertical * 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.appColor),
              ),
              child: Row(
                children: <Widget>[
                  widthBox(10),
                  Image(
                    image: AssetImage(
                      'assets/images/cod.png',
                    ),
                    height: SizeConfig.safeBlockVertical * 4.5,
                  ),
                  widthBox(20),
                  Expanded(
                    child: Text(
                      'Cash on delivery',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  CustomSwitch(
                    value: _con.isCod,
                    onChanged: (val) => setState(() => _con.isCod = val),
                    activeColor: AppColors.appColor,
                    inactiveColor: Colors.grey,
                  ),
                  widthBox(10),
                ],
              ),
            ),
            heightBox(20),
            Column(
              children: _con.paymentMethodList
                  .asMap()
                  .map((i, method) {
                    return MapEntry(
                      i,
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5,
                              vertical: 20,
                            ),
                            height: SizeConfig.safeBlockVertical * 10,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.appColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => Navigator.pushNamed(
                                  context, RouteKeys.ADDEDITPAYMENTSCREEN),
                              child: Row(
                                children: <Widget>[
                                  widthBox(10),
                                  Image(
                                    image: NetworkImage(
                                      method['image'],
                                    ),
                                    height: SizeConfig.safeBlockVertical * 8,
                                    width: SizeConfig.safeBlockHorizontal * 15,
                                    fit: BoxFit.contain,
                                  ),
                                  widthBox(20),
                                  Expanded(
                                    child: Text(
                                      method['title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  CustomSwitch(
                                    value: method['isActive'],
                                    onChanged: (val) => setState(
                                        () => method['isActive'] = val),
                                    activeColor: AppColors.appColor,
                                    inactiveColor: Colors.grey,
                                  ),
                                  widthBox(25),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 5,
                            child: GestureDetector(
                              onTap: () {
                                _con.paymentMethodList.remove(method);
                                print(_con.paymentMethodList.length);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black26,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
