
import 'package:caishenn/models/token.dart';
import 'package:caishenn/services/demande_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/demande.dart';
import '../simulateur/input_Field.dart';
import '../tools/Colors.dart';
import '../tools/utilities.dart';
import 'fonc/fonc.dart';

class Form_page extends StatefulWidget {
  Token token;
   Form_page({Key? key, required this.token}) : super(key: key);

  @override
  State<Form_page> createState() => _Form_pageState();
}

class _Form_pageState extends State<Form_page> {
  
  
  TextEditingController _DureeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _engController = TextEditingController();
  DateTime _selectedDateDeblocage = DateTime.now();
  DateTime _selectedDate1 = DateTime.now();
  DateTime _selectedDatedepot = DateTime.now();
  DateTime _selectedDaterecep = DateTime.now();
  List<int> I = [1, 2];

/*  @override
  void initState() async{
    Engagement = await demandeservice.getEngRequest();
    print(Engagement);
    super.initState();
  } */


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        FutureBuilder(
          future: getAllEng(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData){
              return Input_Field(
          title: "Engagement",
          hint: _engController.text,
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
            items: 
              List.generate(snapshot.data!.length, (index) => 
              DropdownMenuItem<String>(
                value: snapshot.data![index],
                child: Text(
                  snapshot.data![index],
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              )
              )
            ,
            /* items: snapshot.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              );
            }).toList(), */
            onChanged: (String? newvalue) {
              setState(() {
                _engController.text = newvalue!;
              });
            },
          ),
        );
            }else{
              return Text("engagements non trouveés");
            }
          },
        ),
        
        
        /* Input_Field(
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
        /* Input_Field(
          title: "Objet",
          hint: "",
        ),  */
        Input_Field(
          title: "Montant Crédit",
          hint: "0.0  ",
          keyboard: "num",
          controller: _amountController,
        ), 
         Input_Field(
          title: "Durée de Remboursement",
          hint: "0.0  ",
          keyboard: "num",
          controller: _DureeController,
        ), 
        Input_Field(
          title: "Date Déblocage",
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
        ),
        Input_Field(
          title: "Date Première échéance",
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
        ),
        Input_Field(
          title: "Date Dépot",
          hint: DateFormat('dd-MM-yyyy').format(_selectedDatedepot),
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
                    _selectedDatedepot = _pickerDate;
                  });
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey[600],
              )),
        ),
        Input_Field(
          title: "Date Première échéance",
          hint: DateFormat('dd-MM-yyyy').format(_selectedDaterecep),
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
                    _selectedDaterecep = _pickerDate;
                  });
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey[600],
              )),
        ),
        
       
        
       
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //_selectNature(),
            GestureDetector(
              onTap: () async{
                await _validateData();
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


  _validateData() async{
    
    if (_amountController.text.isNotEmpty &&
        _DureeController.text.isNotEmpty && _engController.text.isNotEmpty) {
          var tosend = demande(
            mnt_crd: double.parse(_amountController.text),
            duree_rnb: int.parse(_DureeController.text),
            type: _engController.text,
            datedeblecage: DateFormat('dd-MM-yyyy').format(_selectedDateDeblocage),
            datepremech: DateFormat('dd-MM-yyyy').format(_selectedDate1),
            datedepot: DateFormat('dd-MM-yyyy').format(_selectedDatedepot),
            daterecep: DateFormat('dd-MM-yyyy').format(_selectedDaterecep)
          );
          var res = await demandeservice.demRequest(tosend , widget.token);
          print(res);
          if (res == "error") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("erreur", "quelques choses ne va pas "));
          } else {
           Navigator.push(context,
                      MaterialPageRoute(builder: (_) => fonc(titres: res, token: widget.token,)));
          }
     
    } else if (_amountController.text.isEmpty ||
        _DureeController.text.isEmpty || _engController.text.isEmpty) {
           ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("Attention", "tout les champs sont obligatoires"));
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

Future<List<dynamic>> getAllEng() async{
  return await demandeservice.getEngRequest();
}

}
