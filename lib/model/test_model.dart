class UserApi{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? username;
  String? avatarUrl;

  UserApi(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.role,
        this.username,
        this.avatarUrl});

  UserApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    username = json['username'];
    avatarUrl = json['avatar_url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role'] = role;
    data['username'] = username;
    data['avatar_url'] = avatarUrl;

    return data;
  }
}

