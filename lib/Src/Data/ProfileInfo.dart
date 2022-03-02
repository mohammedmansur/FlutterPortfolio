class ProfileInfo {
  String? name;
  String? birthDate; //done
  String? uid; // the uid from firebase auth service
  String? email; //done
  String? github;
  String? stackOverflow;
  String? linkedIn;
  String? title; //done
  String? bio; //done
  String? location; //done
  String? imgUrl; // Firebase Storage
  String? phoneNumber; //dont
  bool? isLookingForAJob; //if the user is looking for a job
  bool? isApproved;

  ProfileInfo(
      {this.name,
      this.birthDate,
      this.email,
      this.github,
      this.imgUrl,
      this.phoneNumber,
      this.linkedIn,
      this.stackOverflow,
      this.bio,
      this.isLookingForAJob,
      this.location,
      this.title,
      this.isApproved});

  // from map which reads the data from the database

  factory ProfileInfo.fromMap(Map<String, dynamic> json) => ProfileInfo(
        name: json["name"],
        birthDate: json["birthDate"],
        email: json["email"],
        github: json["github"],
        imgUrl: json["imgUrl"],
        phoneNumber: json["phoneNumber"],
        stackOverflow: json["stackOverflow"],
        linkedIn: json["linkedIn"],
        title: json["title"],
        location: json["location"],
        isLookingForAJob: json["isLookingForAJob"],
        bio: json["bio"],
        isApproved: json["isApproved"],
      );

  // toMap()
  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "birthDate": birthDate,
        "github": github,
        "imgUrl": imgUrl,
        "phoneNumber": phoneNumber,
        "stackOverflow": stackOverflow,
        "linkedIn": linkedIn,
        "bio": bio,
        "location": location,
        "isLookingForAJob": isLookingForAJob,
        "title": title,
        "isApproved": isApproved,
      };
}
