import 'package:flutter/material.dart';
import 'package:flutter_application_design/Constant/ConstantColors.dart';

class CustomCard extends StatefulWidget {
  final String? txt;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  bool? isCustomPadding;
  CustomCard(
      {Key? key,
      required this.child,
      this.txt,
      this.margin,
      this.padding,
      this.isCustomPadding})
      : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: widget.margin ?? EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor,
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 20.0,
          ),
          BoxShadow(
            color: AppColor.shadowColor,
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 20.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isCustomPadding ?? false
              ? Padding(
                  padding: EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    widget.txt.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromRGBO(44, 57, 97, 1)),
                  ),
                )
              : Text(
                  widget.txt.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(44, 57, 97, 1)),
                ),
          widget.child
        ],
      ),
    );
  }
}
