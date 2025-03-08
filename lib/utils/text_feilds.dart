import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  var color;
  var fillcolor;
  var icon;
  var preicon;
  bool readOnly;
  var validation;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  var ontap;
  var ontapSuffix;
  final bool obsecureText;
  final bool isSuffixIcon;
  final TextEditingController? textEditingController;
  MyTextField(
      {super.key,
      required this.hintText,
      required this.color,
      this.icon,
      this.fillcolor = Colors.white,
      this.ontapSuffix,
      this.obsecureText = false,
      this.isSuffixIcon = false,
      this.readOnly = false,
      this.preicon,
      this.ontap,
      this.textInputType,
      this.inputFormatters,
      this.textEditingController,
      this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: textInputType,
        onTap: ontap,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        controller: textEditingController,
        obscureText: obsecureText,
        validator: validation,
        style: GoogleFonts.openSans(),
        cursorColor: AppTheme.black,
        // cursorHeight: 20.h,
        //  textAlignVertical: TextAlignVertical.center,
    
        decoration: InputDecoration(
          
            counterText: '',
            errorStyle: GoogleFonts.inter(fontSize: 12),
           
            
          
            hintStyle: GoogleFonts.openSans(color: AppTheme.textBlackColor, fontSize: 13),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(
            //        color: Color.fromRGBO(0, 0, 0, 1),
            //     width: 1,
            //   ),
            //   borderRadius: BorderRadius.circular(12),
            // ),
           
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                   color: Color.fromRGBO(0, 0, 0, 1),
                width: 1,
              ),
             
            ),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12),
            //     borderSide: BorderSide(
            //         color: Color.fromRGBO(0, 0, 0, 1),
            //       width: 1,
            //     )),
                 isDense: true,
          //  filled: true,
           //  fillColor: fillcolor,
            contentPadding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
            hintText: hintText,
            floatingLabelStyle:
                const TextStyle(color: Color.fromRGBO(245, 73, 53, 1)),
            suffixIcon: isSuffixIcon
                ? GestureDetector(
                    child: !obsecureText
                        ? Icon(
                            Icons.visibility_off,
                            size: 16,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility,
                            size: 16,
                            color: Colors.grey,
                          ),
                    onTap: ontapSuffix,
                  )
                : icon));
  }
}
