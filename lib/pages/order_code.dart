import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:pickrunner/models/order_model.dart';
import 'package:pickrunner/pages/available.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';

// ignore: must_be_immutable
class OrderCode extends StatefulWidget {
  OrderModel order;
  OrderCode({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCode> createState() => _OrderCodeState();
}

class _OrderCodeState extends State<OrderCode> {
  String? code;
  Future<void> updateOrderStatus(String orderUid) async {
  try {
    await FirebaseFirestore.instance.collection('orders').doc(orderUid).update({
      'status': 'Completed',
    });
    print('Order status updated successfully');
  } on FirebaseException catch (e) {
    if (e.code == 'not-found') {
      print('Document does not exist');
    } else {
      print('Error updating order status: $e');
    }
  } catch (e) {
    print('Error updating order status: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    print(code);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            BigText(title: "Order Id ${widget.order.orderId!}"),
            const SizedBox(height: 35,),
            BigText(title: "Enter the Order Completed Code "),
            const SizedBox(height: 55,),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color.fromARGB(255, 28, 28, 29),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true, 
              //runs when a code is typed in
              onCodeChanged: (String code) {
                  //handle validation or checks here           
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                  code = verificationCode;
              }, // end onSubmit
          ),
          const SizedBox(height: 55,),
          Button_Widget(pressed: (){
            if(widget.order.orderCode == code)
            {
              updateOrderStatus(widget.order.uid!);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
            }
            else
            {
              Fluttertoast.showToast(msg: "Please Enter Correct Code");
            }
          }, width: 260, text: "Submit")
          ],
        ),
      ),
    );
  }
}