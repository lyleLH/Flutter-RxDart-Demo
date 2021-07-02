import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customer_details_protocol.dart';

class CustomerDetailsPage extends StatefulWidget {
  final String id;
  CustomerDetailsPage({Key? key, required this.id}) : super(key: key);
  late final CustomerDetailsProtocol delegate;
  @override
  _CustomerDetailsPageState createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  @override
  void initState() {
    super.initState();

    var res = widget.delegate.getCustomerDetails(widget.id);
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
