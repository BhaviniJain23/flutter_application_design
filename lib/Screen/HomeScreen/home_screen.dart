import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_design/Constant/ConstantColors.dart';
import 'package:flutter_application_design/Model/appointment.dart';
import 'package:flutter_application_design/Model/chartdata.dart';
import 'package:flutter_application_design/Widgets/appointment_calendar_widget.dart';
import 'package:flutter_application_design/Widgets/custom_card_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.appBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
              child: Text(
                'Home',
                style: TextStyle(
                    color: Color.fromRGBO(61, 73, 110, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCard(
                      txt: 'Appointments',
                      isCustomPadding: true,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: AppointmentWidget(
                        appoinmentList: [
                          AppointmentData(time: '09:15 AM',
                              duration: '1 hr 10 min',
                              name: 'Michell',
                              reason:'Donecc facillas torolo kdjs lacinina,lesat viverra est samerra'),
                          AppointmentData(time: '10:35 AM',
                              duration: '2 hr 10 min',
                              name: 'Mickey',
                              reason:'Donecc facillas torolo kdjs lacinina,lesat viverra est samerra'),
                          AppointmentData(time: '12:40 AM',
                              duration: '50 min',
                              name: 'Mishti',
                              reason:'Donecc facillas torolo kdjs lacinina,lesat viverra est samerra'),
                          AppointmentData(time: '02:15 PM',
                              duration: '1 hr 10 min',
                              name: 'Maira',
                              reason:'Donecc facillas torolo kdjs lacinina,lesat viverra est samerra'),
                        ],
                      )),
                  CustomCard(
                    txt: 'Check In/Out',
                    child: CheckInOutWidget(),
                  ),
                  CustomCard(
                    txt: 'Attendance',
                    child: CustomChartValueWidget(
                      chartInfo: [
                        ChartData(
                            'Present', 16, AppColor.blueTextColor),
                        ChartData('Late', 4, AppColor.lateAttendanceColor),
                        ChartData('Absent', 2, AppColor.absentAttendanceColor),
                      ],
                      chartEntryInfo: [
                        ChartDataEntry(
                            16, 'Present', AppColor.blueTextColor),
                        ChartDataEntry(4, 'Late', AppColor.lateAttendanceColor),
                        ChartDataEntry(
                            2, 'Absent', AppColor.absentAttendanceColor),
                      ],
                    ),
                  ),
                  CustomCard(
                    txt: 'Annual Leaves',
                    child: CustomChartValueWidget(
                      chartInfo: [
                        ChartData(
                            'Taken', 15, AppColor.annualDefaultChartColor),
                        ChartData('Remaining', 5, AppColor.blueTextColor)
                      ],
                      chartEntryInfo: [
                        ChartDataEntry(
                            5, 'Remaining', AppColor.blueTextColor),
                        ChartDataEntry(15, 'Taken', AppColor.takenColor),
                        ChartDataEntry(20, 'Total', AppColor.takenColor),
                      ],
                    ),
                  ),
                  CustomCard(
                    txt: 'Requests',
                    child: RequestWidget(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CustomCard(
                            txt: 'Claims',
                            margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                            child: ClaimWidget(
                              txtHeader: 'Business Trip',
                              txtData: '\$1155.30',
                              txtStatus: 'Not Submitted',
                            )),
                      ),
                      Flexible(
                        child: CustomCard(
                            txt: 'Payslip',
                            margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                            child: ClaimWidget(
                              txtHeader: '2018',
                              txtData: '31 Dec',
                              txtStatus: 'Next payslip',
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Color(0xFF7C88FA)),
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              scale: 2.5,
            ),
            label: 'Home',
            activeIcon: Image.asset(
              'assets/images/active_home.png',
              scale: 2.5,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/pin.png',
              scale: 2.5,
            ),
            label: 'Attendance',
            activeIcon: Image.asset(
              'assets/images/active_pin.png',
              scale: 2.5,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/clipboard.png',
            ),
            label: 'Task',
            activeIcon: Image.asset(
              'assets/images/active_clipboard.png',
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/building.png',
              scale: 2.5,
            ),
            label: 'Company',
            activeIcon: Image.asset(
              'assets/images/active_building.png',
              scale: 2.5,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
            ),
            label: 'My Profile',
            activeIcon: Image.asset(
              'assets/images/active_user.png',
            ),
          ),
        ],
      ),
    );
  }
}

class CheckInOutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '01:23 Hrs',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.blueTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    wordSpacing: 0.5),
              ),
              Text(
                'Checked in at 08:34 AM',
                style: TextStyle(
                    fontSize: 12,
                    color: AppColor.subTitleTextColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    wordSpacing: 0.5),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff6E4FFC), Color(0xff2D6AF6)],
                begin: Alignment.topLeft,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(30, 25)),
              border: Border.all(color: Color(0xFF3961F7)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2D6AF6),
                  offset: Offset(1.0, 1.0),
                  blurRadius: 4,
                )
              ],
            ),
            child: InkWell(
              onTap: () {},
              child: Text(
                'CHECK OUT',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomChartValueWidget extends StatelessWidget {
  final List<ChartData> chartInfo;
  final List<ChartDataEntry> chartEntryInfo;
  const CustomChartValueWidget(
      {Key? key, required this.chartInfo, required this.chartEntryInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 30,
              child: SfCircularChart(series: <CircularSeries>[
                // Render pie chart
                DoughnutSeries<ChartData, String>(
                  dataSource: chartInfo,
                  radius: '25',
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  innerRadius: '80%',
                ),
              ]),
            ),
            _chartData(chartEntryInfo[0].mainData.toString(),
                chartEntryInfo[0].color, chartEntryInfo[0].subData),
            _chartData(chartEntryInfo[1].mainData.toString(),
                chartEntryInfo[1].color, chartEntryInfo[1].subData),
            _chartData(chartEntryInfo[2].mainData.toString(),
                chartEntryInfo[2].color, chartEntryInfo[2].subData),
          ],
        ));
  }

  _chartData(String mainData, Color? dataColor, String subData) {
    return Container(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            mainData,
            style: TextStyle(
                color: dataColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            subData,
            style: TextStyle(
                color: AppColor.subTitleTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class RequestWidget extends StatelessWidget {
  const RequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'John Stone',
                style: TextStyle(
                    color: Color.fromRGBO(44, 57, 97, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    wordSpacing: 0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Annual Leaves',
                style: TextStyle(
                    color: Color.fromRGBO(159, 165, 182, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    wordSpacing: 0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'from 15 Jan to 20 Jan',
                style: TextStyle(
                    color: AppColor.subTitleTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    wordSpacing: 0.5),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Material(
                  // needed
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => () {}, // needed
                    child: Image.asset(
                      'assets/images/remove.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Material(
                  // needed
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => () {}, // needed
                    child: Image.asset(
                      'assets/images/check.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ClaimWidget extends StatelessWidget {
  final String? txtHeader;
  final String? txtData;
  final String? txtStatus;

  const ClaimWidget({Key? key, this.txtHeader, this.txtData, this.txtStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 150),
        padding: EdgeInsets.only(top: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(txtHeader.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color.fromRGBO(149, 156, 176, 1))),
              SizedBox(
                height: 5,
              ),
              Text(txtData.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(58, 77, 247, 1))),
              SizedBox(
                height: 25,
              ),
              Text(txtStatus.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(149, 156, 176, 1)))
            ],
          ),
        ));
  }
}

class AppointmentWidget extends StatefulWidget {
  final List<AppointmentData> appoinmentList;
  AppointmentWidget({Key? key,
    required this.appoinmentList}) : super(key: key);

  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            AppointmentCalendar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: Color.fromRGBO(240, 241, 244, 1),
                height: 5,
                thickness: 2,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.13,
              width: 350,
              child: PageView.builder(
                itemCount: widget.appoinmentList.length,
                onPageChanged: (num){
                  setState(() {
                    _currentIndex=num;
                  });
                },
                  itemBuilder: (context,index){
                    return _listViewWidgetBuilder(widget.appoinmentList[index]);
                  }
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: DotsIndicator(
                  dotsCount: widget.appoinmentList.length,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                      size: const Size.square(5),
                      activeSize: const Size.square(5),
                      color: Color.fromRGBO(217, 219, 226, 1), // Inactive color
                      activeColor: Color.fromRGBO(76, 86, 120, 1),
                      spacing: EdgeInsets.all(5)),
                ),
              ),
            )
          ],
        ));
  }

  eventColumn(firstText, secondText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(51, 63, 102, 1),
              letterSpacing: 0.5,
              fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          secondText,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(142, 149, 171, 1),
              letterSpacing: 0.5),
        )
      ],
    );
  }

  _listViewWidgetBuilder(AppointmentData data){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 320,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 100,
                child: eventColumn(data.time, data.duration)),
            SizedBox(
              width: 30,
            ),
            Flexible(
                child: eventColumn(data.name,data.reason))
          ],
        ),
      ),
    );
  }
}
