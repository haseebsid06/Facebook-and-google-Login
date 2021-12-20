class Userdetails {
  String? displayName;
  String? email;
  String? photourl;

  Userdetails({
    this.displayName,
    this.email,
    this.photourl,
  });

  // map for data

  Userdetails.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photourl = json["Photourl"];
    email = json["email"];
  }

  Map<String, dynamic> tojson() {
    // object of data
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['photourl'] = photourl;

    return data;
  }
}
