import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

enum NexAvatarSize { small, medium, large }

class NexAvatar extends StatelessWidget {
  const NexAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = NexAvatarSize.medium,
    this.isOnline = false,
  });

  final String? imageUrl;
  final String? initials;
  final NexAvatarSize size;
  final bool isOnline;

  double get _diameter => switch (size) {
    NexAvatarSize.small => 24,
    NexAvatarSize.medium => 32,
    NexAvatarSize.large => 48,
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return SizedBox(
      width: _diameter,
      height: _diameter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    width: _diameter,
                    height: _diameter,
                  )
                : Container(
                    color: colors.surfaceHigh,
                    alignment: Alignment.center,
                    child: Text(
                      initials ?? '?',
                      style: AppTextStyles.label.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
          ),
          if (isOnline)
            Positioned(
              right: -1,
              bottom: -1,
              child: Container(
                width: _diameter * 0.28,
                height: _diameter * 0.28,
                decoration: BoxDecoration(
                  color: colors.success,
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
