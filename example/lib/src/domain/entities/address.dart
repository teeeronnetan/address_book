class Address {
  final String uid;
  String fname;
  String lname;
  String phonenum;
  String address;
  String birthdate; 
  Address(this.uid, this.fname, this.lname, this.phonenum, this.address, this.birthdate);

   Map toJson() => {'uid': uid, 'fname': fname, 'lname': lname, 'phonenum': phonenum, 'address': address, 'birthdate': birthdate};

  void removeWhere(bool Function(Address item) param0) {}

  // @override
  // String toString() => '$fname, $lname, $phonenum, $address, $birthdate';

  // void add(newAddress) {}
}
