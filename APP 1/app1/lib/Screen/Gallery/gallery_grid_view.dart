import 'package:app1/Screen/Gallery/gallery_main_data_screen.dart';
import 'package:flutter/material.dart';

class ClassItem extends StatelessWidget {
  String title;

  Color color = Colors.green;
  ClassItem(this.title);
  void selectClass(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Gallery_main_data.routeName,
      arguments: {
        'title': title,
      },
    );
  }
  //final List<Galleryclass> passingData =data.map.(())

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectClass(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}
