import 'dart:convert';

class Customer {
  final int id;
  final String firstName;
  final String lastName;
  final String birthday;
  final Address address;
  final Contact contacts;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.birthday,
    this.address,
    this.contacts,
  });

  Customer.fromJson(Map<String, dynamic> map) :
    id = map["id"],
    firstName = map["firstName"],
    lastName = map["lastName"],
    birthday = map["birthday"],
    address = Address.fromJson(jsonDecode(map["address"])),
    contacts = Contact.fromJson(jsonDecode(map["contacts"]));

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "birthday": birthday,
    "address": jsonEncode(address.toMap()),
    "contacts": jsonEncode(contacts.toMap()),
  };

  @override
  String toString() => "id: $id, \nfirstName: $firstName, \n"
      "lastName: $lastName, \nbirthday: $birthday, \n"
      "address: ${address.city} ${address.state}, \n"
      "contacts: ${contacts.email} ${contacts.phone}\n"
      "mobile nums: ${contacts.mobileNumbers.join(",")}";
}

class Address {
  final String city;
  final String state;
  final String zipcode;

  Address({
    this.city,
    this.state,
    this.zipcode,
  });

  Address.fromJson(Map<String, dynamic> map) :
        city = map["city"],
        state = map["state"],
        zipcode = map["zipcode"];

  Map<String, dynamic> toMap() => {
    "city": city,
    "state": state,
    "zipcode": zipcode,
  };
}

class Contact {
  final String email;
  final String phone;
  final List<String> mobileNumbers;

  Contact({
    this.email,
    this.phone,
    this.mobileNumbers,
  });

  Contact.fromJson(Map<String, dynamic> map) :
        email = map["email"],
        phone = map["phone"],
        mobileNumbers = List.castFrom<dynamic, String>(map["mobileNumbers"]);

  Map<String, dynamic> toMap() => {
    "email": email,
    "phone": phone,
    "mobileNumbers": mobileNumbers,
  };
}
