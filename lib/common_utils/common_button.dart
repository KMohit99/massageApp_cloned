import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:massage_app/common_utils/Colorconstant.dart';

class CommonButton extends StatefulWidget {
  final String label;
  final HexColor back_color;
  final HexColor text_color;
  final VoidCallback? ontap;

  const CommonButton({Key? key,
    required this.label,
    required this.back_color,
    required this.text_color,  this.ontap})
      : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(color: widget.back_color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: 20,
                color: widget.text_color,
                fontFamily: 'LR',
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
