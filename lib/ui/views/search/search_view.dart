import 'package:flutter/material.dart';
import 'package:roam_free/ui/widgets/nav_bar/nav_bar_view.dart';
import 'package:roam_free/ui/views/search/search_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Roam Free'),
        ),
        body: Container(),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
