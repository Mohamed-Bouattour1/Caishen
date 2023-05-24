 class User {
    String? id_user ;
    String? role;
    String? status;
    String? nom ;
    String? prenom ;
    String? cin  ;
    String? email  ;
    String? mdp ;
  User({
    this.id_user,
    this.role,
    this.status,
    this.nom,
    this.prenom,
    this.cin,
    required this.email,
    required this.mdp,
  });
  
  User.fromJson(Map<dynamic , dynamic> json){
    id_user = json['_id'];
    role = json['role'];
    status = json['status'];
    nom = json['nom'];
    prenom = json['prenom'];
    cin = json['cin'];
    email = json['email'];
    mdp = json['mdp'];
  }
  Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['_id'] = this.id_user ;
    data['role'] = this.role ;
    data['status'] = this.status ;
    data['nom'] = this.nom ;
    data['prenom'] = this.prenom ;
    data['cin'] = this.cin ;
    data['email'] = this.email;
    data['mdp'] = this.mdp;
    return data;
  }
}