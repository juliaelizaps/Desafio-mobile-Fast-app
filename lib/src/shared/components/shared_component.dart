import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../metrics/metrics.dart';

class SharedComponent extends StatelessWidget {
  final Widget child;
  final double padding;
  final double borderRadius;
  final Color backgroundColor;

  const SharedComponent({
    required this.child,
    this.padding = AppMetrics.medium,
    this.borderRadius = AppMetrics.borderRadius,
    this.backgroundColor = AppColors.cardBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
