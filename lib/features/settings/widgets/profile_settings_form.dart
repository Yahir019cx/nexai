import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/features/settings/settings_controller.dart';
import 'package:nexai/widgets/nex_avatar.dart';
import 'package:nexai/widgets/nex_input.dart';
import 'package:provider/provider.dart';

class ProfileSettingsForm extends StatefulWidget {
  const ProfileSettingsForm({super.key});

  @override
  State<ProfileSettingsForm> createState() => _ProfileSettingsFormState();
}

class _ProfileSettingsFormState extends State<ProfileSettingsForm> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: context.read<SettingsController>().displayName,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NexAvatar(
          initials: _initialsFrom(settings.displayName),
          size: NexAvatarSize.large,
        ),
        const SizedBox(width: AppSpacing.space16),
        Expanded(
          child: NexInput(
            label: 'Nombre',
            controller: _nameController,
            onChanged: settings.updateDisplayName,
          ),
        ),
      ],
    );
  }

  String _initialsFrom(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    final parts = trimmed.split(RegExp(r'\s+'));
    final first = parts.first.substring(0, 1);
    final last = parts.length > 1 ? parts.last.substring(0, 1) : '';
    return (first + last).toUpperCase();
  }
}
