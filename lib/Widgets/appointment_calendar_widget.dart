import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendar extends StatefulWidget {
  const AppointmentCalendar({Key? key}) : super(key: key);

  @override
  _AppointmentCalendarState createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<AppointmentCalendar> {

  DateTime _focusedDay = DateTime.now();
                // selected Events

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var firstDay=DateTime.utc(_focusedDay.year, _focusedDay.month, 1);
    var lastDay=DateTime.utc(
      _focusedDay.year,
      _focusedDay.month + 1,
    ).subtract(Duration(days: 1));
    return Container(
     child: TableCalendar(
       headerVisible: false,
       calendarFormat: CalendarFormat.week,
       firstDay:firstDay,
       lastDay: lastDay,
       focusedDay: _focusedDay,
       startingDayOfWeek: StartingDayOfWeek.sunday,
       availableGestures: AvailableGestures.all,
       calendarStyle: CalendarStyle(
           canMarkersOverflow: true,
           todayDecoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Color(0xff6E4FFC), Color(0xff2D6AF6)],
               begin: Alignment.topLeft,
               end: Alignment.topLeft,
             ),
             shape: BoxShape.circle,
           ),
           weekendTextStyle: TextStyle(
               color: Color.fromRGBO(117, 131, 138, 1),
               fontWeight: FontWeight.bold),
           defaultTextStyle: TextStyle(
               color: Color.fromRGBO(117, 131, 138, 1),
               fontWeight: FontWeight.bold)),
     ),
    );
  }

}
