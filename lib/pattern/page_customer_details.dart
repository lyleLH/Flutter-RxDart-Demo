import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pattern/customer_details_protocol.dart';
import 'package:my_app/pattern/customer_manager.dart';

class PageCustomerDetails extends StatefulWidget {
  final String id;
  PageCustomerDetails({Key? key, required this.id}) : super(key: key);
  late final CustomerDetailsProtocol delegate;
  @override
  _PageCustomerDetailsState createState() => _PageCustomerDetailsState();
}

class _PageCustomerDetailsState extends State<PageCustomerDetails> {
  @override
  void initState() {
    super.initState();
    var res = await widget.delegate.getCustomerDetails(widget.id);
    print(res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Container(
        child: Row(
          children: [
            Container(
              child: Text("这里是详情"),
            ),
            ElevatedButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: Text("Pop"))
          ],
        ),
      ),
    );
  }
}
