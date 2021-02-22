import 'package:GroceryMart/screens/Login.dart';
import 'package:flutter/material.dart';
import './OTPScreen.dart';
import '../models/DropDownItem.dart';

List<DropdownItem> zone = const [
  DropdownItem('Banasree', 1),
  DropdownItem('zone2', 2),
  DropdownItem('zone3', 3),
  DropdownItem('zone4', 4),
  DropdownItem('zone5', 5),
];

List<DropdownItem> area = const [
  DropdownItem('area1', 1),
  DropdownItem('area2', 2),
  DropdownItem('area3', 3),
  DropdownItem('area4', 4),
  DropdownItem('area5', 5),
];

class LocationScreen extends StatefulWidget {
  static String routeName = 'Location';
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var _zoneValue = 1;
  var _areaValue;

  void onPressSubmit() {
    Navigator.pushReplacementNamed(
      context,
      LoginScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pushReplacementNamed(context, OTPScreen.routeName);
        //   },
        // ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          // height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                // height: double.infinity,
                width: 500,
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/locationLogo.png",
                      height: 220,
                      width: 200,
                    ),
                    Text(
                      'Select Your Location',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'PTSansCaption',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Swithch on your location to stay in tune with what’s happening in your area',
                      style: TextStyle(
                        fontFamily: 'PTSansCaption',
                        color: new Color(0xff7C7C7C),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Your Zone",
                style: TextStyle(
                  fontFamily: 'PTSansCaption',
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: _zoneValue,
                hint: Text(
                  "Type of your zone",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 18,
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    print("------vlaue=----------------");
                    print(value);
                    _zoneValue = value;
                  });
                },
                items: zone.map((DropdownItem e) {
                  return DropdownMenuItem(
                    value: e.value,
                    child: Text(
                      e.name,
                      style: TextStyle(
                        fontFamily: 'PTSansCaption',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Your Area",
                style: TextStyle(
                  fontFamily: 'PTSansCaption',
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: _areaValue,
                hint: Text(
                  "Type of your area",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 18,
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    print("------areavlaue=----------------");
                    print(value);
                    _areaValue = value;
                  });
                },
                items: area.map((DropdownItem e) {
                  return DropdownMenuItem(
                    value: e.value,
                    child: Text(
                      e.name,
                      style: TextStyle(
                        fontFamily: 'PTSansCaption',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                // color: Colors.grey,
                alignment: FractionalOffset.bottomCenter,
                child: RaisedButton(
                  onPressed: onPressSubmit,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
