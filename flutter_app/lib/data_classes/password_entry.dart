//class for storing site info
//placeholder until we find the way we actaully want to do it in implemetation
class PasswordEntry {
  final String website;
  final String password;
  final String username; 

  PasswordEntry({
    required this.website,
    required this.password,
    required this.username
  });

  factory PasswordEntry.fromMap(Map<String, dynamic> map) { 
    return PasswordEntry(
      website: map['service_name'] ?? '', 
      password: map['password'] ?? '', 
      username: map['username'] ?? ''
      );
  }
}