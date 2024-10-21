class Persona {
  int? id;
  bool? status; 
  String? names;
  String? lastName;
  String? documentType;
  String? document;
  // String? documentPhoto;
  String? birthdate;
  String? email;
  bool? gender;

  Persona(
      {
      this.names,
      this.lastName,
      this.documentType,
      this.document,
      this.email
      });

  Persona.fromJson(Map<String, dynamic> json) {
    names = json['names'];
    lastName = json['lastName'];
    documentType = json['documentType'];
    document = json['document'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['names'] = this.names;
    data['lastName'] = this.lastName;
    data['documentType'] = this.documentType;
    data['document'] = this.document;
    data['email'] = this.email;
    return data;
  }
}