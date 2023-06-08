
class Agence {
  String?id;
   String? imf ;
   String? nom_imf;
    String? adresse;
    String? nom ;
    String? tel ;
    String? email;
    String? lat;
    String? long;
  Agence({
    this.id,
    this.imf,
    this.nom_imf,
    this.adresse,
    this.nom,
    this.tel,
    this.email,
    this.lat,
    this.long
  });

 
   Agence.fromJson( Map<dynamic, dynamic> json ){
    this.id = json['_id'];
    this.imf = json['imf'];
    nom_imf = json['nom_imf'];
    adresse = json['adresse'];
    this.nom = json['nom'];
    this.tel = json['tel'];
    this.email = json['email'];
    this.lat = json['lat'];
    this.long = json['long'];
  }
  Map<dynamic , dynamic> toJson(){
    final Map<dynamic , dynamic> data = new Map<dynamic , dynamic>();
    data['_id'] = this.id ;
    data['imf'] = this.imf ;
    data['nom_imf'] = this.nom_imf ;
    data['nom'] = this.nom ;
    data['tel'] = this.tel ;
    data['adresse'] = this.adresse ;
    data['email'] = this.email ;
    data['lat'] = this.lat ;
    data['long'] = this.long ;
    return data;
  }
}
