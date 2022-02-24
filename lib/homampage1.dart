import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:kovilhomam/choices.dart' as choices;
import 'package:easy_localization/easy_localization.dart';

class HomamPage extends StatelessWidget {
  final imgPath;

  HomamPage({Key? key, this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
              /*
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UnderConstructionScreen(),
                ),
              );
              */
            },
            icon: Icon(Icons.send),
            label: Text('SUBMIT'),
          ),
        ],
      ),
      */
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgPath), fit: BoxFit.cover)),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 70),
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
                            image: AssetImage('images/avnsm.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),
            /*
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                //color: Color.fromRGBO(31, 58, 47, 1.0),
                color: Colors.orange
              ),
              child: HomamForm(imgPath: imgPath),
            ),
            */
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.96), BlendMode.dstIn),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  //color: Color.fromRGBO(31, 58, 47, 1.0),
                  color: Colors.white
                    //color: Colors.blueGrey
                ),
                child: HomamForm(imgPath: imgPath),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Card(
      //   elevation: 3,
      //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      //   child: FeaturesTheme(),
      // ),
    );
  }
}

class HomamForm extends StatefulWidget {
  final imgPath;

  const HomamForm({Key? key, this.imgPath}) : super(key: key);

  @override
  _HomamFormState createState() => _HomamFormState();
}

class _HomamFormState extends State<HomamForm> {

  String _gender = 'Male';
  String _tamilmonth = 'Chithirai';
  String _nakshatra = 'Asvini';
  String _rasi = 'Mesham';
  DateTime dateOfBirth = DateTime.now();
  TimeOfDay timeOfBirth = TimeOfDay(hour: 7, minute: 15);
  String _prayer = 'Business development. Excel in education.';
  List<S2Choice<String>> nakshathram = [];
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameTextController = TextEditingController();
  final contactNoController = TextEditingController();
  final birthplaceController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();

