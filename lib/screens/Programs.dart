import 'package:flutter/cupertino.dart';

class Programs extends StatefulWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Programs"),
    );
  }
}
