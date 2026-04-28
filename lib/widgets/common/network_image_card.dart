import 'package:flutter/material.dart';

class NetworkImageCard extends StatelessWidget {
  const NetworkImageCard({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 18,
    this.child,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.network(
            imageUrl,
            height: height,
            width: width,
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) => Container(
              height: height,
              width: width,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              alignment: Alignment.center,
              child: Icon(
                Icons.image_not_supported_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                height: height,
                width: width,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              );
            },
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

