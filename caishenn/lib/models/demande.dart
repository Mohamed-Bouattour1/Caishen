


class demande {
  String? user;
  String? engagement;
  List<String>? docs;
  String? id_dem;
  String? type;
  num? mnt_crd;
  num? mnt_rnb;
  num? duree_rnb;
  num? periodicite;
  num? taux_app;
  num? nbr_periodes;
  num? taux_periodique;
  num? nbr_echeances;
  num? montant_rnb_total;
  String? createdAt;
  String? datedeblecage;
  String? datepremech;
  String? datedepot;
  String? daterecep;
  demande(
      {this.user,
      this.engagement,
      this.docs,
      this.id_dem,
      this.type,
      this.mnt_crd,
      this.mnt_rnb,
      this.duree_rnb, 
      this.periodicite,
      this.taux_app,
      this.nbr_periodes,
      this.taux_periodique,
      this.nbr_echeances,
      this.montant_rnb_total,
      this.createdAt,
      this.datedeblecage,
      this.datepremech,
      this.datedepot,
      this.daterecep
      }
  );

  demande.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] ;
     engagement = json['engagement'] ;
      docs = json['docs'] ;
    id_dem = json['_id'];
    type = json['type'];
    mnt_crd = json['mnt_crd'];
    mnt_rnb = json['mnt_rnb'];
    duree_rnb = json['duree_rnb'];
    periodicite = json['periodicite'];
    nbr_periodes = json['nbr_periodes'];
    taux_periodique = json['taux_periodique'];
    nbr_echeances = json['nbr_echeances'];
    taux_app = json['taux_app'];
    montant_rnb_total = json['montant_rnb_total'];
    createdAt = json['createdAt'];
    datedeblecage = json['datedeblocage'];
    datepremech = json['datepremech'];
    datedepot = json['datedepot'];
    daterecep = json['daterecep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['mnt_crd'] = this.mnt_crd;
    data['duree_rnb'] = this.duree_rnb;
    data['datedeblocage'] = this.datedeblecage;
    data['datepremech'] = this.datepremech;
    data['datedepot'] = this.datedepot;
    data['daterecep'] = this.daterecep;
    return data;
  }
}
