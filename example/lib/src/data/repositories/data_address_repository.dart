import 'dart:async';

import '../../domain/entities/address.dart';
import '../../domain/repositories/address_repository.dart';

class DataAddressRepository extends AddressRepository {
  List<Address> address;
  // sigleton
  static final DataAddressRepository _instance = DataAddressRepository._internal();
  DataAddressRepository._internal() {
    address = <Address>[];
    address.addAll([
      Address('test-uid-1', 'Tyrone', 'Battung', '09556511212', 'Cugman, CDO', 'June 17, 2000'),
      Address('test-uid-2', 'Jollo', 'Erbito', '09551234567', 'Pangit, CDO', 'December 19, 1998'),
      Address('test-uid-3', 'John', 'Doe', '09123456789', 'Gusa, CDO', 'January 1, 2021')
    ]);
  }
  factory DataAddressRepository() => _instance;

  String get uid => null;

  // @override
  // Future<Address> addAddress(Address newAddress) async {
  //   address.add(newAddress);
  // }

  // @override
  // Future<a

  @override
  Future<List<Address>> getAllAddress() async {
    // todo implement get all task
    return address;
  }

  @override
  Future<Address> getAddress(String uid) {
    // TODO: implement getAddress
    throw UnimplementedError();
  }

  @override
  Future<Address> addAddress(Address address) {
    // TODO: implement addAddress
    throw UnimplementedError();
  }

  @override
  Future<Address> deleteAddress(Address address) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<Address> editAddress(Address address) {
    // TODO: implement editAddress
    throw UnimplementedError();
  }

}
