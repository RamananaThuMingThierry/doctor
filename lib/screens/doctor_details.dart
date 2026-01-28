import 'package:doctor/components/button.dart';
import 'package:doctor/components/customer_appbar.dart';
import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    
    return Scaffold(
      appBar: CustomerAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        route: null,
        actions: [
          IconButton(onPressed: (){}, icon: FaIcon(isFavorite ? Icons.favorite_rounded : Icons.favorite_outline, color: Colors.red,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
              const AboutDoctor(),
              Config.spaceSmall,
              const DetailBody(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), 
                child: Button(
                  onPressed: (){}, 
                  width: double.infinity, 
                  title: "Book Appointment"
                )
              )
          ],
        ) 
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config.init(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          DoctorInfo(),
          Config.spaceSmall,
          Text('About Doctor', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
          Config.spaceSmall,
          Text('Dr. Richard Tan is an experiences Dentist at Sarawark. He is graduated since 2006. And compted his training at sungal Sulon General Hospital.', softWrap: true, textAlign: TextAlign.center,)
        ]),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config.init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        const CircleAvatar(radius: 65,backgroundImage: AssetImage('assets/doctor_2.jpg'),backgroundColor: Colors.white,),
        Config.spaceMedium,
        const Text('Dr Richard Tan', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * .75,
          child: const Text(
            'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physcians, United Kingdon)', 
            style: TextStyle(color: Colors.grey, fontSize: 15,),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * .75,
          child: const Text(
            'Sarawak General Hospital', 
            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}


class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget> [
        InfoCard(label: 'Patiens', value: '109'),
        SizedBox(width: 15,),
        InfoCard(label: 'Experiences', value: '10 years'),
        SizedBox(width: 15,),
        InfoCard(label: 'Rating', value: '4.6'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Config.primaryColor
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Text(label, style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),),
            const SizedBox(height: 10,),
            Text(value , style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),),
          ]
        ),
      ),
    );
  }
}