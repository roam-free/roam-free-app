import 'package:logger/logger.dart';
import 'package:roam_free/ui/views/new_host/new_host_view_model.dart';
import 'package:roam_free/ui/widgets/image_selection_box.dart';
import 'package:roam_free/ui/widgets/input_field.dart';
import 'package:roam_free/ui/widgets/input_field_multiline.dart';
import 'package:roam_free/ui/widgets/select_box.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/ui/widgets/busy_button.dart';

class NewHostView extends StatelessWidget {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewHostViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add New Host'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
          child: ListView(
            children: [
              InputField(
                placeholder: 'Name',
                controller: model.nameController,
              ),
              InputField(
                placeholder: 'Email Address',
                controller: model.emailController,
              ),
              InputField(
                placeholder: 'Phone Number',
                controller: model.phoneController,
              ),
              InputFieldMultiline(
                controller: model.descriptionController,
                placeholder: "Description",
                minLines: 6,
                maxLines: 6,
              ),
              ImageSelectionBox(
                title: "Images",
                future: model.generateImageGrid(),
                onPressed: () => model.chooseImage(),
              ),
              SelectBox(
                placeholder: 'Location',
                controller: model.locationController,
                onPressed: () => model.selectLocation(context),
              ),
              SelectBox(
                placeholder: 'Services',
                controller: model.servicesController,
                onPressed: () => model.selectServices(),
              ),
              SelectBox(
                placeholder: 'Activities',
                controller: model.activitiesController,
                onPressed: () => model.selectActivities(),
              ),
              ButtonBar(
                children: [
                  BusyButton(
                    busy: model.isBusy,
                    onPressed: () => model.save(),
                    title: 'SAVE',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NewHostViewModel(),
    );
  }
}
