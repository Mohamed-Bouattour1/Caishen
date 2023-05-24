

class Token {
   String? id_user ;
    String? nom ;
    String? prenom ;
    String? token;
  Token({
    this.id_user,
    this.nom,
    this.prenom,
    this.token
  });

 
   Token.fromJson( Map<String, dynamic> json , String token){
    this.id_user = json['id'];
    this.nom = json['nom'];
    this.prenom = json['prenom'];
    this.token = token.substring(10,token.length - 2);
  }
  /* Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['_id'] = this.id_user ;
    data['nom'] = this.nom ;
    data['prenom'] = this.prenom ;
    return data;
  } */
}