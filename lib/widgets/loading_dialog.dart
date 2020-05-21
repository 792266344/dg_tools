part of packages;

class LoadingDialog extends StatefulWidget {
  Color ballColor;
  Color backgroundColor;
  Color pathColor = Colors.white;
  double widthAndHeight;

  LoadingDialog(
      {this.ballColor = Colors.pinkAccent,
      this.backgroundColor = const Color(0xFF556EFC),
      this.pathColor = Colors.white,
      this.widthAndHeight = 80});

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog>
    with SingleTickerProviderStateMixin {
  AnimationController ctl;
  List<_Ball> ballList;
  @override
  void dispose() {
    ctl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ballList = [
      _Ball(
          color: widget.ballColor,
          r: 4,
          x: -10,
          y: 40,
          value: widget.widthAndHeight,
          vertical: false),
      _Ball(
          color: widget.ballColor,
          r: 4,
          x: 40,
          y: 90,
          value: widget.widthAndHeight,
          vertical: true)
    ];
    ctl = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..addListener(() {
        setState(() {
          ballList.forEach((b) {
            b.run();
          });
        });
      });
    ctl.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Center(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            new BoxShadow(
              color: widget.backgroundColor, //阴影颜色
              blurRadius: 2.0, //阴影大小
            ),
          ],
          color: widget.backgroundColor.withOpacity(0),
        ),
        width: widget.widthAndHeight,
        height: widget.widthAndHeight,
        child: Transform.rotate(
          angle: pi / 4,
          child: CustomPaint(
            painter: _BallPainter(ballList, widget.widthAndHeight,widget.pathColor),
          ),
        ),
      )),
    );
  }
}

class _Ball {
  double x; //x坐标
  double y; //y坐标
  // double vX; //x速度
  // double vY; //y速度
  // double aX; //x加速度
  // double aY; //y加速度
  Color color; //颜色
  double r; //半径
  double value;
  bool vertical;
  double i = 1;
  void run() {
    if (vertical) {
      y = value / 2 + cos(pi * i) * (value + 20) / 2;
      x = value / 2 + sin(pi * i) * 20;
    } else {
      x = value / 2 + cos(pi * i) * (value + 20) / 2;
      y = value / 2 + sin(pi * i) * 20;
    }
    i += 0.02;
  }

  _Ball(
      {this.x,
      this.y,
      // this.vX,
      // this.vY,
      // this.aX,
      // this.aY,
      this.value,
      this.color,
      this.r,
      this.vertical = false});
}

class _BallPainter extends CustomPainter {
  List<_Ball> _ballList; //小球列表
  Color pathColor;
  double value;
  Paint mPaint; //主画笔
  Paint ellipsePaint;

  _BallPainter(this._ballList, this.value,this.pathColor) {
    mPaint = new Paint()..strokeWidth = 1.0;
    ellipsePaint = new Paint()
      ..color = pathColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Rect.fromLTRB(-10, (value - 40) / 2, value + 10, (value + 40) / 2);
    Rect rect2 =
        Rect.fromLTRB((value - 40) / 2, -10, (value + 40) / 2, value + 10);
    canvas.drawOval(rect, ellipsePaint);
    canvas.drawOval(rect2, ellipsePaint);
    _ballList.forEach((b) => _drawBall(canvas, b));
  }

  void _drawBall(Canvas canvas, _Ball ball) {
    canvas.drawCircle(
        Offset(ball.x, ball.y), ball.r, mPaint..color = ball.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
