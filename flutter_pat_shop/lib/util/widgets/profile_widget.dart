import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';

class ProfileWidget extends StatelessWidget {
  final Image? image;
  final VoidCallback onClicked;
  final Icon icon;

  const ProfileWidget(
      {Key? key, required this.image, required this.onClicked, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(bottom: 0, right: 4, child: buildEditIcon(kPrimaryColor))
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image == null ? NetworkImage(LINK_IMAGE_TEST): image!.image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          onImageError: (exception, stackTrace) =>  Icon(Icons.error),
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) =>
      buildCircle(
        color: Colors.white ,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: icon
        ),
      );

  buildCircle({required Color color, required double all, required Widget child}) =>
      ClipOval(
        child: Container(
          color: color,
          child: child,
          padding: EdgeInsets.all(all),
        ),
      );
}
