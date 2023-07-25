import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customer.model.dart';

class CommonVars {
  static ValueNotifier<Customer?> customer = ValueNotifier(null);
  static ValueNotifier<String?> docId = ValueNotifier(null);

  static Transition transition = Transition.fadeIn;

  static ValueNotifier<int> selectedBottomIndex = ValueNotifier(0);
}
