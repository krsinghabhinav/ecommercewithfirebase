import 'package:flutter/material.dart';


class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            floating: false,
            pinned: true,
            backgroundColor: Colors.teal.shade700,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Student Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.teal.shade300,
                          Colors.teal.shade700,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Hero(
                            tag: 'profile',
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage: const NetworkImage(
                                  'https://images.unsplash.com/photo-1544717305-2782549b5136?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Alex Johnson",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "ID: STU20230045",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.teal.shade700,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.teal.shade700,
                    tabs: const [
                      Tab(icon: Icon(Icons.person), text: "Basic"),
                      Tab(icon: Icon(Icons.family_restroom), text: "Family"),
                      Tab(icon: Icon(Icons.location_on), text: "Address"),
                      Tab(icon: Icon(Icons.school), text: "Academic"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildBasicInfoTab(),
                        _buildFamilyInfoTab(),
                        _buildAddressTab(),
                        _buildAcademicTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade700,
        child: const Icon(Icons.edit),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Edit profile functionality would go here'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBasicInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: "Personal Information",
            content: Column(
              children: [
                _buildInfoRow(label: "Full Name", value: "Alex Johnson"),
                _buildInfoRow(label: "Date of Birth", value: "15 May 2005"),
                _buildInfoRow(label: "Gender", value: "Male"),
                _buildInfoRow(label: "Blood Group", value: "O+"),
                _buildInfoRow(label: "Email", value: "alex.johnson@example.com"),
                _buildInfoRow(label: "Phone", value: "+1 (555) 123-4567"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Emergency Contact",
            content: Column(
              children: [
                _buildInfoRow(label: "Name", value: "Sarah Johnson"),
                _buildInfoRow(label: "Relationship", value: "Mother"),
                _buildInfoRow(label: "Phone", value: "+1 (555) 987-6543"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Health Information",
            content: Column(
              children: [
                _buildInfoRow(label: "Allergies", value: "None"),
                _buildInfoRow(label: "Medical Conditions", value: "Asthma (Mild)"),
                _buildInfoRow(label: "Medications", value: "Inhaler as needed"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: "Father's Information",
            content: Column(
              children: [
                _buildInfoRow(label: "Name", value: "Robert Johnson"),
                _buildInfoRow(label: "Occupation", value: "Software Engineer"),
                _buildInfoRow(label: "Phone", value: "+1 (555) 234-5678"),
                _buildInfoRow(label: "Email", value: "robert.johnson@example.com"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Mother's Information",
            content: Column(
              children: [
                _buildInfoRow(label: "Name", value: "Sarah Johnson"),
                _buildInfoRow(label: "Occupation", value: "Doctor"),
                _buildInfoRow(label: "Phone", value: "+1 (555) 987-6543"),
                _buildInfoRow(label: "Email", value: "sarah.johnson@example.com"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Siblings",
            content: Column(
              children: [
                _buildInfoRow(label: "Name", value: "Emma Johnson"),
                _buildInfoRow(label: "Age", value: "14"),
                _buildInfoRow(label: "Grade", value: "8th Grade"),
                const Divider(),
                _buildInfoRow(label: "Name", value: "Michael Johnson"),
                _buildInfoRow(label: "Age", value: "10"),
                _buildInfoRow(label: "Grade", value: "4th Grade"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: "Present Address",
            content: Column(
              children: [
                _buildInfoRow(label: "Street", value: "123 College Avenue"),
                _buildInfoRow(label: "City", value: "Boston"),
                _buildInfoRow(label: "State", value: "Massachusetts"),
                _buildInfoRow(label: "Zip Code", value: "02115"),
                _buildInfoRow(label: "Country", value: "United States"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.map, color: Colors.teal),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Map view would open here'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Permanent Address",
            content: Column(
              children: [
                _buildInfoRow(label: "Street", value: "456 Oak Street"),
                _buildInfoRow(label: "City", value: "Springfield"),
                _buildInfoRow(label: "State", value: "Illinois"),
                _buildInfoRow(label: "Zip Code", value: "62704"),
                _buildInfoRow(label: "Country", value: "United States"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.map, color: Colors.teal),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Map view would open here'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Hostel Information",
            content: Column(
              children: [
                _buildInfoRow(label: "Hostel Name", value: "University Residence Hall"),
                _buildInfoRow(label: "Room Number", value: "B-204"),
                _buildInfoRow(label: "Warden", value: "Dr. James Wilson"),
                _buildInfoRow(label: "Warden Phone", value: "+1 (555) 111-2222"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: "Current Education",
            content: Column(
              children: [
                _buildInfoRow(label: "Institution", value: "Boston University"),
                _buildInfoRow(label: "Program", value: "Bachelor of Science"),
                _buildInfoRow(label: "Major", value: "Computer Science"),
                _buildInfoRow(label: "Year", value: "2nd Year"),
                _buildInfoRow(label: "GPA", value: "3.8/4.0"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Academic Performance",
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current Semester GPA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: 0.92,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal.shade700),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 5),
                const Text(
                  "3.9/4.0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Current Courses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                _buildCourseItem("CS301", "Data Structures", "A"),
                _buildCourseItem("CS302", "Algorithms", "A-"),
                _buildCourseItem("MATH201", "Linear Algebra", "A"),
                _buildCourseItem("PHY101", "Physics I", "B+"),
                _buildCourseItem("ENG202", "Technical Writing", "A"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Previous Education",
            content: Column(
              children: [
                _buildInfoRow(label: "High School", value: "Springfield High School"),
                _buildInfoRow(label: "Graduation Year", value: "2021"),
                _buildInfoRow(label: "GPA", value: "3.9/4.0"),
                const Divider(),
                _buildInfoRow(label: "Achievements", value: "Valedictorian, Science Olympiad Gold Medal, National Merit Scholar"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseItem(String code, String name, String grade) {
    Color gradeColor;
    
    switch (grade[0]) {
      case 'A':
        gradeColor = Colors.green;
        break;
      case 'B':
        gradeColor = Colors.blue;
        break;
      case 'C':
        gradeColor = Colors.orange;
        break;
      default:
        gradeColor = Colors.red;
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: gradeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              grade,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: gradeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required Widget content,
    Widget? trailing,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: trailing,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}