import 'package:flutter/material.dart';
import 'package:biapp/screens/dashboard_screen.dart';

String dashboardUrl = "";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "BI Analytics",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Welcome 👋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Analyze your business insights easily",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [

                  Expanded(
                    child: _featureCard(
                      icon: Icons.dashboard,
                      title: "View Dashboard",
                      color: Colors.blue,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(dashboardUrl: dashboardUrl),
                        ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: _featureCard(
                      icon: Icons.auto_awesome,
                      title: "AI Insights",
                      color: Colors.green,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                "Quick Analytics",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [

                  Expanded(
                    child: _analyticsCard(
                      "Total Sales",
                      "₹1.94M",
                      Icons.show_chart,
                      Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _analyticsCard(
                      "Total Profit",
                      "₹181K",
                      Icons.attach_money,
                      Colors.green,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _analyticsCard(
                      "Products",
                      "504",
                      Icons.inventory,
                      Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                "Connect Your Power BI Dashboard",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Paste your published Power BI dashboard link to analyze insights.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                onChanged: (value){
                  dashboardUrl = value;
                },
                decoration: InputDecoration(
                  hintText: "Paste Power BI Dashboard Link",
                  prefixIcon: const Icon(Icons.link),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.cloud_upload),
                  label: const Text("Connect Dashboard"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    print("Dashboard Link Saved");
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 35),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _analyticsCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}