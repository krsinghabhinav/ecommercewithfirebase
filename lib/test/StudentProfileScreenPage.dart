import 'package:flutter/material.dart';
import 'dart:math' as math;


class StudentProfileScreenPage extends StatefulWidget {
  const StudentProfileScreenPage({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreenPage> createState() =>
      _StudentProfileScreenPageState();
}

class _StudentProfileScreenPageState extends State<StudentProfileScreenPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExpanded = false;
  bool _isDarkMode = false;
  double _animationValue = 0.0;
  final ScrollController _scrollController = ScrollController();

  // Sample student data - this would come from an API or database in a real app
  final Map<String, dynamic> studentData = {
    'name': 'Alex Johnson',
    'id': 'STU20230045',
    'profileImage':
        'https://images.unsplash.com/photo-1544717305-2782549b5136?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    'basicInfo': {
      'dateOfBirth': '15 May 2005',
      'gender': 'Male',
      'bloodGroup': 'O+',
      'email': 'alex.johnson@example.com',
      'phone': '+1 (555) 123-4567',
    },
    'emergencyContact': {
      'name': 'Sarah Johnson',
      'relationship': 'Mother',
      'phone': '+1 (555) 987-6543',
    },
    'healthInfo': {
      'allergies': 'None',
      'medicalConditions': 'Asthma (Mild)',
      'medications': 'Inhaler as needed',
    },
    'familyInfo': {
      'father': {
        'name': 'Robert Johnson',
        'occupation': 'Software Engineer',
        'phone': '+1 (555) 234-5678',
        'email': 'robert.johnson@example.com',
      },
      'mother': {
        'name': 'Sarah Johnson',
        'occupation': 'Doctor',
        'phone': '+1 (555) 987-6543',
        'email': 'sarah.johnson@example.com',
      },
      'siblings': [
        {'name': 'Emma Johnson', 'age': '14', 'grade': '8th Grade'},
        {'name': 'Michael Johnson', 'age': '10', 'grade': '4th Grade'},
      ],
    },
    'addresses': {
      'present': {
        'street': '123 College Avenue',
        'city': 'Boston',
        'state': 'Massachusetts',
        'zipCode': '02115',
        'country': 'United States',
      },
      'permanent': {
        'street': '456 Oak Street',
        'city': 'Springfield',
        'state': 'Illinois',
        'zipCode': '62704',
        'country': 'United States',
      },
      'hostel': {
        'name': 'University Residence Hall',
        'roomNumber': 'B-204',
        'warden': 'Dr. James Wilson',
        'wardenPhone': '+1 (555) 111-2222',
      },
    },
    'academic': {
      'current': {
        'institution': 'Boston University',
        'program': 'Bachelor of Science',
        'major': 'Computer Science',
        'year': '2nd Year',
        'gpa': '3.8/4.0',
      },
      'currentSemester': {'gpa': '3.9/4.0', 'gpaPercentage': 0.92},
      'courses': [
        {'code': 'CS301', 'name': 'Data Structures', 'grade': 'A'},
        {'code': 'CS302', 'name': 'Algorithms', 'grade': 'A-'},
        {'code': 'MATH201', 'name': 'Linear Algebra', 'grade': 'A'},
        {'code': 'PHY101', 'name': 'Physics I', 'grade': 'B+'},
        {'code': 'ENG202', 'name': 'Technical Writing', 'grade': 'A'},
      ],
      'previous': {
        'highSchool': 'Springfield High School',
        'graduationYear': '2021',
        'gpa': '3.9/4.0',
        'achievements':
            'Valedictorian, Science Olympiad Gold Medal, National Merit Scholar',
      },
    },
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Add animation controller for scroll effects
    _scrollController.addListener(_onScroll);

    // Add tab controller listener for tab changes
    _tabController.addListener(() {
      setState(() {});
    });
  }

