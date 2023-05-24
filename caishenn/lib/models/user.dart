class User {
    String? id_user ;
    String? nom ;
    String? prenom ;
    String? cin  ;
    String? email  ;
    String? mdp ;
  User({
    this.id_user,
    this.nom,
    this.prenom,
    this.cin,
    required this.email,
    required this.mdp,
  });
  
  User.fromJson(Map<dynamic , dynamic> json){
    id_user = json['_id'];
    nom = json['nom'];
    prenom = json['prenom'];
    cin = json['cin'];
    email = json['email'];
    mdp = json['mdp'];
  }
  Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['_id'] = this.id_user ;
    data['nom'] = this.nom ;
    data['prenom'] = this.prenom ;
    data['cin'] = this.cin ;
    data['email'] = this.email;
    data['mdp'] = this.mdp;
    return data;
  }
}