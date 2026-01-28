import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

// Enum for appointment status
enum FilterStatus {upcoming, complete, cancel}

class _AppointmentPageState extends State<AppointmentPage> {
  
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  final List<Map<String, dynamic>> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"General",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Thierry van",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Respiration",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Tiafinjara Nirina",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Cardiology",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Richard Tan",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"General",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Thierry van",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Respiration",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Tiafinjara Nirina",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Cardiology",
      "status": FilterStatus.upcoming
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    final filteredSchedules = schedules.where((s) => s['status'] == status).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Appointment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(FilterStatus filterStatus in FilterStatus.values)
                      Expanded(child: GestureDetector(
                        onTap: (){
                          setState(() {
                            if(filterStatus == FilterStatus.upcoming){
                              status = FilterStatus.upcoming;
                              _alignment = Alignment.centerLeft;
                            } else if(filterStatus == FilterStatus.complete){
                              status = FilterStatus.complete;
                              _alignment = Alignment.center;
                            } else if(filterStatus == FilterStatus.cancel){
                              status = FilterStatus.cancel;
                              _alignment = Alignment.centerRight;
                            }
                          });
                        },
                        child: Center(
                          child: Text(filterStatus.name),
                        ),
                      ))
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(status.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),  
                  ),
                  ) 
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index){
                  final schedule = filteredSchedules[index];

                  final doctorProfile = (schedule['doctor_profile'] ?? '') as String;
                  final doctorName = (schedule['doctor_name'] ?? 'Unknown') as String;
                  final category = (schedule['category'] ?? '-') as String;
                  
                  final bool isLastElement = filteredSchedules.length - 1 == index;

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.grey)),
                    margin: !isLastElement ? 
                      const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: 
                                AssetImage(doctorProfile),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doctorName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                  Text(category, style: const TextStyle(color: Colors.grey),),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          // Schedule
                          const ScheduleCard(),
                          Config.spaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Cancel", style: TextStyle(color: Config.primaryColor),),)
                              ),
                              const SizedBox(width: 20,),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor
                                  ),
                                  onPressed: () {},
                                  child: const Text("Reschedule", style: TextStyle(color: Colors.white),),)
                              ),
                            ],
                          )
                        ]),
                    ),  
                  );
                })
              )
            )
          ]),
      )
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
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, color: Config.primaryColor, size: 15,),
          SizedBox(width: 5,),
          Text('Monday, 27/01/2026', style: TextStyle(color: Config.primaryColor),),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm, color: Config.primaryColor, size: 17,),
          SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM', style: TextStyle(color: Config.primaryColor),))
        ]),
    );
  }
}