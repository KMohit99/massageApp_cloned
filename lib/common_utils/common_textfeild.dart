import 'package:flutter/material.dart';

import 'Colorconstant.dart';

class CommonTextfeild extends StatefulWidget {
  final String labelname;
  final String hintname;
  final TextEditingController controller;
  final VoidCallback? ontap;
  final bool readonly;

  const CommonTextfeild(
      {Key? key,
      required this.labelname,
      required this.hintname,
      required this.controller,
      this.ontap,
      required this.readonly})
      : super(key: key);

  @override
  State<CommonTextfeild> createState() => _CommonTextfeildState();
}

class _CommonTextfeildState extends State<CommonTextfeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // "",
          widget.labelname,
          style: TextStyle(
            color: ColorConstant.whiteiconcolor,
            fontSize: 18,
            fontFamily: 'Lato Regular',
          ),
        ),
        Transform.translate(
          offset: Offset(0, -10),
          child: TextFormField(
            onTap: widget.ontap,
            readOnly: widget.readonly,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.')) {
                return 'Please Enter Your Email';
              }
              return null;
            },
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: ColorConstant.whiteiconcolor),
            decoration: InputDecoration(
              // isDense: true,
              errorStyle: const TextStyle(fontSize: 0.01),
              fillColor: Colors.white,
              // hintText: "",
              hintText: widget.hintname,
              contentPadding: EdgeInsets.only(top: 20),
              hintStyle: TextStyle(
                color: ColorConstant.whiteiconcolor,
                fontFamily: 'LR',
                fontSize: 14,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.whiteiconcolor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.whiteiconcolor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
