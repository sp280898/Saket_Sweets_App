import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupModelSheet extends StatefulWidget {
  final String title;
  final List<String> data;
  final Function response;
  final String fieldAddress;
  final String fieldID;

  const PopupModelSheet(
      {required this.title,
      required this.data,
      required this.response,
      required this.fieldAddress,
      required this.fieldID,
      Key? key})
      : super(key: key);

  @override
  _PopupModelSheetState createState() => _PopupModelSheetState();
}

class _PopupModelSheetState extends State<PopupModelSheet> {
  //  Default Radio Button Item
  // String radioItem = 'Mango';
// Group Value for Radio Button.
  int id = 1;
  String selectedUser = "";
  late int selectedRadio;
  late int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(String user) {
    setState(() {
      selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: createRadioListUsers(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.data.length; i++) {
      widgets.add(
        RadioListTile(
          value: widget.data[i],
          groupValue: selectedUser,
          title: Text(widget.data[i]),
          // subtitle: Text(user.lastName),
          onChanged: (currentUser) {
            print("Current User ${currentUser}");
            setSelectedUser(currentUser.toString());
            Get.back();
            widget.response(currentUser, widget.fieldAddress, widget.fieldID);
            // Get.back();
          },
          selected: selectedUser == widget.data[i],
          activeColor: Theme.of(context).primaryColor,
        ),
      );
    }
    return widgets;
  }
}
