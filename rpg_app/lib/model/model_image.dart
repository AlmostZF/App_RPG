
class ImageModel {
  String? base64;
  String? ext; 
  String? fileName;
  String? mimetype;
  ImageModel({this.base64, this.ext, this.fileName, this.mimetype});

  ImageModel.fromJson(Map<String, dynamic> data) {
    base64 = data['base64'];
    ext = data['extension'];
    fileName = data['fileName'];
    mimetype = data['mimetype'];
  }
  Map sendToJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['extension'] = ext;
    data['name'] = fileName;
    data['mimetype'] = mimetype;
    data['base64'] = base64;
    return data;
  }
}