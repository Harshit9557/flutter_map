part of 'polyline_layer.dart';

@immutable
class Polyline<R extends Object> {
  final List<LatLng> points;
  final double strokeWidth;
  final Color color;
  final double borderStrokeWidth;
  final Color? borderColor;
  final List<Color>? gradientColors;
  final List<double>? colorsStop;
  final bool isDotted;
  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final bool useStrokeWidthInMeter;

  /// Value notified in [PolylineLayer.hitNotifier]
  ///
  /// Polylines without a defined [hitValue] are still hit tested, but are not
  /// notified about.
  ///
  /// Should implement an equality operator to avoid breaking [Polyline.==].
  final R? hitValue;

  const Polyline({
    required this.points,
    this.strokeWidth = 1.0,
    this.color = const Color(0xFF00FF00),
    this.borderStrokeWidth = 0.0,
    this.borderColor = const Color(0xFFFFFF00),
    this.gradientColors,
    this.colorsStop,
    this.isDotted = false,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.useStrokeWidthInMeter = false,
    this.hitValue,
  });

  Polyline<R> copyWithNewPoints(List<LatLng> points) => Polyline<R>(
        points: points,
        strokeWidth: strokeWidth,
        color: color,
        borderStrokeWidth: borderStrokeWidth,
        borderColor: borderColor,
        gradientColors: gradientColors,
        colorsStop: colorsStop,
        isDotted: isDotted,
        strokeCap: strokeCap,
        strokeJoin: strokeJoin,
        useStrokeWidthInMeter: useStrokeWidthInMeter,
        hitValue: hitValue,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Polyline &&
          listEquals(points, other.points) &&
          strokeWidth == other.strokeWidth &&
          color == other.color &&
          borderStrokeWidth == other.borderStrokeWidth &&
          borderColor == other.borderColor &&
          listEquals(gradientColors, other.gradientColors) &&
          listEquals(colorsStop, other.colorsStop) &&
          isDotted == other.isDotted &&
          strokeCap == other.strokeCap &&
          strokeJoin == other.strokeJoin &&
          useStrokeWidthInMeter == other.useStrokeWidthInMeter &&
          hitValue == other.hitValue);

  /// Used to batch draw calls to the canvas
  int get renderHashCode => Object.hash(
        strokeWidth,
        color,
        borderStrokeWidth,
        borderColor,
        gradientColors,
        colorsStop,
        isDotted,
        strokeCap,
        strokeJoin,
        useStrokeWidthInMeter,
        hitValue,
      );

  @override
  int get hashCode => Object.hashAll([...points, renderHashCode]);
}