  void FindNakshathram() async
  {
    if(_rasi == 'Mesham')
      nakshathram = [S2Choice<String>(value: 'Asvini', title: 'Asvini'.tr()),
        S2Choice<String>(value: 'Bharani', title: 'Bharani'.tr()),S2Choice<String>(value: 'Krttika', title: 'Krttika'.tr())];
    else if(_rasi == 'Rishabam')
      nakshathram = [S2Choice<String>(value: 'Krttika', title: 'Krttika'.tr()),
     S2Choice<String>(value: 'Rohini', title: 'Rohini'.tr()),S2Choice<String>(value: 'Mrgasirsa', title: 'Mrgasirsa'.tr())];
    else if(_rasi == 'Mithunam')
      nakshathram = [S2Choice<String>(value: 'Mrgasirsa', title: 'Mrgasirsa'.tr()),
        S2Choice<String>(value: 'Thirvathirai', title: 'Thirvathirai'.tr()),
        S2Choice<String>(value: 'Punarpusam', title: 'Punarpusam'.tr()),
        ];
    else if(_rasi == 'Kadakam')
      nakshathram = [S2Choice<String>(value: 'Punarpusam', title: 'Punarpusam'.tr()),
        S2Choice<String>(value: 'Pusam', title: 'Pusam'.tr()),
        S2Choice<String>(value: 'Ayilyam', title: 'Ayilyam'.tr()),];
    else if(_rasi == 'Simham')
      nakshathram = [S2Choice<String>(value: 'Magham', title: 'Magham'.tr()),
        S2Choice<String>(value: 'Puram', title: 'Puram'.tr()),S2Choice<String>(value: 'Uttaram', title: 'Uttaram'.tr()),];
    else if(_rasi == 'Kanni')
      nakshathram = [S2Choice<String>(value: 'Uttaram', title: 'Uttaram'.tr()),
        S2Choice<String>(value: 'Hastam', title: 'Hastam'.tr()),
        S2Choice<String>(value: 'Chitrai', title: 'Chitrai'.tr()),];
    else if(_rasi == 'Thulam')
      nakshathram = [S2Choice<String>(value: 'Chitrai', title: 'Chitrai'.tr()),
        S2Choice<String>(value: 'Svati', title: 'Svati'.tr()),
        S2Choice<String>(value: 'Vishakha', title: 'Vishakha'.tr()),];
    else if(_rasi == 'Viruchikam')
      nakshathram = [ S2Choice<String>(value: 'Vishakha', title: 'Vishakha'.tr()),
        S2Choice<String>(value: 'Anusham', title: 'Anusham'.tr()),
        S2Choice<String>(value: 'Jyestha', title: 'Jyestha'.tr()),];
    else if(_rasi == 'Thanusu')
      nakshathram = [ S2Choice<String>(value: 'Mulam', title: 'Mulam'.tr()),
        S2Choice<String>(value: 'Puradam', title: 'Puradam'.tr()),
        S2Choice<String>(value: 'Uttaratadam', title: 'Uttaratadam'.tr()),];
    else if(_rasi == 'Makaram')
      nakshathram = [S2Choice<String>(value: 'Uttaratadam', title: 'Uttaratadam'.tr()),
        S2Choice<String>(value: 'Thiruvonam', title: 'Thiruvonam'.tr()),
        S2Choice<String>(value: 'Avitam', title: 'Avitam'.tr()),];
    else if(_rasi == 'Kumbam')
      nakshathram = [S2Choice<String>(value: 'Avitam', title: 'Avitam'.tr()),
        S2Choice<String>(value: 'sathyam', title: 'sathyam'.tr()),
        S2Choice<String>(value: 'Puratathi', title: 'Puratathi'.tr()),];
    else if(_rasi == 'Meenam')
      nakshathram = [S2Choice<String>(value: 'Puratathi', title: 'Puratathi'.tr()),
        S2Choice<String>(value: 'Uttratathi', title: 'Uttratathi'.tr()),
        S2Choice<String>(value: 'Revati', title: 'Revati'.tr()),];
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextController.dispose();
    contactNoController.dispose();
    birthplaceController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateOfBirth,
        firstDate: DateTime(1930),
        lastDate: DateTime.now());
    if (picked != null && picked != dateOfBirth)
      setState(() {
        dateOfBirth = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    if (newTime != null && newTime != timeOfBirth)
      setState(() {
        timeOfBirth = newTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listItemStats('images/yajna5.png',"100+ homams all over Tamilnadu. Our volunteers make sure the Homams are done as per Vedic rituals. Homam will provide positive energy and spirit to handle any kind of problems.".tr(),true),
            //listItemStats('images/air-conditioner.png',"Air Conditioner", false),
            //listItemStats('images/washing-machine.png',"Washing Machine", false)
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Divider(color: Color.fromRGBO(31, 58, 47, 1.0),)
        ),
        const SizedBox(height: 7),
        //const Divider(indent: 20),
        SmartSelect<String>.single(
          title: 'Gender'.tr(),
          value: _gender,
          //choiceHeaderStyle: S2ChoiceHeaderStyle(textStyle: TextStyle(color: Colors.white)),
          choiceItems: [
            S2Choice<String>(value: 'Male', title: 'Male'.tr()),
            S2Choice<String>(value: 'Female', title: 'Female'.tr()),
            S2Choice<String>(value: 'Other', title: 'Other'.tr()),
          ],
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
        /*
        DropDownField(
          value: _gender,
          icon: Icon(Icons.transgender),
          required: true,
          strict: false,
          items: choices.genders,
          labelText: 'Gender'.tr(),
          setter: (dynamic newValue) {
            _gender = newValue;
          },
        ),
        */
        //const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: nameTextController,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Name'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.person, color: Color.fromRGBO(31, 58, 47, 1.0),),
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
              Text("Date of Birth".tr(), style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0))),
              SizedBox(width: 20.0,),
              Text("${dateOfBirth.toLocal()}".split(' ')[0], style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0))),
              SizedBox(width: 20.0,),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
                color: Color.fromRGBO(31, 58, 47, 1.0),
              ),
            ],
          ),
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time of Birth".tr(), style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0))),
              SizedBox(width: 20.0,),
              Text("${timeOfBirth.format(context)}", style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0))),
              SizedBox(width: 20.0,),
              IconButton(
                onPressed: () => _selectTime(context),
                icon: const Icon(Icons.calendar_today),
                color: Color.fromRGBO(31, 58, 47, 1.0),
              ),
            ],
          ),
        ),
        //const Divider(indent: 20),
        SmartSelect<String>.single(
          title: 'Tamil Month of Birth'.tr(),
          value: _tamilmonth,
          choiceItems: [
            S2Choice<String>(value: 'Chithirai', title: 'Chithirai'.tr()),
            S2Choice<String>(value: 'Vaikaasi', title: 'Vaikaasi'.tr()),
            S2Choice<String>(value: 'Aani', title: 'Aani'.tr()),
            S2Choice<String>(value: 'Aadi', title: 'Aadi'.tr()),
            S2Choice<String>(value: 'Aavani', title: 'Aavani'.tr()),
            S2Choice<String>(value: 'Purattaasi', title: 'Purattaasi'.tr()),
            S2Choice<String>(value: 'Aippasi', title: 'Aippasi'.tr()),
            S2Choice<String>(value: 'Karthikai', title: 'Karthikai'.tr()),
            S2Choice<String>(value: 'Maargazhi', title: 'Maargazhi'.tr()),
            S2Choice<String>(value: 'Thai', title: 'Thai'.tr()),
            S2Choice<String>(value: 'Maasi', title: 'Maasi'.tr()),
            S2Choice<String>(value: 'Panguni', title: 'Panguni'.tr()),
          ],
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
          title: 'Birth Rasi'.tr(),
          value: _rasi,
          choiceItems: [
            S2Choice<String>(value: 'Mesham', title: 'Mesham'.tr()),
            S2Choice<String>(value: 'Rishabam', title: 'Rishabam'.tr()),
            S2Choice<String>(value: 'Mithunam', title: 'Mithunam'.tr()),
            S2Choice<String>(value: 'Kadakam', title: 'Kadakam'.tr()),
            S2Choice<String>(value: 'Simham', title: 'Simham'.tr()),
            S2Choice<String>(value: 'Kanni', title: 'Kanni'.tr()),
            S2Choice<String>(value: 'Thulam', title: 'Thulam'.tr()),
            S2Choice<String>(value: 'Viruchikam', title: 'Viruchikam'.tr()),
            S2Choice<String>(value: 'Thanusu', title: 'Thanusu'.tr()),
            S2Choice<String>(value: 'Makaram', title: 'Makaram'.tr()),
            S2Choice<String>(value: 'Kumbam', title: 'Kumbam'.tr()),
            S2Choice<String>(value: 'Meenam', title: 'Meenam'.tr()),
          ],
          onChange: (state) => setState(() {
            _rasi = state.value;
            FindNakshathram();
          }),
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

    SmartSelect<String>.single(
    title: 'Birth Nakshatra'.tr(),
    value: _nakshatra,
    choiceItems: nakshathram,
    // [
    //   S2Choice<String>(value: 'Asvini', title: 'Asvini'.tr()),
    //   S2Choice<String>(value: 'Bharani', title: 'Bharani'.tr()),
    //   S2Choice<String>(value: 'Krttika', title: 'Krttika'.tr()),
    //   S2Choice<String>(value: 'Rohini', title: 'Rohini'.tr()),
    //   S2Choice<String>(value: 'Mrgasirsa', title: 'Mrgasirsa'.tr()),
    //   S2Choice<String>(value: 'Thirvathirai', title: 'Thirvathirai'.tr()),
    //   S2Choice<String>(value: 'Punarpusam', title: 'Punarpusam'.tr()),
    //   S2Choice<String>(value: 'Pusam', title: 'Pusam'.tr()),
    //   S2Choice<String>(value: 'Ayilyam', title: 'Ayilyam'.tr()),
    //   S2Choice<String>(value: 'Magham', title: 'Magham'.tr()),
    //   S2Choice<String>(value: 'Puram', title: 'Puram'.tr()),
    //   S2Choice<String>(value: 'Uttaram', title: 'Uttaram'.tr()),
    //   S2Choice<String>(value: 'Hastam', title: 'Hastam'.tr()),
    //   S2Choice<String>(value: 'Chitrai', title: 'Chitrai'.tr()),
    //   S2Choice<String>(value: 'Svati', title: 'Svati'.tr()),
    //   S2Choice<String>(value: 'Vishakha', title: 'Vishakha'.tr()),
    //   S2Choice<String>(value: 'Anusham', title: 'Anusham'.tr()),
    //   S2Choice<String>(value: 'Jyestha', title: 'Jyestha'.tr()),
    //   S2Choice<String>(value: 'Mulam', title: 'Mulam'.tr()),
    //   S2Choice<String>(value: 'Puradam', title: 'Puradam'.tr()),
    //   S2Choice<String>(value: 'Uttaratadam', title: 'Uttaratadam'.tr()),
    //   S2Choice<String>(value: 'Thiruvonam', title: 'Thiruvonam'.tr()),
    //   S2Choice<String>(value: 'Avitam', title: 'Avitam'.tr()),
    //   S2Choice<String>(value: 'sathyam', title: 'sathyam'.tr()),
    //   S2Choice<String>(value: 'Puratathi', title: 'Puratathi'.tr()),
    //   S2Choice<String>(value: 'Uttratathi', title: 'Uttratathi'.tr()),
    //   S2Choice<String>(value: 'Revati', title: 'Revati'.tr()),
    // ],
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
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: birthplaceController,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Place of Birth'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.person, color: Color.fromRGBO(31, 58, 47, 1.0),),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        SmartSelect<String>.single(
          title: 'Prayer'.tr(),
          value: _prayer,
          choiceItems: [
            S2Choice<String>(value: 'Business development. Excel in education.', title: 'Business development. Excel in education.'.tr()),
            S2Choice<String>(value: 'Success at work.', title: 'Success at work.'.tr()),
            S2Choice<String>(value: 'Cure diseases. Remove Marriage obstacles.', title: 'Cure diseases. Remove Marriage obstacles.'.tr()),
            S2Choice<String>(value: 'Remove debts and get welfare.', title: 'Remove debts and get welfare.'.tr()),
            S2Choice<String>(value: 'Get rid of family problems.', title: 'Get rid of family problems.'.tr()),
            S2Choice<String>(value: 'To enrich the child. Own house.', title: 'To enrich the child. Own house.'.tr()),
            S2Choice<String>(value: 'Get qualified employment.', title: 'Get qualified employment.'.tr()),
            S2Choice<String>(value: 'Promotion at job.', title: 'Promotion at job.'.tr()),
            S2Choice<String>(value: 'Strengthen family ties.', title: 'Strengthen family ties.'.tr()),
            S2Choice<String>(value: 'To succeed in court cases.', title: 'To succeed in court cases.'.tr()),
            S2Choice<String>(value: 'Remove Eye Thrushti.', title: 'Remove Eye Thrushti.'.tr()),
            S2Choice<String>(value: 'To get long life.', title: 'To get long life.'.tr()),
          ],
          onChange: (state) => setState(() => _prayer = state.value),
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
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Address'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.home, color: Color.fromRGBO(31, 58, 47, 1.0),),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: pincodeController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Pin Code'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.location_pin, color: Color.fromRGBO(31, 58, 47, 1.0),),
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
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Contact Number'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.local_phone, color: Color.fromRGBO(31, 58, 47, 1.0),),
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
        const Divider(indent: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromRGBO(75, 97, 88, 1.0),
                heroTag: null,
                onPressed: () {
                  showDialog(context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text('Submitted'.tr()),
                        content: new Text('Successfully registered for Homam. Our volunteers will contact you soon.'.tr()),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'.tr()),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                  );
                },
                icon: Icon(Icons.send),
                label: Text('Submit'.tr()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(31, 58, 47, 1.0)),
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
            child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
