class User {
  int? id;
  String? userName;
  String? profilePhoto;
  String? names;
  String? lastName;
  String? documentType;
  String? document;
  String? documentPhoto;
  String? birthdate;
  String? email;
  bool? gender;
  String? contrasenia;

  User({
    this.id,
    this.userName,
    this.profilePhoto,
    this.names,
    this.lastName,
    this.documentType,
    this.document,
    this.documentPhoto,
    this.birthdate,
    this.email,
    this.gender,
    this.contrasenia,
  });

  // Constructor que genera un User desde un JSON.
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    profilePhoto = json['profilePhoto'];
    names = json['names'];
    lastName = json['lastName'];
    documentType = json['documentType'];
    document = json['document'];
    documentPhoto = json['documentPhoto'];
    birthdate = json['birthdate'];
    email = json['email'];
    gender = json['gender'];
    contrasenia = json['contrasenia'];
  }

  // Método que convierte el objeto User a JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['profilePhoto'] = this.profilePhoto;
    data['names'] = this.names;
    data['lastName'] = this.lastName;
    data['documentType'] = this.documentType;
    data['document'] = this.document;
    data['documentPhoto'] = this.documentPhoto;
    data['birthdate'] = this.birthdate;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['contrasenia'] = this.contrasenia;
    return data;
  }
}
