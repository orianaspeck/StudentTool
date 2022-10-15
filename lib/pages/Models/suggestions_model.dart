class Suggestion {
  String id;
  String code;
  String name;
  String uc;
  String tax;
  String semester;
  String career;

  Suggestion(this.id, this.code, this.name, this.uc, this.tax, this.semester,
      this.career);

  Suggestion.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        code = json["code"],
        name = json["name"],
        uc = json["uc"],
        tax = json["tax"],
        semester = json["semester"],
        career = json["career"];
}
