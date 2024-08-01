import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class DocumentProvider extends ChangeNotifier {
  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }
}
