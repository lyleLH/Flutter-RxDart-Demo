import 'customer_details.dart';

abstract class CustomerDetailsProtocol {
  Future<CustomerDetails> getCustomerDetails(String id);
}
