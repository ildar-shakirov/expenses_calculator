import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFilledButton extends StatelessWidget {
  final Function handleClick;
  final String title;

  const AdaptiveFilledButton(this.title, this.handleClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: 250,
                height: 40,
                child: CupertinoButton.filled(
                    child: Text(
                      'Add transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: handleClick),
              ),
            )
          : ElevatedButton(
              onPressed: handleClick,
              child: Text('Add transaction'),
            ),
    );
  }
}
