import 'package:flutter/material.dart';

import '../models/customer.model.dart';

class CommonVars {
  static ValueNotifier<Customer?> customer = ValueNotifier(null);
  static ValueNotifier<String?> docId = ValueNotifier(null);
}
