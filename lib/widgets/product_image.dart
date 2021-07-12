import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {

  final String? url;

  const ProductImage({
    Key? key, 
    this.url
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( left: 10, right: 10, top: 10 ),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular(45) ),
            child: getImage(url)
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular(45) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );


  Widget getImage( String? picture ) {

    if ( picture == null ) 
      return Image(
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        );

    if ( picture.startsWith('http') ) 
        return FadeInImage(
          image: NetworkImage( this.url! ),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.cover,
        );


    return Image.file(
      File( picture ),
      fit: BoxFit.cover,
    );
  }

}