import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class BorderedTextbox extends StatefulWidget {
  final String hintText;

  var onTap;

  var validation;
  bool readOnly;
  final TextEditingController? textEditingController;

  BorderedTextbox({
    super.key,
    this.validation,
    
    this.readOnly = false,
    required this.hintText,
    this.onTap,
   
    
    this.textEditingController,
  });

  @override
  State<BorderedTextbox> createState() => _InputTextFieldMaxlinesState();
}

class _InputTextFieldMaxlinesState extends State<BorderedTextbox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       
        validator: widget.validation,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
      
        controller: widget.textEditingController,
        cursorColor: AppTheme.primaryColor,
       
      
        decoration: InputDecoration(
       
          hintStyle: GoogleFonts.openSans(
              color: AppTheme.textBlackColor, fontSize: 13),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(225, 30, 61, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(54, 58, 61, 1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(54, 58, 61, 1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Color.fromRGBO(54, 58, 61, 1),
                width: 1,
              )),
              
         
          contentPadding: const EdgeInsetsDirectional.fromSTEB(15, 15, 8, 8),
          hintText: widget.hintText,
          
          floatingLabelStyle:
              const TextStyle(color: Color.fromRGBO(245, 73, 53, 1)),
        ));
  }
}
