import 'package:flutter/material.dart';

class BackgroundCancel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 10,
      ),
      alignment: AlignmentDirectional.centerEnd,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "取消",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
