


class simulation {
  String? user;
  String? id_sim;
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
  simulation(
      {this.user,
      this.id_sim,
      this.mnt_crd,
      this.mnt_rnb,
      this.duree_rnb, 
      this.periodicite,
      this.taux_app,
      this.nbr_periodes,
      this.taux_periodique,
      this.nbr_echeances,
      this.montant_rnb_total,
      this.createdAt}
  );

  simulation.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] ;
    id_sim = json['_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mnt_crd'] = this.mnt_crd;
    data['mnt_rnb'] = this.mnt_rnb;
    data['duree_rnb'] = this.duree_rnb;
    return data;
  }
}
