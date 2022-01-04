import 'package:example/src/app/pages/address/address_controller.dart';
// import 'package:example/src/data/repositories/data_localstorage_address_repository.dart';
import 'package:example/src/data/repositories/data_address_repository.dart';
import 'package:example/src/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddressPage extends View {
  AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() =>
      // inject dependencies inwards
      _AddressPageState();
}

class _AddressPageState extends ViewState<AddressPage, AddressController> {
  _AddressPageState() : super(AddressController(DataAddressRepository()));

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Book'),
      ),
      body: Scaffold(
        key:
            globalKey, // built in global key for the ViewState for easy access in the controller
        body: ControlledWidgetBuilder<AddressController>(
            builder: (context, controller) {
          return ListView(
            children: createListTileList(context, controller),
          );
        }),
      ),
      floatingActionButton: ControlledWidgetBuilder<AddressController>(
        builder: (context, controller) {
          return FloatingActionButton(
            onPressed: () {
              createAlertDialog(context, controller, false);
              controller.getAddress();
            },
            child: Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<TableRow> createTableRow(controller){
   final tableRow = <TableRow>[];
   //HEADER
   tableRow.add(TableRow(children: [
            Column(children: [
              Text('Firstname', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ]),
            Column(
                children: [Text('Lastname', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))]),
            Column(children: [
              Text('Phone Number', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ]),
            Column(
                children: [Text('Address', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))]),
            Column(children: [
              Text('Birthdate', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ]),
            Column(children: [
              Text('Action', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ]),
          ]));
    controller.addressList.forEach((Address address){
      //DATA
      tableRow.add(TableRow(children: [
            Column(children: [
              Text(address.fname, style: TextStyle(fontSize: 17.0))
            ]),
            Column(
                children: [Text(address.lname, style: TextStyle(fontSize: 17.0))]),
            Column(children: [
              Text(address.phonenum, style: TextStyle(fontSize: 17.0))
            ]),
            Column(
                children: [Text(address.address, style: TextStyle(fontSize: 17.0))]),
            Column(children: [
              Text(address.birthdate, style: TextStyle(fontSize: 17.0))
            ]),
            Column(children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){}),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: (){}),
            ]),
          ]));
    });
  return tableRow;
}

List<Widget> createListTileList(context, controller) {
  final tileList = <Widget>[
    Container(
      margin: EdgeInsets.all(20),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(120.0),
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children:createTableRow(controller),
      ),
    ),
  ];
  return tileList;
}

Future createAlertDialog(
    BuildContext context, AddressController controller, bool isEdit) {

      return showDialog(context: context, builder: (context){
         var _formKey = GlobalKey<FormState>();
         return AlertDialog(
            title: Text(isEdit ? 'Update Details:' : 'Enter Details'),
            content: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.addAddressfnameInputController,
                        decoration: InputDecoration(
                            labelText: 'Firstname',
                            labelStyle: TextStyle(fontSize: 19)
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.addAddresslnameInputController,
                        decoration: InputDecoration(
                            labelText: 'Lastname',
                            labelStyle: TextStyle(fontSize: 19)
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.addAddressphonenumInputController,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontSize: 19)
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.addAddressaddressInputController,
                        decoration: InputDecoration(
                            labelText: 'Address',
                            labelStyle: TextStyle(fontSize: 19)
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.addAddressbirthdateInputController,
                        decoration: InputDecoration(
                            labelText: 'Birthdate',
                            labelStyle: TextStyle(fontSize: 19)
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        return null;
                        },
                      ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 16.0),
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   // Validate returns true if the form is valid, or false otherwise.
            //                   if (_formKey.currentState.validate()) {
            //                     // If the form is valid, display a snackbar. In the real world,
            //                     // you'd often call a server or save the information in a database.
            //                       ScaffoldMessenger.of(context).showSnackBar(
            //                       const SnackBar(content: Text('Processing Data')),
            //                     );
            //                   }
            //                 },
            //   child: const Text('Submit'),
            // ),
            //         ),  
                    ],)
                )
                // TextField(
                //       controller: controller.addAddressInputController,
                //       decoration: InputDecoration(
                //         labelText: 'Firstname',
                //         labelStyle: TextStyle(fontSize: 19),
                //       )
                // ),
                // TextField(
                //   controller: controller.addAddressInputController,
                //       decoration: InputDecoration(
                //         labelText: 'Lastname',
                //         labelStyle: TextStyle(fontSize: 19),
                //       )
                // ),
                // TextField(controller: controller.addAddressInputController,
                //       decoration: InputDecoration(
                //         labelText: 'Phone Number',
                //         labelStyle: TextStyle(fontSize: 19),
                //       )),
                // TextField(
                //   controller: controller.addAddressInputController,
                //       decoration: InputDecoration(
                //         labelText: 'Address',
                //         labelStyle: TextStyle(fontSize: 19),
                //       )
                // ),
                // TextField(
                //   controller: controller.addAddressInputController,
                //       decoration: InputDecoration(
                //         labelText: 'Birthdate',
                //         labelStyle: TextStyle(fontSize: 19),
                //       )
                // )
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(isEdit ? 'Edit Details' : 'Add Details'),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                  if (isEdit) {
                  //edit
                  // controller.editAddress();
                  Navigator.of(context).pop();
                } else {
                  controller.addAddress();
                  Navigator.of(context).pop();
                }
                },)
            ]
          );
      });

      
     
      // return showDialog(
      //   context: context, 
      //   builder: (context) {
      //     return AlertDialog(
      //       content: Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.all(0),
      //         child: ListView(
      //           padding: EdgeInsets.all(0),
      //           primary: true,
      //           scrollDirection: Axis.vertical,
      //           shrinkWrap: true,
      //           children: [
      //             DataTable(
      //               columns: [
      //                 DataColumn(label: Text("Firstname",
      //                 softWrap: true,)
      //                 ),
      //                 DataColumn(label: Text("Lastname")
      //                 ),
      //                 DataColumn(label: Text("Phone Number")
      //                 ),
      //                 DataColumn(label: Text("Address")
      //                 ),
      //                 DataColumn(label: Text("Birthdate")
      //                 ),
      //               ],
      //               rows: addressList.map(
      //                 (element) => DataRow(
      //                   cells: <DataCell>[
      //                     DataCell(
      //                       TextField(
      //                         controller: addAddressInputController,
      //                         maxLength:4,
      //                         decoration: InputDecoration(
      //                           labelText: 'First name',
      //                           labelStyle: TextStyle(fontSize: 9),
      //                           counterText: "",
      //                         ),),
      //                     ),
      //                     DataCell(Text(
      //                       element.lname,
      //                     )
      //                     ),
      //                     DataCell(Text(
      //                       element.phonenum,
      //                     )
      //                     ),
      //                     DataCell(Text(
      //                       element.address,
      //                     )
      //                     ),
      //                     DataCell(Text(
      //                       element.birthdate,
      //                     )
      //                     ),
      //                   ]
      //                 )
      //               )
      //               )
      //           ],
      //           actions: <Widget>[
      //             MaterialButton(onPressed: ),
      //           ]),
                
      //       ),

      //     );
          

        // });
    }