  void _onScroll() {
    final scrollOffset = _scrollController.offset;
    final maxOffset = 100.0; // Threshold for animation

    setState(() {
      _animationValue = (scrollOffset / maxOffset).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return Theme(
      data:
          _isDarkMode
              ? ThemeData.dark().copyWith(
                primaryColor: Colors.teal.shade700,
                cardTheme: CardTheme(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
              : Theme.of(context),
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 240,
              floating: false,
              pinned: true,
              backgroundColor:
                  _isDarkMode ? Colors.teal.shade900 : Colors.teal.shade700,
              actions: [
                IconButton(
                  icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  onPressed: _toggleTheme,
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    _showAnimatedDialog(
                      context,
                      'Notifications',
                      'You have no new notifications',
                    );
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: AnimatedOpacity(
                  opacity: _animationValue,
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    studentData['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                          colors:
                              _isDarkMode
                                  ? [Colors.teal.shade900, Colors.teal.shade800]
                                  : [
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
                              child: GestureDetector(
                                onTap: () {
                                  _showProfileImageFullScreen(context);
                                },
                                child: TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(milliseconds: 800),
                                  builder: (context, double value, child) {
                                    return Transform.scale(
                                      scale: value,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.grey.shade200,
                                          backgroundImage: NetworkImage(
                                            studentData['profileImage'],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              studentData['name'],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "ID: ${studentData['id']}",
                              style: const TextStyle(
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
                  color: _isDarkMode ? Colors.grey.shade900 : Colors.white,
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
                      labelColor:
                          _isDarkMode
                              ? Colors.teal.shade200
                              : Colors.teal.shade700,
                      unselectedLabelColor:
                          _isDarkMode ? Colors.grey.shade400 : Colors.grey,
                      indicatorColor:
                          _isDarkMode
                              ? Colors.teal.shade200
                              : Colors.teal.shade700,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        _buildAnimatedTab(Icons.person, "Basic", 0),
                        _buildAnimatedTab(Icons.family_restroom, "Family", 1),
                        _buildAnimatedTab(Icons.location_on, "Address", 2),
                        _buildAnimatedTab(Icons.school, "Academic", 3),
                      ],
                    ),
                    SizedBox(
                      height:
                          isTablet
                              ? MediaQuery.of(context).size.height * 0.7
                              : MediaQuery.of(context).size.height * 0.6,
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
        floatingActionButton: AnimatedBuilder(
          animation: _tabController.animation!,
          builder: (context, child) {
            return Transform.rotate(
              angle: _tabController.animation!.value * 2 * math.pi,
              child: FloatingActionButton(
                backgroundColor:
                    _isDarkMode ? Colors.teal.shade200 : Colors.teal.shade700,
                child: const Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAnimatedTab(IconData icon, String text, int index) {
    final isSelected = _tabController.index == index;

    return Tab(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? (_isDarkMode ? Colors.teal.shade900 : Colors.teal.shade50)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: isSelected ? 20 : 18),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isSelected ? 14 : 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showProfileImageFullScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: Center(
                child: Hero(
                  tag: 'profile',
                  child: Image.network(
                    studentData['profileImage'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  void _showAnimatedDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final currentTabIndex = _tabController.index;
    String title;

    switch (currentTabIndex) {
      case 0:
        title = "Edit Basic Information";
        break;
      case 1:
        title = "Edit Family Information";
        break;
      case 2:
        title = "Edit Address Information";
        break;
      case 3:
        title = "Edit Academic Information";
        break;
      default:
        title = "Edit Information";
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: _isDarkMode ? Colors.grey.shade900 : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: _buildEditForm(currentTabIndex)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Save changes logic would go here
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Changes saved successfully!',
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green,
                              action: SnackBarAction(
                                label: 'OK',
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildEditForm(int tabIndex) {
    // This would be more complex in a real app
    switch (tabIndex) {
      case 0:
        return _buildBasicInfoEditForm();
      case 1:
        return _buildFamilyInfoEditForm();
      case 2:
        return _buildAddressEditForm();
      case 3:
        return _buildAcademicEditForm();
      default:
        return Container();
    }
  }

  Widget _buildBasicInfoEditForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildTextField('Full Name', studentData['name']),
        _buildTextField(
          'Date of Birth',
          studentData['basicInfo']['dateOfBirth'],
        ),
        _buildTextField('Gender', studentData['basicInfo']['gender']),
        _buildTextField('Blood Group', studentData['basicInfo']['bloodGroup']),
        _buildTextField('Email', studentData['basicInfo']['email']),
        _buildTextField('Phone', studentData['basicInfo']['phone']),
      ],
    );
  }

  Widget _buildFamilyInfoEditForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Father\'s Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildTextField('Name', studentData['familyInfo']['father']['name']),
        _buildTextField(
          'Occupation',
          studentData['familyInfo']['father']['occupation'],
        ),
        const SizedBox(height: 20),
        const Text(
          'Mother\'s Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildTextField('Name', studentData['familyInfo']['mother']['name']),
        _buildTextField(
          'Occupation',
          studentData['familyInfo']['mother']['occupation'],
        ),
      ],
    );
  }

  Widget _buildAddressEditForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Present Address',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildTextField(
          'Street',
          studentData['addresses']['present']['street'],
        ),
        _buildTextField('City', studentData['addresses']['present']['city']),
        _buildTextField('State', studentData['addresses']['present']['state']),
        _buildTextField(
          'Zip Code',
          studentData['addresses']['present']['zipCode'],
        ),
        const SizedBox(height: 20),
        const Text(
          'Permanent Address',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildTextField(
          'Street',
          studentData['addresses']['permanent']['street'],
        ),
        _buildTextField('City', studentData['addresses']['permanent']['city']),
      ],
    );
  }

  Widget _buildAcademicEditForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Current Education',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildTextField(
          'Institution',
          studentData['academic']['current']['institution'],
        ),
        _buildTextField(
          'Program',
          studentData['academic']['current']['program'],
        ),
        _buildTextField('Major', studentData['academic']['current']['major']),
        _buildTextField('Year', studentData['academic']['current']['year']),
        _buildTextField('GPA', studentData['academic']['current']['gpa']),
      ],
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
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
                _buildInfoRow(label: "Full Name", value: studentData['name']),
                _buildInfoRow(
                  label: "Date of Birth",
                  value: studentData['basicInfo']['dateOfBirth'],
                ),
                _buildInfoRow(
                  label: "Gender",
                  value: studentData['basicInfo']['gender'],
                ),
                _buildInfoRow(
                  label: "Blood Group",
                  value: studentData['basicInfo']['bloodGroup'],
                ),
                _buildInfoRow(
                  label: "Email",
                  value: studentData['basicInfo']['email'],
                ),
                _buildInfoRow(
                  label: "Phone",
                  value: studentData['basicInfo']['phone'],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Emergency Contact",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "Name",
                  value: studentData['emergencyContact']['name'],
                ),
                _buildInfoRow(
                  label: "Relationship",
                  value: studentData['emergencyContact']['relationship'],
                ),
                _buildInfoRow(
                  label: "Phone",
                  value: studentData['emergencyContact']['phone'],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Health Information",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "Allergies",
                  value: studentData['healthInfo']['allergies'],
                ),
                _buildInfoRow(
                  label: "Medical Conditions",
                  value: studentData['healthInfo']['medicalConditions'],
                ),
                _buildInfoRow(
                  label: "Medications",
                  value: studentData['healthInfo']['medications'],
                ),
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
                _buildInfoRow(
                  label: "Name",
                  value: studentData['familyInfo']['father']['name'],
                ),
                _buildInfoRow(
                  label: "Occupation",
                  value: studentData['familyInfo']['father']['occupation'],
                ),
                _buildInfoRow(
                  label: "Phone",
                  value: studentData['familyInfo']['father']['phone'],
                ),
                _buildInfoRow(
                  label: "Email",
                  value: studentData['familyInfo']['father']['email'],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Mother's Information",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "Name",
                  value: studentData['familyInfo']['mother']['name'],
                ),
                _buildInfoRow(
                  label: "Occupation",
                  value: studentData['familyInfo']['mother']['occupation'],
                ),
                _buildInfoRow(
                  label: "Phone",
                  value: studentData['familyInfo']['mother']['phone'],
                ),
                _buildInfoRow(
                  label: "Email",
                  value: studentData['familyInfo']['mother']['email'],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Siblings",
            content: Column(
              children: [
                ...studentData['familyInfo']['siblings'].asMap().entries.map((
                  entry,
                ) {
                  final index = entry.key;
                  final sibling = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index > 0) const Divider(),
                      _buildInfoRow(label: "Name", value: sibling['name']),
                      _buildInfoRow(label: "Age", value: sibling['age']),
                      _buildInfoRow(label: "Grade", value: sibling['grade']),
                    ],
                  );
                }).toList(),
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
                _buildInfoRow(
                  label: "Street",
                  value: studentData['addresses']['present']['street'],
                ),
                _buildInfoRow(
                  label: "City",
                  value: studentData['addresses']['present']['city'],
                ),
                _buildInfoRow(
                  label: "State",
                  value: studentData['addresses']['present']['state'],
                ),
                _buildInfoRow(
                  label: "Zip Code",
                  value: studentData['addresses']['present']['zipCode'],
                ),
                _buildInfoRow(
                  label: "Country",
                  value: studentData['addresses']['present']['country'],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.map, color: Colors.teal),
              onPressed: () {
                _showAnimatedDialog(
                  context,
                  'Map View',
                  'Map view would open here',
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Permanent Address",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "Street",
                  value: studentData['addresses']['permanent']['street'],
                ),
                _buildInfoRow(
                  label: "City",
                  value: studentData['addresses']['permanent']['city'],
                ),
                _buildInfoRow(
                  label: "State",
                  value: studentData['addresses']['permanent']['state'],
                ),
                _buildInfoRow(
                  label: "Zip Code",
                  value: studentData['addresses']['permanent']['zipCode'],
                ),
                _buildInfoRow(
                  label: "Country",
                  value: studentData['addresses']['permanent']['country'],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.map, color: Colors.teal),
              onPressed: () {
                _showAnimatedDialog(
                  context,
                  'Map View',
                  'Map view would open here',
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Hostel Information",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "Hostel Name",
                  value: studentData['addresses']['hostel']['name'],
                ),
                _buildInfoRow(
                  label: "Room Number",
                  value: studentData['addresses']['hostel']['roomNumber'],
                ),
                _buildInfoRow(
                  label: "Warden",
                  value: studentData['addresses']['hostel']['warden'],
                ),
                _buildInfoRow(
                  label: "Warden Phone",
                  value: studentData['addresses']['hostel']['wardenPhone'],
                ),
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
                _buildInfoRow(
                  label: "Institution",
                  value: studentData['academic']['current']['institution'],
                ),
                _buildInfoRow(
                  label: "Program",
                  value: studentData['academic']['current']['program'],
                ),
                _buildInfoRow(
                  label: "Major",
                  value: studentData['academic']['current']['major'],
                ),
                _buildInfoRow(
                  label: "Year",
                  value: studentData['academic']['current']['year'],
                ),
                _buildInfoRow(
                  label: "GPA",
                  value: studentData['academic']['current']['gpa'],
                ),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: 0.0,
                    end:
                        studentData['academic']['currentSemester']['gpaPercentage'],
                  ),
                  duration: const Duration(seconds: 1),
                  builder: (context, double value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: value,
                          backgroundColor:
                              _isDarkMode
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _isDarkMode
                                ? Colors.teal.shade200
                                : Colors.teal.shade700,
                          ),
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          studentData['academic']['currentSemester']['gpa'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isDarkMode
                                    ? Colors.teal.shade200
                                    : Colors.teal,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Current Courses",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  studentData['academic']['courses'].length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.only(bottom: 10, left: index * 5.0),
                    child: _buildCourseItem(
                      studentData['academic']['courses'][index]['code'],
                      studentData['academic']['courses'][index]['name'],
                      studentData['academic']['courses'][index]['grade'],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: "Previous Education",
            content: Column(
              children: [
                _buildInfoRow(
                  label: "High School",
                  value: studentData['academic']['previous']['highSchool'],
                ),
                _buildInfoRow(
                  label: "Graduation Year",
                  value: studentData['academic']['previous']['graduationYear'],
                ),
                _buildInfoRow(
                  label: "GPA",
                  value: studentData['academic']['previous']['gpa'],
                ),
                const Divider(),
                _buildInfoRow(
                  label: "Achievements",
                  value: studentData['academic']['previous']['achievements'],
                ),
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
        color: _isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _isDarkMode ? Colors.teal.shade900 : Colors.teal.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    _isDarkMode ? Colors.teal.shade200 : Colors.teal.shade700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: gradeColor.withOpacity(_isDarkMode ? 0.3 : 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              grade,
              style: TextStyle(fontWeight: FontWeight.bold, color: gradeColor),
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
      color: _isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: _isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        trailing: trailing,
        children: [Padding(padding: const EdgeInsets.all(16), child: content)],
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
                color:
                    _isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
