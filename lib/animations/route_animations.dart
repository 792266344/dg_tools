part of packages;

class RouteAnimation extends PageRouteBuilder{
  final Widget widget;
  RouteAnimation(this.widget):super(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder:(BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2){
      return widget;
    },
    transitionsBuilder:(BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,Widget child){
       return RotationTransition(
       turns: Tween(begin: 0.0, end: 1.0).
       animate(
         CurvedAnimation(
           parent: animation1,
           curve: Curves.fastOutSlowIn,
         )
       ),
       child: ScaleTransition(
         scale: Tween(begin: 0.0, end: 1.0).
         animate(CurvedAnimation(parent: animation2, curve: Curves.fastOutSlowIn)),
         child: child,
       ),
     );
    }
  );
}