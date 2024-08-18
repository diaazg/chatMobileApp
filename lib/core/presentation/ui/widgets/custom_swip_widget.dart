import 'package:flutter/material.dart';

class LimitedSwipeWidget extends StatefulWidget {
  final Widget child;
  final double swipeLimit; // The maximum swipe distance
  final Color swipeBackgroundColor; // The color to display when swiping
  final IconData icon; // The icon to display when swiping
  final VoidCallback? onDelete; // Callback for delete action

  const LimitedSwipeWidget({
    super.key,
    required this.child,
    this.swipeLimit = 100.0,
    this.swipeBackgroundColor = Colors.red,
    this.icon = Icons.delete,
    this.onDelete,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LimitedSwipeWidgetState createState() => _LimitedSwipeWidgetState();
}

class _LimitedSwipeWidgetState extends State<LimitedSwipeWidget> {
  double _swipeDistance = 0.0;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          
            setState(() {
              _swipeDistance += details.delta.dx;

              if (_swipeDistance > 0) {
                _swipeDistance = 0;
              } else if (_swipeDistance < -widget.swipeLimit) {
                _swipeDistance = -widget.swipeLimit;

                if (widget.onDelete != null && _swipeDistance == -widget.swipeLimit)  {
                 
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Are you sure?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    widget.onDelete!();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'))
                            ],
                          ));
                  
                }
              }
            });
          
        },
        onHorizontalDragEnd: (details) {
           setState(() {
              _swipeDistance = 0;
            });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: widget.swipeBackgroundColor,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 2),
                child: Icon(widget.icon, color: Colors.white),
              ),
            ),
            ClipRect(
              child: Transform.translate(
                offset: Offset(_swipeDistance, 0),
                child: Container(
                  color: Colors.white,
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
