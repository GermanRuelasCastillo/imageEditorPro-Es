import 'package:firexcode/firexcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors_picker.dart';

class TextEditorImage extends StatefulWidget {
  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  Color currentColor = Colors.black;
  Color primaryColor = Color.fromRGBO(202, 144, 244, 1);
  double slider = 40.0;
  @override
  Widget build(BuildContext context) {
    return xColumn
        .list([
          TextField(
            controller: name,
            decoration: InputDecoration(
                border: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(202, 144, 244, 1)),
            ),
            hintStyle: TextStyle(color: Colors.grey[400])),
            scrollPadding: EdgeInsets.all(20.0),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 200,
            style: TextStyle(
              color: Colors.black,
            ),            
          ).toContainer(height: 200,padding: EdgeInsets.all(20)),
          xColumnCC.list([
            //   20.0.sizedHeight(),
            'Configuraciones de color'.text(),
            //   10.0.sizedHeight(),
            xRowCC.list([
              BarColorPicker(
                  width: 300,
                  thumbColor: Colors.white,
                  cornerRadius: 10,
                  pickMode: PickMode.Color,
                  colorListener: (int value) {
                    setState(() {
                      currentColor = Color(value);
                    });
                  }).xExpanded(),
              'Resetear'.text().xFlatButton(onPressed: () {})
            ]),
              20.0.sizedHeight(),
            'Arrastra White Black Color'.text(),
              10.0.sizedHeight(),
            xRowCC.list([
              BarColorPicker(
                  width: 300,
                  thumbColor: Colors.white,
                  cornerRadius: 10,
                  pickMode: PickMode.Grey,
                  colorListener: (int value) {
                    setState(() {
                      currentColor = Color(value);
                    });
                  }).xExpanded(),
              'Resetear'.text().xFlatButton(onPressed: () {})
            ]),
            xColumn.list([
              10.0.sizedHeight(),
              'Ajustar Tama??o'.toUpperCase().xTextColorWhite().toCenter(),
              10.0.sizedHeight(),
              Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  value: slider,
                  min: 0.0,
                  max: 100.0,
                  onChangeEnd: (v) {
                    setState(() {
                      slider = v;
                    });
                  },
                  onChanged: (v) {
                    setState(() {
                      slider = v;
                    });
                  }),
            ]).toContainer(color: Colors.black)
          ]).xContainer(color: Colors.white),
          ElevatedButton(                
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              minimumSize: Size(102, 45),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0))
            ),
            onPressed: (){
              if(name.text != ''){
                  Navigator.pop(context, {
                    'name': name.text,
                    'color': currentColor,
                    'size': slider.toDouble(),
                    'align': align
                  });
              }
            },
            child: Text(
              'Agregar Texto',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ])
        .xSingleChildScroolView()
        .xCenter()
        .xScaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(202, 144, 244, 1),
            actions: <Widget>[
              align == TextAlign.left
                  ? FontAwesomeIcons.alignLeft
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignLeft).xIconButton(onPressed: () {
                      setState(() {
                        align = TextAlign.left;
                      });
                    }),
              align == TextAlign.center
                  ? FontAwesomeIcons.alignCenter
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignCenter).xIconButton(
                      onPressed: () {
                      setState(() {
                        align = TextAlign.center;
                      });
                    }),
              align == TextAlign.right
                  ? FontAwesomeIcons.alignRight
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignRight).xIconButton(
                      onPressed: () {
                      setState(() {
                        align = TextAlign.right;
                      });
                    }),
            ],
          ),          
        );
  }

  TextAlign align;
}
