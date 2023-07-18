import 'package:flutter/material.dart';

// waiting for: https://github.com/flutter/flutter/issues/115912
const surfaceContainer = Color.fromARGB(255, 237, 238, 249);

final shimmerDarkBaseColor = surfaceContainer.withAlpha(150);
final shimmerLightBaseColor = Colors.white.withAlpha(100);

final shimmerDarkHighlightColor = surfaceContainer.withAlpha(50);
final shimmerLightHighlightColor = surfaceContainer.withAlpha(1);
