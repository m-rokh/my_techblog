import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/controller/file_controller.dart';

FilePickerController filePickerController = Get.put(FilePickerController());

Future pickFiles() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filePickerController.file.value = result!.files.first;
}
