import 'package:aghanilyrics/tiktok_downloader/utils/media_query.dart';
import 'package:flutter/material.dart';


class CustomElevatedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double? width;

  const CustomElevatedBtn(
      {Key? key, this.onPressed, required this.label, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width ?? context.width / 2,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label,textAlign: TextAlign.center,),
      ),
    );
  }
}
