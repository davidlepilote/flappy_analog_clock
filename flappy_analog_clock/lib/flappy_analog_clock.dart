import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'constants.dart';

/// Renders the clock with respect to the [currentTime] passed in parameters.
/// This clock is in a minimalistic style.
///
/// The clock consists in lines representing the hours and two hands for the minutes and the hours.
/// Only the digit '6' is written.
class FlappyAnalogClockWidget extends StatelessWidget {
  final DateTime currentTime;

  const FlappyAnalogClockWidget({Key key, this.currentTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: _buildLines(context) +
              <Widget>[
                Transform.translate(
                  offset: Offset(0, Constants.NUMBER_OFFSET * 1.46),
                  child: Text(
                    '6',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                Transform.rotate(
                  angle: _hourAngle(),
                  child: Transform.translate(
                    offset: Offset(0, Constants.HOUR_HAND_OFFSET),
                    child: Container(
                      color: Theme.of(context).accentColor,
                      width: Constants.HAND_WIDTH,
                      height: Constants.HOUR_HAND_LENGTH,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).backgroundColor),
                  width: Constants.INNER_MARGIN_CIRCLE_SIZE,
                  height: Constants.INNER_MARGIN_CIRCLE_SIZE,
                ),
                Transform.rotate(
                  angle: _minuteAngle(),
                  child: Transform.translate(
                    offset: Offset(0, Constants.MINUTE_HAND_OFFSET),
                    child: Container(
                      color: Theme.of(context).accentColor,
                      width: Constants.HAND_WIDTH,
                      height: Constants.MINUTE_HAND_LENGTH,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(BorderSide(width: Constants.HAND_WIDTH, color: Theme.of(context).accentColor)),
                    color: Theme.of(context).backgroundColor,
                  ),
                  width: Constants.INNER_CIRCLE_SIZE,
                  height: Constants.INNER_CIRCLE_SIZE,
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                  width: Constants.BLACK_CIRCLE_SIZE,
                  height: Constants.BLACK_CIRCLE_SIZE,
                )
              ],
        ),
      ),
    );
  }

  double _hourAngle() {
    return radians((currentTime.hour + currentTime.minute / 60 + currentTime.second / 3600) * 360 / 12.0);
  }

  double _minuteAngle() {
    return radians((currentTime.minute + currentTime.second / 60) * 360 / 60.0);
  }

  List<Widget> _buildLines(BuildContext context) {
    List<Widget> lines = [];
    for (int i = 0; i < 12; i++) {
      lines.add(
        Transform.rotate(
          angle: radians(i.toDouble() * Constants.HOUR_ANGLE_IN_DEGREE),
          child: Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width / 2 + Constants.OUTER_CIRCLE_SIZE + (i == 3 ? Constants.NUMBER_OFFSET : 0), 0),
            child: Container(
              height: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }
    for (int i = 0; i < 3; i++) {
      lines.add(
        Transform.rotate(
          angle: radians((2 + i.toDouble()) * 3 * Constants.HOUR_ANGLE_IN_DEGREE),
          child: Transform.translate(
            offset: Offset(Constants.OUTER_CIRCLE_SIZE + Constants.INNER_LINE_SIZE / 2, 0),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).highlightColor),
              height: 2,
              width: Constants.INNER_LINE_SIZE,
            ),
          ),
        ),
      );
    }
    return lines;
  }
}
