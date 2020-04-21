part of packages;

class DgTools {
  static moveAnimation(
      {GlobalKey metaKey,
      List<GlobalKey> targetKeys,
      double endOpacity = 0,
      MoveType moveType = MoveType.classic,
      Duration transientTime = const Duration(milliseconds:700),
      bool rotate = false}) async {
    assert(metaKey != null && targetKeys != null && targetKeys.length > 0);
    RenderRepaintBoundary metaRrb = metaKey.currentContext.findRenderObject();
    Size metaSize = metaRrb.size;
    Offset metaOffset = metaRrb.localToGlobal(Offset.zero);
    ui.Image image = await metaRrb.toImage(pixelRatio: 1.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Widget child = Image.memory(Uint8List.view(byteData.buffer));
    for (var targetKey in targetKeys) {
      OverlayEntry entry;
      RenderRepaintBoundary targetRrb =
          targetKey.currentContext.findRenderObject();
      Offset targetOffset = targetRrb.localToGlobal(Offset.zero);
      Size targetSize = targetRrb.size;
      entry = OverlayEntry(builder: (context) {
        return WidgetImage(
          metaWidth: metaSize.width,
          metaHeight: metaSize.height,
          metaTop: metaOffset.dy,
          metaLeft: metaOffset.dx,
          targetWidth: targetSize.width,
          targetHeight: targetSize.height,
          targetTop: targetOffset.dy,
          targetLeft: targetOffset.dx,
          child: child,
          entry: entry,
          endOpacity: endOpacity,
          moveType: moveType,
          transientTime: transientTime,
          rotate: rotate,
        );
      });

      Overlay.of(metaKey.currentContext).insert(entry);
    }
  }

  removeWidgetImageEntry(OverlayEntry entry) => entry.remove();
}
