class AttachmentModel {
  const AttachmentModel({
    required this.id,
    required this.fileName,
    required this.sizeBytes,
    this.filePath,
  });

  final String id;
  final String fileName;
  final int sizeBytes;

  /// Ruta local del archivo (nula en Web). Solo se usa para vista
  /// previa; no hay backend que reciba o almacene el archivo todavía.
  final String? filePath;
}
