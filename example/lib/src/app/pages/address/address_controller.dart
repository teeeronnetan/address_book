import 'package:example/src/app/pages/address/address_presenter.dart';
import 'package:example/src/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AddressController extends Controller {
  List<Address> _addressList = [];
  List<Address> get addressList => _addressList;
  final AddressPresenter addressPresenter;
  Address _selectedAddress;

  final TextEditingController _editAddressfnameInputController = 
      TextEditingController();
  final TextEditingController _editAddresslnameInputController = 
      TextEditingController();
  final TextEditingController _editAddressphonenumInputController = 
      TextEditingController();
  final TextEditingController _editAddressaddressInputController = 
      TextEditingController();
  final TextEditingController _editAddressbirthdateInputController = 
      TextEditingController();
  // final TextEditingController _editAddressInputController = 
  //     TextEditingController();
  // final TextEditingController _addAddressInputController = 
  //     TextEditingController();
  final TextEditingController _addAddressfnameInputController = 
      TextEditingController();
  final TextEditingController _addAddresslnameInputController = 
      TextEditingController();
  final TextEditingController _addAddressphonenumInputController = 
      TextEditingController();
  final TextEditingController _addAddressaddressInputController = 
      TextEditingController();
  final TextEditingController _addAddressbirthdateInputController = 
      TextEditingController();

//  TextEditingController get editAddressInputController => _editAddressInputController;
//  TextEditingController get addAddressInputController => _addAddressInputController;
 TextEditingController get addAddressfnameInputController => _addAddressfnameInputController;
 TextEditingController get addAddresslnameInputController => _addAddresslnameInputController;
 TextEditingController get addAddressphonenumInputController => _addAddressphonenumInputController;
 TextEditingController get addAddressaddressInputController => _addAddressaddressInputController;
 TextEditingController get addAddressbirthdateInputController => _addAddressbirthdateInputController;
  TextEditingController get editAddressfnameInputController => _editAddressfnameInputController;
 TextEditingController get editAddresslnameInputController => _editAddresslnameInputController;
 TextEditingController get editAddressphonenumInputController => _editAddressphonenumInputController;
 TextEditingController get editAddressaddressInputController => _editAddressaddressInputController;
 TextEditingController get editAddressbirthdateInputController => _editAddressbirthdateInputController;

  // Presenter should always be initialized this way
  AddressController(addressRepo)
      : addressPresenter = AddressPresenter(addressRepo),
        super() {
    addressPresenter.getAllAddress();
  }
 

  @override
  // this is called automatically by the parent class
  void initListeners() {
    //get all listeners
    addressPresenter.getAllAddressOnNext = (response) {
      _addressList = [];
      _addressList = response.address;
      refreshUI();
    };
    addressPresenter.getAllAddressOnComplete = () {
      print('Address retrieved');
    };

    addressPresenter.getAllAddressOnError = (e) {
      print('GETTING DATA ERROR');
      print(e);
    };

    void showToast(customMsg) => Fluttertoast.showToast(
      msg: customMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 10,

    );

    //add address listener

    addressPresenter.addNewAddressOnNext = (response){
      addressPresenter.getAllAddress();
    };
    addressPresenter.addNewAddressOnComplete = () {};
    addressPresenter.addNewAddressOnError = (response) {};
    addressPresenter.addNewAddressOnError = (error) {
      print(error);
      showToast(error);

    };

    //delete address listener

    //  addressPresenter.deleteAddressOnNext = (response) {
    //   addressPresenter.getAllAddress();
    // };
    // addressPresenter.deleteAddressOnComplete = () {};
    // addressPresenter.deleteAddressOnError = (response) {};
    // addressPresenter.deleteAddressOnError = (error) {
    //   print(error);
    //   showToast(error);
    // };

    //edit address listener

  //   addressPresenter.editAddressOnNext = (response) {
  //     addressPresenter.getAllAddress();
  //   };
  //   addressPresenter.editAddressOnComplete = () {};
  //   addressPresenter.editAddressOnError = (response) {};
  }
  
      void getAddress() {
      addressPresenter.getAllAddress();
    }

    void addAddress(){
      final fname = _addAddressfnameInputController.text.toString();
      final lname = _addAddresslnameInputController.text.toString();
      final phonenum = _addAddressphonenumInputController.text.toString();
      final address = _addAddressaddressInputController.text.toString();
      final birthdate = _addAddressbirthdateInputController.text.toString();
      var uuid = Uuid();
      addressPresenter.addNewAddress(Address(uuid.v1(), fname, lname, phonenum, address, birthdate));

    }

    // void deleteAddress(Address address){
    //   addressPresenter.deleteAddress(address);
    // }

    // void editAddress(){
    //   _selectedAddress.fname  = _editAddressfnameInputController.text;
    //   _selectedAddress.lname  = _editAddresslnameInputController.text;
    //   _selectedAddress.phonenum  = _editAddressphonenumInputController.text;
    //   _selectedAddress.address  = _editAddressaddressInputController.text;
    //   _selectedAddress.birthdate  = _editAddressbirthdateInputController.text;
    //   addressPresenter.editAddress(_selectedAddress);
    //   print(_selectedAddress);
    // }

  @override
  void onDisposed() {
    addressPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
