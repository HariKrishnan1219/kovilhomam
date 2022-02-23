import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:kovilhomam/choices.dart' as choices;

class HomamPage extends StatefulWidget {
  final imgPath;

  HomamPage({Key? key, this.imgPath}) : super(key: key);

  @override
  _HomamPageState createState() => _HomamPageState();
}

class _HomamPageState extends State<HomamPage> {

  bool tempValue = false;

  String _gender = 'male';
  String _tamilmonth = 'chitthirai';
  String _nakshatra = 'poosam';
  bool _active = true;
  DateTime dateOfBirth = DateTime.now();
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameTextController = TextEditingController();
  final parentNameController = TextEditingController();
  final contactNoController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextController.dispose();
    parentNameController.dispose();
    contactNoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateOfBirth,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    if (picked != null && picked != dateOfBirth)
      setState(() {
        dateOfBirth = picked;
      });
  }

  String getGenderPrefix()
  {
    if(_gender == 'male') {
      return 'Master ';
    }
    else if(_gender == 'female') {
      return 'Miss ';
    }
    return ' ';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 25),
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/avnsm.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 15)
              ],
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 630,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(31, 58, 47, 1.0),
              ),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listItemStats('images/yajna5.png',"100+ homams all over Chennai. Our volunteers "
                          "make sure the Homams are done as per Vedic rituals. "
                          "Homam will provide positive energy and spirit to handle any kind of problems.",true),
                      //listItemStats('images/air-conditioner.png',"Air Conditioner", false),
                      //listItemStats('images/washing-machine.png',"Washing Machine", false)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Divider(color: Colors.white,)
                  ),
                  SizedBox(height: 5),



                  Scrollbar(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          SmartSelect<String>.single(
                            title: 'Gender',
                            value: _gender,
                            choiceItems: choices.gender_type,
                            onChange: (state) => setState(() => _gender = state.value),
                            modalType: S2ModalType.bottomSheet,
                            tileBuilder: (context, state) {
                              return S2Tile.fromState(
                                state,
                                isTwoLine: true,
                                //leading: const CircleAvatar(
                                //backgroundImage: NetworkImage('https://source.unsplash.com/xsGxhtAsfSA/100x100'),
                                //),
                              );
                            },
                          ),
                          //const Divider(indent: 20),
                          Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                              child: TextField(
                                controller: nameTextController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.teal)
                                  ),
                                  //hintText: '',
                                  //helperText: 'If more than one trainer, separate with semicolon ;',
                                  labelText: 'Name',
                                  prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                                  //prefixText: getGenderPrefix(),
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)
                                ),
                              )
                          ),
                          const Divider(indent: 20),
                          Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date of Birth"),
                                SizedBox(width: 20.0,),
                                Text("${dateOfBirth.toLocal()}".split(' ')[0]),
                                SizedBox(width: 20.0,),
                                IconButton(
                                  onPressed: () => _selectDate(context),
                                  icon: const Icon(Icons.calendar_today),
                                ),
                              ],
                            ),
                          ),
                          //const Divider(indent: 20),
                          SmartSelect<String>.single(
                            title: 'Tamil Month of Birth',
                            value: _tamilmonth,
                            choiceItems: choices.tamilmonth_type,
                            onChange: (state) => setState(() => _tamilmonth = state.value),
                            modalType: S2ModalType.bottomSheet,
                            modalFilter: true,
                            tileBuilder: (context, state) {
                              return S2Tile.fromState(
                                state,
                                isTwoLine: true,
                                //leading: const CircleAvatar(
                                //backgroundImage: NetworkImage('https://source.unsplash.com/xsGxhtAsfSA/100x100'),
                                //),
                              );
                            },
                          ),
                          //const Divider(indent: 20),
                          SmartSelect<String>.single(
                            title: 'Birth Nakshatra',
                            value: _nakshatra,
                            choiceItems: choices.nakshatra_type,
                            onChange: (state) => setState(() => _nakshatra = state.value),
                            modalType: S2ModalType.bottomSheet,
                            modalFilter: true,
                            tileBuilder: (context, state) {
                              return S2Tile.fromState(
                                state,
                                isTwoLine: true,
                                //leading: const CircleAvatar(
                                //backgroundImage: NetworkImage('https://source.unsplash.com/xsGxhtAsfSA/100x100'),
                                //),
                              );
                            },
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                              child: TextField(
                                controller: parentNameController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.teal)
                                  ),
                                  //hintText: '',
                                  //helperText: 'If more than one trainer, separate with semicolon ;',
                                  labelText: 'Parent\'s Name',
                                  prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                                  //prefixText: getGenderPrefix(),
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)
                                ),
                              )
                          ),
                          const Divider(indent: 20),
                          Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                              child: TextField(
                                controller: contactNoController,
                                keyboardType: TextInputType.phone,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.teal)
                                  ),
                                  //hintText: '',
                                  //helperText: 'If more than one trainer, separate with semicolon ;',
                                  labelText: 'Contact Number',
                                  prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                                  //prefixText: getGenderPrefix(),
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)
                                ),
                              )
                          ),
                          //const Divider(indent: 20),
                          // Removing this as date of joining is the current date
                          /*
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date of Joining"),
              SizedBox(width: 20.0,),
              Text("${dateOfBirth.toLocal()}".split(' ')[0]),
              SizedBox(width: 20.0,),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
        */
                          /*
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Name of School',
                prefixIcon: const Icon(Icons.school, color: Colors.teal,),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Type of School',
                //prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        */
                          const Divider(indent: 20),
                          Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              children: [
                                Text('Active'),
                                Checkbox(value: _active, onChanged: (state) => setState(() => _active = !_active),),
                              ],
                            ),
                          ),
                          const Divider(indent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
                                child: FloatingActionButton.extended(
                                  //backgroundColor: kPrimaryColor,
                                  heroTag: null,
                                  onPressed: () {
                                    showDialog(context: context,
                                        builder: (BuildContext context) => new AlertDialog(
                                          title: new Text('Submitted'),
                                          content: new Text('Successfully registered for Homam. '
                                              'Our volunteers will contact you soon.'),
                                          actions: <Widget>[
                                            new IconButton(
                                                icon: new Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        )
                                    );
                                  },
                                  icon: Icon(Icons.send),
                                  label: Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                  /*
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Maximum Power", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("60W", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Total Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("145", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Average Daily Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("5.6", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Divider(color: Colors.white,)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Day Schedule", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Switch(
                          value: tempValue,
                          onChanged: (newVal){
                            setState(() {
                              tempValue = newVal;
                              print(newVal);
                            });
                          },
                          activeColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                  */
                ],
              )
            ),
          )
        ],
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
