import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({Key key, this.value, this.onChanged, this.mouseCursor})
      : super(key: key);

  /// Whether this button is checked.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the value of the button should change.
  ///
  /// The buton passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox with the new
  /// value.
  ///
  /// If this callback is null, the button will be displayed as disabled
  /// and will not respond to input gestures.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// PriorityButton(
  ///   value: _throwShotAway,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _throwShotAway = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool> onChanged;
  final MouseCursor mouseCursor;
  static const double width = 18.0;

  @override
  _PriorityButtonState createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  bool get enabled => widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
