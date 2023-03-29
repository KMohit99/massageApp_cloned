import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'Colorconstant.dart';
import 'FontUtils.dart';

class CommonDropDown extends StatefulWidget {
  final List<String> items;
  String? selectedValue;
  final String labelname;
  final String hintname;

  CommonDropDown(
      {Key? key,
      required this.items,
      this.selectedValue,
      required this.labelname,
      required this.hintname})
      : super(key: key);

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
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
        SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Expanded(
                child: Text(
                  widget.hintname,
                  style: FontStyleUtility.h14(
                      fontColor: Colors.white,
                      family: "LR",
                      fontWeight: FWT.regular),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: FontStyleUtility.h14(
                              fontColor: Colors.white,
                              family: "LR",
                              fontWeight: FWT.regular),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.selectedValue = value as String;
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 40,
                width: 160,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white,
                    width: 1
                  ),
                  color: Colors.transparent,
                ),
                // elevation: 2,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.yellow,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  // width: 200,
                  padding: null,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 1
                    ),
                    // borderRadius: BorderRadius.circular(14),
                    color: ColorConstant.greyback,
                  ),
                  elevation: 8,
                  offset: const Offset(0, -10),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  )),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
