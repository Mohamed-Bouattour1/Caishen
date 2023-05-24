import 'package:caishenn/demande/fonc/fonc.dart';
import 'package:flutter/material.dart';
import '../simulateur/input_Field.dart';
import '../tools/Colors.dart';

class Form_page extends StatefulWidget {
  const Form_page({Key? key}) : super(key: key);

  @override
  State<Form_page> createState() => _Form_pageState();
}

class _Form_pageState extends State<Form_page> {
  /* final transaction_controller _transactionController = Get.put(transaction_controller()); */
  final TextEditingController _nameController = TextEditingController();
  TextEditingController _DureeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _CinController = TextEditingController();
  /* DateTime _selectedDateDeblocage = DateTime.now();
  DateTime _selectedDate1 = DateTime.now(); */
  List<String> Engagement = ["*", "**", "***"];
  List<String> periodicite = ["*", "**", "***"];
  List<int> I = [1, 2];
  int _selectedNature = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        
        /* Input_Field(
          title: "Engagement",
          hint: _eng,
          widget: DropdownButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[600],
            ),
            iconSize: 32,
            elevation: 4,
            underline: Container(
              height: 0,
            ),
            items: Engagement.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newvalue) {
              setState(() {
                _eng = newvalue!;
              });
            },
          ),
        ), */
        Input_Field(
          title: "Nom",
          hint: "  ",
          controller: _amountController,
        ),
        Input_Field(
          title: "Prénom",
          hint: " ",
          controller: _DureeController,
        ),
        Input_Field(
          title: "cin",
          hint: "0.0  ",
          keyboard: "num",
            controller: _CinController,
        ),
        /* Input_Field(
          title: "",
          hint: DateFormat('dd-MM-yyyy').format(_selectedDateDeblocage),
          widget: IconButton(
              onPressed: () async {
                DateTime? _pickerDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015),
                  lastDate: DateTime(2121),
                );
                if (_pickerDate != null) {
                  setState(() {
                    _selectedDateDeblocage = _pickerDate;
                  });
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey[600],
              )),
        ), */
        /* Input_Field(
          title: "Périodicité",
          hint: _per,
          widget: DropdownButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[600],
            ),
            iconSize: 32,
            elevation: 4,
            underline: Container(
              height: 0,
            ),
            items: periodicite.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newvalue) {
              setState(() {
                _per = newvalue!;
              });
            },
          ),
        ), */ 
        Input_Field(
          title: "Objet",
          hint: "",
        ), 
        Input_Field(
          title: "Montant",
          hint: "0.0  ",
          keyboard: "num",
        ),
         Input_Field(
          title: "Durée",
          hint: "0.0  ",
          keyboard: "num",
        ),
        /* Input_Field(
          title: "",
          hint: DateFormat('dd-MM-yyyy').format(_selectedDate1),
          widget: IconButton(
              onPressed: () async {
                DateTime? _pickerDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015),
                  lastDate: DateTime(2121),
                );
                if (_pickerDate != null) {
                  setState(() {
                    _selectedDate1 = _pickerDate;
                  });
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey[600],
              )),
        ), */
        
       
        /* Input_Field(
          title: "Taux Standard",
          hint: "0.0  ",
          enabled: false,
        ),
        Input_Field(
          title: "Taux CPC",
          hint: "0.0  ",
          enabled: false,
        ),
        Input_Field(
          title: "Taux CG",
          hint: "0.0  ",
          enabled: false,
        ), */
       
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //_selectNature(),
            GestureDetector(
              onTap: () {
                _validateData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: rose,
                ),
                child: Center(
                  child: Text(
                    "Valider",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            /* SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const welcome()));
              },
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: jaune,
                ),
                child: Center(
                  child: Text(
                    "Annuler",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ), */
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),
      ],
    );
  }


  _validateData() {
    if (_nameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _DureeController.text.isNotEmpty && _CinController.text.isNotEmpty && _CinController.text.length==8) {
      setState(() {
        Navigator.push(context,
                      MaterialPageRoute(builder: (_) => fonc()));
      });
    } else if (_nameController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _DureeController.text.isEmpty) {
          Navigator.push(context,
                      MaterialPageRoute(builder: (_) => fonc()));
      /* showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            "required",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Text(
            "All fields are required !",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 24.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: bleufonce,
        ),
        //barrierDismissible: false,
      ); */
    }
  }
}
