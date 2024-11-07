import 'package:astrology/getit.dart';
import 'package:astrology/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../router/router.gr.dart';

@RoutePage(name: 'DashboardRouter')
class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Sample data for demonstration
  final List<Map<String, dynamic>> astrologers = [
    {
      "name": "Astro Guru Ram",
      "specialization": "Vedic Astrology",
      "rating": 4.8,
      "availability": "Available"
    },
    {
      "name": "Sage Priya Sharma",
      "specialization": "Tarot Reading",
      "rating": 4.5,
      "availability": "Busy"
    },
    {
      "name": "Jyotish Raj",
      "specialization": "Palmistry",
      "rating": 4.7,
      "availability": "Available"
    },
    {
      "name": "Madam Zoya",
      "specialization": "Horoscope Analysis",
      "rating": 4.9,
      "availability": "Unavailable"
    },
    {
      "name": "Sangeeta",
      "specialization": "Palmistry",
      "rating": 5.0,
      "availability": "Available"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FzColors.blackColor,
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: FzColors.blackColor,
        foregroundColor: FzColors.textColor,
        actions: [
          IconButton(
            onPressed: () => getIt<ConfigRouter>().replaceAll(
              [HomeRouter()],
            ),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: FzColors.blackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: astrologers.length,
            itemBuilder: (context, index) {
              final astrologer = astrologers[index];
              return _buildAstrologerCard(astrologer);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAstrologerCard(Map<String, dynamic> astrologer) {
    return Card(
      color: Colors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: 50,
              color: Colors.amberAccent,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    astrologer["name"],
                    style: GoogleFonts.josefinSans(
                      color: FzColors.hexToColor('#FF4B2B'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Specialization: ${astrologer["specialization"]}",
                    style: GoogleFonts.josefinSans(
                      color: FzColors.hexToColor('#FF4B2B'),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "${astrologer["rating"]}",
                        style: GoogleFonts.josefinSans(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Availability: ${astrologer["availability"]}",
                    style: GoogleFonts.josefinSans(
                      color: astrologer["availability"] == "Available"
                          ? Colors.greenAccent
                          : Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
