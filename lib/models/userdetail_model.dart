// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDetailModel {
  final String name;
  final String address;
  UserDetailModel({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'address': address,
    };
  }
}
