import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstsHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimension.screenHeight / 5.6;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstsHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstsHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: AppColors.paraColor,
              size: Dimension.font16,
              text: firstsHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.5,
                    color: AppColors.paraColor,
                    size: Dimension.font16,
                    text: hiddenText
                        ? (firstsHalf + "...")
                        : (firstsHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                      print("clicked!!!");
                      print(widget.text.length);
                    });
                  },
                  child: Row(children: [
                    hiddenText
                        ? SmallText(
                            text: "Show more",
                            color: AppColors.mainColor,
                          )
                        : SmallText(
                            text: "Show less",
                            color: AppColors.mainColor,
                          ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.mainColor,
                    )
                  ]),
                )
              ],
            ),
    );
  }
}