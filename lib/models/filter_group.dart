import 'package:flutter/material.dart';
import 'package:roam_free/models/filter.dart';
import 'package:roam_free/services/filter_service.dart';

class FilterGroup {
  FiltersType _id;
  String _name;
  Map<String, Filter> _filters = Map();
  ImageProvider image;

  Map<String, Filter> get filters => _filters;
  set filters(filters) => _filters = filters;

  FiltersType get id => _id;
  String get name => _name;

  FilterGroup(this._id, this._name);

  void add(filter) {
    _filters[filter.id] = filter;
  }
}
