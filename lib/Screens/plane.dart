import 'package:flutter/material.dart';

class PlaneImage extends StatelessWidget {
  const PlaneImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 80,
      width: 80,
      child: Image
      .asset('assets/images/aeroplane.png'),
    );
  }
}