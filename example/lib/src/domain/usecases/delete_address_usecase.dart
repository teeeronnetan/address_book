import 'dart:async';

import 'package:example/src/domain/entities/address.dart';

import '../repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DeleteAddressUseCase
    extends UseCase<DeleteAddressUseCaseResponse, DeleteAddressUseCaseParams> {
  final AddressRepository addressRepository;
  DeleteAddressUseCase(this.addressRepository);

  @override
  Future<Stream<DeleteAddressUseCaseResponse>> buildUseCaseStream(
      DeleteAddressUseCaseParams params) async {
    final controller = StreamController<DeleteAddressUseCaseResponse>();
  }
}

/// Wrapping params inside an object makes it easier to change later
class DeleteAddressUseCaseParams {
  final Address address;
  DeleteAddressUseCaseParams(this.address);
}

/// Wrapping response inside an object makes it easier to change later
class DeleteAddressUseCaseResponse {
  final Address address;
  DeleteAddressUseCaseResponse(this.address);
}
