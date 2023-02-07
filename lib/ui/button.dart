import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nson/ui/theme.dart';

import '../services/theme_services.dart';

class Button extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Button({super.key,
  required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
            color:  ThemeService().theme == ThemeMode.dark
              ? primaryClr
              : Colors.black,),
            child: Center(
              child: 
                Text("$label",
                textAlign:TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              
            ),
      ),
    );
  }
}
