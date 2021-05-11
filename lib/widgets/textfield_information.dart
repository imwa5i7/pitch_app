import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextFieldInformation extends StatelessWidget {
  final String title;
  final double height;
  TextFieldInformation({@required this.title, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.make(),
        SizedBox(height: 4),
        Container(
          height: height,
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))),
          ),
        ),
      ],
    );
  }
}
