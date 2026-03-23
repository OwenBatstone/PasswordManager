//class for storing site info
//placeholder until we find the way we actaully want to do it in implemetation
class PasswordEntry {
  final int id;
  final String website;
  String password; //Made password mutable
  final String username; 

  PasswordEntry({
    required this.id,
    required this.website,
    required this.password,
    required this.username
  });

  factory PasswordEntry.fromMap(Map<String, dynamic> map) { 
    return PasswordEntry(
      id:map['id'],
      website: map['service_name'] ?? '', 
      password: map['password'] ?? '', 
      username: map['username'] ?? ''
      );
  }
}