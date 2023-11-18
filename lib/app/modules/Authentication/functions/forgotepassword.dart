import 'package:flutter/material.dart';

Widget buildGestureDetector({required String title, required String subtitle,required IconData icon,required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,  
   child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Icon(icon, size: 60),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(subtitle, style: TextStyle( fontSize: 16)),
              SizedBox(height: 30),
            ],
          )
        ],
      ),
    ),
  );
}