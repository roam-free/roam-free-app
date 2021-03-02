import 'package:flutter/material.dart';
import 'package:roam_free/ui/shared/shared_styles.dart';

import 'add_image_button.dart';

class ImageSelectionBox extends StatelessWidget {
  final String title;
  final Future future;
  final Function onPressed;

  const ImageSelectionBox({
    @required this.title,
    @required this.future,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: fieldDecortaion,
          width: double.infinity,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Widget>>(
                future: future,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<Widget>> snapshot,
                ) {
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 6,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: snapshot.data != null
                        ? snapshot.data
                        : [
                            AddImageButton(
                              onPressed: onPressed,
                            )
                          ],
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
