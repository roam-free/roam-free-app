import 'package:flutter/material.dart';

class Filter {
  String id;
  String name;
  var defaultValue;
  IconData icon;

  var currentValue;

  Filter(this.id, this.name, this.defaultValue, this.icon) {
    currentValue = this.defaultValue;
  }

  void restToDefault() {
    currentValue = defaultValue;
  }
}
