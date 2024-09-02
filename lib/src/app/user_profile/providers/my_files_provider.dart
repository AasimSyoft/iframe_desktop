import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileState {
  final String? fileName;
  final int? fileSize;
  final File? selectedFile;
  final Uint8List? selectedFileBytes;

  FileState({
    this.fileName,
    this.fileSize,
    this.selectedFile,
    this.selectedFileBytes,
  });

  FileState copyWith({
    String? fileName,
    int? fileSize,
    File? selectedFile,
    Uint8List? selectedFileBytes,
  }) {
    return FileState(
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      selectedFile: selectedFile ?? this.selectedFile,
      selectedFileBytes: selectedFileBytes ?? this.selectedFileBytes,
    );
  }
}

// Define a StateNotifier for managing file state
class FileNotifier extends StateNotifier<FileState> {
  FileNotifier() : super(FileState());

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      state = state.copyWith(
        fileName: file.name,
        fileSize: file.size,
        selectedFile: kIsWeb ? null : File(file.path!),
        selectedFileBytes: kIsWeb ? file.bytes : null,
      );
    }
  }

  void clearFile() {
    state = state.copyWith(
      fileName: null,
      fileSize: null,
      selectedFile: null,
      selectedFileBytes: null,
    );
  }

  void uploadFile() {
    // Implement your upload logic here
  }
}

// Create providers
final fileProvider = StateNotifierProvider<FileNotifier, FileState>((ref) {
  return FileNotifier();
});
