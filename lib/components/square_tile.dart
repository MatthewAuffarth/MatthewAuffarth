import 'package:flutter/material.dart';

 
class SquareTile extends StatelessWidget {

  final String imagePath;
  final double size;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.size
    });

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      child: Image.asset(imagePath,
      width: size,
      height: size,)
    );
  }



}