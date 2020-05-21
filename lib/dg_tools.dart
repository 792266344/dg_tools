part of packages;

class DgTools {
  static showLoadingDialog(
    BuildContext ctx,
    {Color ballColor = Colors.pinkAccent,
    Color backgroundColor = const Color(0xFF556EFC),
    Color pathColor = Colors.white,
    double widthAndHeight = 80}) async {
    await showDialog(
        context: ctx,
        barrierDismissible: true,
        barrierColor: Colors.white.withOpacity(0.1),
        builder: (_) => LoadingDialog(
          ballColor: ballColor,
          backgroundColor: backgroundColor,
          pathColor:pathColor,
          widthAndHeight: widthAndHeight,
          ));
  }
}
