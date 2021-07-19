import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoStatusButton extends StatefulWidget {
  const TwoStatusButton(
      {Key? key,
      this.isOn = false,
      required this.index,
      required this.onChange})
      : super(key: key);
  final bool isOn;
  final int index;
  final ValueChanged<bool> onChange;

  @override
  _TwoStatusButtonState createState() => _TwoStatusButtonState();
}

class _TwoStatusButtonState extends State<TwoStatusButton> {
  late bool _isOn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleState,
      child: Container(
        width: 80.0,
        height: 56.0,
        color: _isOn ? Colors.red : Colors.green,
      ),
    );
  }

  void _toggleState() {
    _isOn = !_isOn;
    if (mounted) {
      setState(() {});
    }
    widget.onChange.call(_isOn);
  }
}
