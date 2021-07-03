import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customer_manager.dart';
import 'customer_details.dart';

class CustomerListPage extends StatefulWidget {
  CustomerListPage({Key? key}) : super(key: key);

  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  var detailsPage = CustomerDetailsPage(id: "anID");

  @override
  void initState() {
    super.initState();
    this.detailsPage.delegate = CustomerManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: Container(
        child: Row(
          children: [
            Container(
              child: Text("列表"),
            ),
            ElevatedButton(
              onPressed: () => {
                Future.delayed(
                  Duration.zero,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return this.detailsPage;
                        },
                      ),
                    );
                  },
                ),
              },
              child: Text("Push"),
            ),
          ],
        ),
      ),
    );
  }
}
