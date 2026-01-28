import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
             const Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/doctor_1.jpg'),),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dr Richard Tan", style: TextStyle(color: Colors.white),),
                    SizedBox(height: 2,),
                    Text('Dental', style: TextStyle(color: Colors.black),)
                  ],
                )
              ],),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,

              // Action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}

// ScheduleCard Widget
class ScheduleCard extends StatelessWidget{
  const ScheduleCard({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, color: Colors.white, size: 15,),
          SizedBox(width: 5,),
          Text('Monday, 27/01/2026', style: TextStyle(color: Colors.white),),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm, color: Colors.white, size: 17,),
          SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM', style: TextStyle(color: Colors.white),))
        ]),
    );
  }
}