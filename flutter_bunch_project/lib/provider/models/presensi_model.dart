class PresensiModel {
  String? waktu;
  String? fotoSelfie;
  String? tipeLog;
  String? karyawanid;

  PresensiModel({this.waktu, this.fotoSelfie, this.tipeLog, this.karyawanid});

  PresensiModel.fromJson(Map<String, dynamic> json) {
    waktu = json['waktu'];
    fotoSelfie = json['foto_selfie'];
    tipeLog = json['tipe_log'];
    karyawanid = json['karyawanid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waktu'] = this.waktu;
    data['foto_selfie'] = this.fotoSelfie;
    data['tipe_log'] = this.tipeLog;
    data['karyawanid'] = this.karyawanid;
    return data;
  }
}
