part of packages;

class WidgetImage extends StatefulWidget {
  @override
  _WidgetImageState createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:100.0,
      height: 100.0,
      color: Colors.red,
    );
  }
}