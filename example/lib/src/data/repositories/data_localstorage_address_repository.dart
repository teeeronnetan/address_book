// ignore_for_file: missing_return;

import 'dart:convert';

import '../../domain/entities/address.dart';
import '../../domain/repositories/address_repository.dart';
import 'package:localstorage/localstorage.dart';

class DataAddressRepository extends AddressRepository {
  // sigleton
  final storage = LocalStorage('addressbook');
  List<Address> address = <Address>[];

  @override
  Future<Address> addAddress(Address newAddress) async {
    await storage.ready;
    storage.setItem('tyrone', jsonEncode([]));
    address.add(newAddress);
    storage.setItem('tyrone', jsonEncode(address));
  }

  @override
  Future<Address> deleteAddress(Address address) async {
    await storage.ready;
    // delete address implement
    storage.setItem('tyrone', jsonEncode([]));
    address.removeWhere((Address item) => item.uid == address.uid);
    storage.setItem('tyrone', jsonEncode(address));
  }

  @override
  Future<Address> editAddress(Address editedAddress) async {
    await storage.ready;
    storage.setItem('tyrone', jsonEncode([]));
    address.forEach((Address address) {
      if (address.uid == editedAddress.uid) {
        address.fname = editedAddress.fname;
        address.lname = editedAddress.lname;
        address.phonenum = editedAddress.phonenum;
        address.address = editedAddress.address;
        address.birthdate = editedAddress.birthdate;
      }
    });
    storage.setItem('tyrone', jsonEncode(address));
  }

  @override
  Future<List<Address>> getAllAddress() async {
    await storage.ready;
    address = [];
    final storageData = jsonDecode(storage.getItem('tyrone'));
    print(storageData);
    storageData.forEach((data) {
      address.add(Address(data['uid'], data['fname'], data['lname'], data['phonenum'], data['address'], data['birthdate']));
    });

    return address;
  }

  @override
  Future<Address> getAddress(String uid) {
    // todo implement get task
  }
}
