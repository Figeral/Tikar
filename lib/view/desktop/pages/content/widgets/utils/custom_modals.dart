import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomModelWidget extends StatefulWidget {
  bool isVisible;
  CustomModelWidget({required this.isVisible});
  @override
  _CustomModelWidgetState createState() => _CustomModelWidgetState();
}

class _CustomModelWidgetState extends State<CustomModelWidget> {
  late bool _isVisible;
  @override
  void didUpdateWidget(covariant CustomModelWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      _isVisible = widget.isVisible;
    }
  }

  @override
  void initState() {
    _isVisible = widget.isVisible;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Positioned(
        left: 250,
        top: 150,
        child: SizedBox(
          width: 700,
          height: 800,
          child: Card(
            color: Colors.grey.shade300,
            child: Center(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    child: Text("hello bro , custom modal"))),
          ),
        ),
      ),
    );
  }
}
