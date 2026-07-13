import 'package:flutter/material.dart';

/// Ícono representativo por tipo de archivo (doc 006: PDF, Word,
/// Excel, Imágenes, Texto, Código, Audio, Video).
IconData iconForAttachment(String fileName) {
  final extension = fileName.contains('.')
      ? fileName.split('.').last.toLowerCase()
      : '';

  return switch (extension) {
    'pdf' => Icons.picture_as_pdf_outlined,
    'doc' || 'docx' => Icons.description_outlined,
    'xls' || 'xlsx' || 'csv' => Icons.table_chart_outlined,
    'png' || 'jpg' || 'jpeg' || 'gif' || 'webp' => Icons.image_outlined,
    'mp3' || 'wav' || 'ogg' || 'm4a' => Icons.audiotrack_outlined,
    'mp4' || 'mov' || 'avi' || 'mkv' => Icons.videocam_outlined,
    'dart' ||
    'js' ||
    'ts' ||
    'py' ||
    'java' ||
    'json' ||
    'html' ||
    'css' => Icons.code_outlined,
    _ => Icons.insert_drive_file_outlined,
  };
}
