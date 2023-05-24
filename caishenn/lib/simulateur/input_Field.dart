import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../tools/Colors.dart';

class Input_Field extends StatelessWidget {
  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? enabled;
  final int? shape;
  final int? direction;
  final Color? color;
  final String? keyboard;
  const Input_Field({
    Key? key,
    required this.title,
    this.hint,
    this.controller,
    this.widget,
    this.enabled,
    this.shape,
    this.direction,
    this.color,
    this.keyboard, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shape==1?Container(
      height: MediaQuery.of(context).size.height*0.21,
      width:  MediaQuery.of(context).size.width*0.75,
      margin: EdgeInsets.only(top: 9.0),
      decoration: BoxDecoration(
              color: color,
              
              borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(40)),
              /* boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ], */
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  color: bleufonce,
                ),
              ),
              enabled == null
                  ? Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14.0),
            height: 50,
            width: (MediaQuery.of(context).size.width*0.6) * 0.75,
            decoration: BoxDecoration(
              color: enabled == null ? Colors.white : Colors.grey[300],
              border: Border.all(color: Colors.grey.shade500,width: 1.5),
              borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20))
            ),
            child: TextFormField(
              enabled: enabled == null ? true : false,
              readOnly: widget == null ? false : true,
              autofocus: false,
              keyboardType: keyboard == "num" ? TextInputType.number : keyboard == "text" ? TextInputType.text : TextInputType.name ,
              cursorColor: Colors.grey[600],
              controller: controller,
              style: TextStyle(
                color: Colors.grey[600],
              ),
              decoration: InputDecoration(
                hintText: hint,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )
    //circle
    :
    //semi circle
    shape==2?
    Row(
      mainAxisAlignment: direction==0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.3,
          width:  MediaQuery.of(context).size.width*0.7,
          margin: EdgeInsets.only(top: 9.0),
          decoration: BoxDecoration(
                  color: jaune,
                  
                  borderRadius: BorderRadius.only(
                    topLeft: direction==0 ? Radius.circular(180) : Radius.circular(0),
                    bottomLeft: direction==0 ? Radius.circular(180) : Radius.circular(0),
                    topRight: direction==0 ? Radius.circular(0) : Radius.circular(180),
                    bottomRight: direction==0 ? Radius.circular(0) : Radius.circular(180),
                  ),
                  boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        spreadRadius: 0,
                                      ),
                                    ],
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: bleufonce,
                    ),
                  ),
                  enabled == null
                      ? Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.only(left: 14.0),
                height: 50,
                width: (MediaQuery.of(context).size.width*0.6) * 0.7,
                decoration: BoxDecoration(
                  color: enabled == null ? Colors.white : Colors.grey[300],
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  enabled: enabled == null ? true : false,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.grey[600],
                  controller: controller,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )
    //semi circle
    :
    //rectangle
    Container(
      margin: EdgeInsets.only(top: 9.0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  color: bleufonce,
                ),
              ),
              enabled == null
                  ? Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14.0),
            height: 50,
            /* width: (MediaQuery.of(context).size.width) * 0.48, */
            decoration: BoxDecoration(
              color: enabled == null ? Colors.white : Colors.grey[300],
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: keyboard == "num" ? TextInputType.number : keyboard == "text" ? TextInputType.text : TextInputType.name ,
                    enabled: enabled == null ? true : false,
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor: Colors.grey[600],
                    controller: controller,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
