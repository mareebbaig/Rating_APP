import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class buyerProfile extends StatelessWidget {
  const buyerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 41.0, bottom: 36),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF234F68),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                fieldContainer(
                  value: "name",
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 15,
                ),
                fieldContainer(value: "email", icon: Icons.mail),
                SizedBox(
                  height: 15,
                ),
                fieldContainer(value: "phone", icon: Icons.phone),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Edit Profile"),
            style: ElevatedButton.styleFrom(primary: Color(0xFF8BC83F)),
          )
        ],
      ),
    );
  }
}

class fieldContainer extends StatelessWidget {
  String? value;
  IconData? icon;
  fieldContainer({
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      width: 327,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Icon(icon)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF5F4F8),
      ),
    );
  }
}
