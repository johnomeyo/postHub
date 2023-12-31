import 'package:image_picker/image_picker.dart';

class SelectImage {
 
   selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      return file.path;
    } else {
      return "";
    }
  }
 selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (file != null) {
      
      return file.path;
    } else {
      return "";
    }
    
  }
}
