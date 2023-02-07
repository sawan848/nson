import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nson/ui/theme.dart';

import '../services/theme_services.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: titleStyle,
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            Expanded(
  
                child: TextFormField(
              
                  readOnly: widget==null?false:true,
              autofocus: false,
              controller: controller,
              cursorColor: ThemeService().theme == ThemeMode.dark
                  ? Colors.grey[100]
                  : Colors.grey[700],
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subTitleStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        
                        color: ThemeService().theme == ThemeMode.dark
                  ? darkHeaderClr
                  : Colors.white
                      )
                      ),
                      enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      
                        color: ThemeService().theme == ThemeMode.dark
                  ? darkHeaderClr
                  : Colors.white

                      )
                      )
                      )

            ),
            ),
            widget==null?Container():
            Container(
              child: widget,
            )
          ],
          ),
        )
      ]),
    );
  }
}
