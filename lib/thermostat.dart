import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_thermostat/constants/constans.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ThermostatScreen extends StatefulWidget {
  ThermostatScreen({Key? key}) : super(key: key);

  @override
  State<ThermostatScreen> createState() => _ThermostatScreenState();
}

class _ThermostatScreenState extends State<ThermostatScreen> {
  double? temperature;

  bool isCoolingSelected = false;

  bool isDrySelected = false;

  bool isHeatingSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Thermostat',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Living Room',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(51, 255, 153, 0.4),
              Colors.transparent,
            ],
            stops: [0, 0.5],
            begin: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.transparent,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
                child: SleekCircularSlider(
                  min: 10,
                  max: 40,
                  initialValue: 23,
                  innerWidget: (temperature) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(-1, 10),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 85,
                          backgroundImage: AssetImage('images/metal.jpg'),
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      temperature.toStringAsFixed(0),
                                      style: GoogleFonts.lexendExa(
                                        textStyle: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '°c',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'Select',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  'temperature',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  appearance: CircularSliderAppearance(
                    startAngle: 180,
                    angleRange: 150,
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 40,
                      shadowWidth: 2,
                      handlerSize: 0,
                    ),
                    customColors: CustomSliderColors(
                      trackColor: Colors.transparent,
                      progressBarColors: [
                        greenColor,
                        Color.fromRGBO(71, 207, 156, 0.8),
                        Colors.transparent,
                      ],
                      hideShadow: true,
                      shadowColor: Colors.white,
                      shadowMaxOpacity: 1,
                    ),
                  ),
                  onChange: (temperature) {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[700]!),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wb_cloudy_outlined,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '31°c',
                                style: GoogleFonts.lexendExa(
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'outside',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.grey[700]!,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '26°c',
                                style: GoogleFonts.lexendExa(
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'inside',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Mode',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCoolingSelected = true;
                        isDrySelected = false;
                        isHeatingSelected = false;
                      });
                    },
                    child: Container(
                      width: 105,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[700]!),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            isCoolingSelected
                                ? Colors.grey[600]!
                                : Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color:
                                isCoolingSelected ? greenColor : Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Cooling',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  isCoolingSelected ? greenColor : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCoolingSelected = false;
                        isDrySelected = true;
                        isHeatingSelected = false;
                      });
                    },
                    child: Container(
                      width: 105,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[700]!),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            isDrySelected
                                ? Colors.grey[600]!
                                : Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                            color: isDrySelected ? greenColor : Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dry',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: isDrySelected ? greenColor : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCoolingSelected = false;
                        isDrySelected = false;
                        isHeatingSelected = true;
                      });
                    },
                    child: Container(
                      width: 105,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[700]!),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            isHeatingSelected
                                ? Colors.grey[600]!
                                : Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_sunny_outlined,
                            color:
                                isHeatingSelected ? greenColor : Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'heating',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  isHeatingSelected ? greenColor : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(-1, 8),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/metal.jpg'),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 33,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
