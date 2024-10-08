import 'dart:io';

import 'package:doc_saver_app/helper/snackbar_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DocumentProvider extends ChangeNotifier {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String _selectedFile = "";
  String get selectedFile => _selectedFile;
  File? file;
  getSelectedFile(String value){
    _selectedFile = value;
    notifyListeners();
  }
  getFile(BuildContext context) async {
     await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["pdf","png","jpg","jpeg"],
      type: FileType.custom
    ).then((result){
      if(result != null){
        PlatformFile selectedFile = result.files.first;
        getSelectedFile(selectedFile.name);
        file = File(selectedFile.path!);
        print("select file $selectedFile");
      }else{
        SnackbarHelper.showErrorMessage(context, "no file selected");
      }
     });
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  refreshLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  resetAll(){
    titleController = TextEditingController();
    noteController = TextEditingController();
    _selectedFile = "";
    file = null;

  }
  sendDocumentData({required BuildContext context})async{
   try{
     refreshLoading(true);
     UploadTask uploadTask = _firebaseStorage.ref().child("files").child(_selectedFile).putFile(file!);
     TaskSnapshot taskSnapshot = await uploadTask;
     String uploadFileUrl = await taskSnapshot.ref.getDownloadURL();
     await  _firebaseDatabase.ref().child("files_info").push().set({
       "title": titleController.text,
       "note": noteController.text,
       "fileUrl": uploadFileUrl,
       "dateAdded":DateTime.now().toString(),
       "fileName": _selectedFile,
       "fileType":_selectedFile.split(".").last
     });
     resetAll();
     refreshLoading(false);
   } on FirebaseException catch(firebaseError){
     refreshLoading(false);
     SnackbarHelper.showErrorMessage(context, firebaseError.message!);
   }catch(error){
     refreshLoading(false);
     SnackbarHelper.showErrorMessage(context, error.toString());
   }

  }
}
