import 'animations_double_range.dart';

extension ValueConverter on double {
  ///this extension on double helps to convert a value that belongs in a range of values to new value that belong in another range of values.
  ///[oldRange] is the range of value we want to convert from.
  ///[newRange] is the new range of values we want to convert to.
  double getNewRangeValue({required DoubleRange oldRange, required DoubleRange newRange}) {
    final rangeOld = oldRange.max - oldRange.min;
    final rangeNew = newRange.max - newRange.min;
    final newValue = (((this - oldRange.min) * rangeNew) / rangeOld) + newRange.min;
    return newValue;
  }
}
