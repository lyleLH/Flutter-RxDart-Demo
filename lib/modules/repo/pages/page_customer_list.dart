import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/modules/repo/pattern/page_customer_details.dart';

import '../../customer/customer_manager.dart';

class PageCustomerList extends StatefulWidget {
  PageCustomerList({Key? key}) : super(key: key);

  @override
  _PageCustomerListState createState() => _PageCustomerListState();
}

class _PageCustomerListState extends State<PageCustomerList> {
  var detailsPage = PageCustomerDetails(id: "anID");

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
                      )
                    },
                child: Text("Push"))
          ],
        ),
      ),
    );
  }
}
