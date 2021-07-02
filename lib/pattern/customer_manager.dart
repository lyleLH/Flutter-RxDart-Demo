import 'package:faker/faker.dart';
import 'package:my_app/pattern/models/customer_details.dart';
import 'package:my_app/pattern/customer_details_protocol.dart';

class CustomerManager implements CustomerDetailsProtocol {
  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        final email = faker.internet.email();
        final hobby = faker.sport.name();
        final position = faker.job.title();
        print("CustomerManager -- getCustomerDetails");
        return CustomerDetails(id, email, hobby, position);
      },
    );
  }
}
