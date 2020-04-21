part of packages;

class WidgetImage extends StatefulWidget {
  final double metaWidth;
  final double metaHeight;
  final double metaTop;
  final double metaLeft;

  final double targetWidth;
  final double targetHeight;
  final double targetTop;
  final double targetLeft;

  final Widget child;

  final OverlayEntry entry;

  final double endOpacity;

  final Duration transientTime;

  final MoveType moveType;

  final bool rotate;

  WidgetImage(
      {this.metaWidth,
      this.metaHeight,
      this.metaTop,
      this.metaLeft,
      this.targetWidth,
      this.targetHeight,
      this.targetTop,
      this.targetLeft,
      this.child,
      this.entry,
      this.endOpacity = 0,
      this.transientTime = const Duration(milliseconds: 700),
      this.moveType = MoveType.classic,
      this.rotate = false})
      : assert(child != null);

  @override
  _WidgetImageState createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animationWidth;
  CurvedAnimation animationHeight;
  CurvedAnimation animationTop;
  CurvedAnimation animationLeft;
  CurvedAnimation animationOpacity;
  CurvedAnimation animationAngle;
  Tween<double> tweenWidth;
  Tween<double> tweenHeight;
  Tween<double> tweenTop;
  Tween<double> tweenLeft;
  Tween<double> tweenOpacity;
  Tween<double> tweenAngle;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: widget.transientTime)
          ..addListener(() {
            if (controller.isCompleted) {
              widget.entry.remove();
            } else {
              setState(() {});
            }
          })
          ..forward();
    initAnimation();
    initTween();
    super.initState();
  }

  initAnimation() {
    animationWidth = CurvedAnimation(parent: controller, curve: Curves.linear);
    animationHeight = CurvedAnimation(parent: controller, curve: Curves.linear);
    animationTop = CurvedAnimation(parent: controller, curve: Curves.linear);
    animationLeft = CurvedAnimation(parent: controller, curve: Curves.linear);
    animationOpacity =
        CurvedAnimation(parent: controller, curve: Curves.linear);
            animationAngle =
        CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    switch (widget.moveType) {
      case MoveType.linear:
        break;
      case MoveType.cool:
        animationLeft =
            CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);
        break;
      case MoveType.parabola:
        animationLeft =
            CurvedAnimation(parent: controller, curve: Curves.bounceOut);
        break;
      case MoveType.meco:
        animationWidth =
            CurvedAnimation(parent: controller, curve: Curves.easeInExpo);
        animationHeight =
            CurvedAnimation(parent: controller, curve: Curves.easeInExpo);
        break;
      default:
        animationTop =
            CurvedAnimation(parent: controller, curve: Curves.easeInQuint);
        break;
    }
  }

  initTween() {
    tweenWidth = Tween<double>(begin: widget.metaWidth, end: 0);
    tweenHeight = Tween<double>(begin: widget.metaHeight, end: 0);
    tweenTop = Tween<double>(
        begin: widget.metaTop, end: widget.targetTop + widget.targetWidth / 2);
    tweenLeft = Tween<double>(
        begin: widget.metaLeft,
        end: widget.targetLeft + widget.targetHeight / 2);
    tweenOpacity = Tween<double>(begin: 1.0, end: widget.endOpacity);
    tweenAngle = Tween<double>(begin: 0.01, end: math.pi/0.5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: tweenTop.evaluate(animationTop),
        left: tweenLeft.evaluate(animationLeft),
        width: tweenWidth.evaluate(animationWidth),
        height: tweenHeight.evaluate(animationHeight),
        child: Transform.rotate(
            //旋转90度
            angle: widget.rotate ? tweenAngle.evaluate(animationAngle) : 0.01,
            child: Opacity(
                opacity: tweenOpacity.evaluate(animationOpacity),
                child: widget.child)));
  }
}
