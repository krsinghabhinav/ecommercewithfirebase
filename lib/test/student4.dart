import 'package:flutter/material.dart';
import 'dart:math' as math;

class Student4 extends StatefulWidget {
  const Student4({super.key});

  @override
  State<Student4> createState() => _Student4State();
}

class _Student4State extends State<Student4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();
  bool _isEditing = false;
  
  // Sample student data
  final Map<String, dynamic> _studentData = {
    'name': 'Alex Johnson',
    'id': 'STU20240416',
    'email': 'alex.johnson@university.edu',
    'phone': '+1 (555) 123-4567',
    'department': 'Computer Science',
    'year': '3rd Year',
    'gpa': '3.85',
    'address': '123 University Ave, College Town, CT 12345',
    'dateOfBirth': '15 May 2002',
    'enrollmentDate': 'August 2021',
    'skills': ['Programming', 'Data Analysis', 'UI/UX Design', 'Problem Solving'],
    'languages': ['English (Native)', 'Spanish (Intermediate)', 'French (Basic)'],
    'achievements': [
      'Dean\'s List (2022-2023)',
      'Hackathon Winner (2022)',
      'Research Assistant (2023)',
    ],
    'courses': [
      'CS301: Advanced Algorithms',
      'CS405: Machine Learning',
      'CS410: Mobile App Development',
      'MATH301: Linear Algebra',
    ],
    'extracurricular': [
      'Coding Club President',
      'Volunteer Tutor',
      'University Chess Team',
    ],
  };

  // Theme colors
  late final Color _primaryColor = const Color(0xFF6A5AE0);
  late final Color _secondaryColor = const Color(0xFF22C55E);
  late final Color _tertiaryColor = const Color(0xFFF59E0B);
  late final Color _quaternaryColor = const Color(0xFFEC4899);
  late final List<Color> _gradientColors = [
    const Color(0xFF6A5AE0),
    const Color(0xFF8B5CF6),
    const Color(0xFFA78BFA),
  ];
  
  // Skill colors
  late final List<Color> _skillColors = [
    const Color(0xFF60A5FA),
    const Color(0xFF34D399),
    const Color(0xFFFCD34D),
    const Color(0xFFF472B6),
  ];
  
  // For random floating particles
  late final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
    
    if (!_isEditing) {
      // Add a success animation when saving
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Profile updated successfully!'),
            ],
          ),
          backgroundColor: _secondaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: _primaryColor,
        colorScheme: ColorScheme.light(
          primary: _primaryColor,
          secondary: _secondaryColor,
          tertiary: _tertiaryColor,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
                    ),
                    child: child,
                  );
                },
                child: _buildProfileHeader(),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.1, 0.9, curve: Curves.easeOut),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.1, 0.9, curve: Curves.easeOut),
                      )),
                      child: child,
                    ),
                  );
                },
                child: _buildAcademicInfo(),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
                      )),
                      child: child,
                    ),
                  );
                },
                child: _buildPersonalInfo(),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
                      )),
                      child: child,
                    ),
                  );
                },
                child: _buildSkillsAndLanguages(),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
                      )),
                      child: child,
                    ),
                  );
                },
                child: _buildAchievementsAndActivities(),
              ),
            ),
            SliverToBoxAdapter(
              child: const SizedBox(height: 100),
            ),
          ],
        ),
        floatingActionButton: AnimatedScale(
          scale: _isEditing ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton.extended(
            onPressed: _toggleEditMode,
            icon: Icon(_isEditing ? Icons.save_rounded : Icons.edit_rounded),
            label: Text(_isEditing ? 'Save Profile' : 'Edit Profile'),
            backgroundColor: _isEditing ? _secondaryColor : _primaryColor,
            foregroundColor: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 160,
      floating: false,
      pinned: true,
      stretch: true,
      backgroundColor: _primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _gradientColors,
            ),
          ),
          child: Stack(
            children: [
              // Animated floating particles
              ...List.generate(30, (index) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 2000 + _random.nextInt(3000)),
                  left: _random.nextDouble() * MediaQuery.of(context).size.width,
                  top: _random.nextDouble() * 160,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1000 + _random.nextInt(1000)),
                    opacity: 0.1 + _random.nextDouble() * 0.3,
                    child: Container(
                      width: _random.nextDouble() * 25 + 5,
                      height: _random.nextDouble() * 25 + 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                );
              }),
              
              // Subtle wave pattern at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  painter: WavePainter(
                    color: Colors.white.withOpacity(0.1),
                  ),
                  size: Size(MediaQuery.of(context).size.width, 40),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {
            // Show a beautiful notification overlay
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Notifications'),
                content: SizedBox(
                  height: 200,
                  width: 300,
                  child: ListView(
                    children: [
                      _buildNotificationItem(
                        'New course available', 
                        'Check out CS520: Artificial Intelligence',
                        Icons.school,
                        _secondaryColor,
                      ),
                      _buildNotificationItem(
                        'Assignment due soon', 
                        'CS405 Project due in 3 days',
                        Icons.assignment,
                        _tertiaryColor,
                      ),
                      _buildNotificationItem(
                        'Profile update reminder', 
                        'Please update your profile with recent achievements',
                        Icons.person,
                        _quaternaryColor,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close', style: TextStyle(color: _primaryColor)),
                  ),
                ],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {
            // Show a menu with options
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildMenuOption(Icons.print, 'Print Profile', _primaryColor),
                    _buildMenuOption(Icons.share, 'Share Profile', _secondaryColor),
                    _buildMenuOption(Icons.download, 'Export as PDF', _tertiaryColor),
                    _buildMenuOption(Icons.settings, 'Profile Settings', _quaternaryColor),
                    _buildMenuOption(Icons.help_outline, 'Help & Support', Colors.grey),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildNotificationItem(String title, String content, IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 16),
            Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              // Animated avatar container
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            _primaryColor,
                            _secondaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _primaryColor.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(4),
                      child: Hero(
                        tag: 'profile-image',
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pravatar.cc/300?img=11',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (_isEditing)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_secondaryColor, _primaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _secondaryColor.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _isEditing
              ? Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    initialValue: _studentData['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: _primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: _primaryColor, width: 2),
                      ),
                      floatingLabelStyle: TextStyle(color: _primaryColor),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                )
              : ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [_primaryColor, _secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    _studentData['name'],
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
          const SizedBox(height: 8),
          _isEditing
              ? TextFormField(
                  initialValue: _studentData['id'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Student ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                )
              : AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _primaryColor.withOpacity(0.1),
                        _secondaryColor.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _primaryColor.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    'ID: ${_studentData['id']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: _primaryColor,
                    ),
                  ),
                ),
          const SizedBox(height: 24),
          _buildContactInfo(),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: _primaryColor.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              _primaryColor.withOpacity(0.05),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_primaryColor, _primaryColor.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.contact_mail,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _primaryColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: _primaryColor.withOpacity(0.2),
              thickness: 1.5,
              height: 32,
            ),
            const SizedBox(height: 8),
            _buildContactItem(
              icon: Icons.email,
              title: 'Email',
              value: _studentData['email'],
              isEditing: _isEditing,
              color: _primaryColor,
            ),
            _buildContactItem(
              icon: Icons.phone,
              title: 'Phone',
              value: _studentData['phone'],
              isEditing: _isEditing,
              color: _secondaryColor,
            ),
            _buildContactItem(
              icon: Icons.location_on,
              title: 'Address',
              value: _studentData['address'],
              isEditing: _isEditing,
              color: _tertiaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
    required bool isEditing,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
                const SizedBox(height: 6),
                isEditing
                    ? TextFormField(
                        initialValue: value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: color),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: color, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          fillColor: color.withOpacity(0.05),
                          filled: true,
                        ),
                      )
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: color.withOpacity(0.3)),
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 8,
        shadowColor: _secondaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                _secondaryColor.withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [_secondaryColor, _secondaryColor.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.school,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Academic Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _secondaryColor,
                    ),
                  ),
                ],
              ),
              Divider(
                color: _secondaryColor.withOpacity(0.2),
                thickness: 1.5,
                height: 32,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Department',
                      value: _studentData['department'],
                      icon: Icons.business,
                      color: Colors.blue.shade600,
                      isEditing: _isEditing,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Year',
                      value: _studentData['year'],
                      icon: Icons.calendar_today,
                      color: _secondaryColor,
                      isEditing: _isEditing,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoItem(
                      title: 'GPA',
                      value: _studentData['gpa'],
                      icon: Icons.grade,
                      color: _tertiaryColor,
                      isEditing: _isEditing,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Enrollment Date',
                      value: _studentData['enrollmentDate'],
                      icon: Icons.date_range,
                      color: _quaternaryColor,
                      isEditing: _isEditing,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _secondaryColor.withOpacity(0.3)),
                ),
                child: Text(
                  'Current Courses',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _isEditing
                  ? Column(
                      children: List.generate(
                        _studentData['courses'].length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TextFormField(
                            initialValue: _studentData['courses'][index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: _secondaryColor, width: 2),
                              ),
                              suffixIcon: Icon(Icons.edit, color: _secondaryColor),
                              fillColor: _secondaryColor.withOpacity(0.05),
                              filled: true,
                              prefixIcon: Icon(Icons.book, color: _secondaryColor),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(
                        _studentData['courses'].length,
                        (index) => _buildCourseItem(_studentData['courses'][index], index),
                      ),
                    ),
              if (_isEditing)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Add Course'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _secondaryColor,
                      side: BorderSide(color: _secondaryColor),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required bool isEditing,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            isEditing
                ? TextFormField(
                    initialValue: value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  )
                : Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItem(String course, int index) {
    final List<Color> colors = [
      _primaryColor,
      _secondaryColor,
      _tertiaryColor,
      _quaternaryColor,
    ];
    
    final Color itemColor = colors[index % colors.length];
    
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              itemColor.withOpacity(0.1),
              itemColor.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: itemColor.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: itemColor.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {
              // Show course details
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        course,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: itemColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildCourseDetailItem(
                        title: 'Schedule',
                        value: 'Monday, Wednesday 10:00 AM - 11:30 AM',
                        icon: Icons.access_time,
                        color: itemColor,
                      ),
                      _buildCourseDetailItem(
                        title: 'Professor',
                        value: 'Dr. Jane Smith',
                        icon: Icons.person,
                        color: itemColor,
                      ),
                      _buildCourseDetailItem(
                        title: 'Room',
                        value: 'Science Building, Room 305',
                        icon: Icons.room,
                        color: itemColor,
                      ),
                      _buildCourseDetailItem(
                        title: 'Credits',
                        value: '4 credits',
                        icon: Icons.star,
                        color: itemColor,
                      ),
                    ],
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: itemColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.book,
                      size: 20,
                      color: itemColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      course,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: itemColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseDetailItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 8,
        shadowColor: _tertiaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                _tertiaryColor.withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [_tertiaryColor, _tertiaryColor.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _tertiaryColor,
                    ),
                  ),
                ],
              ),
              Divider(
                color: _tertiaryColor.withOpacity(0.2),
                thickness: 1.5,
                height: 32,
              ),
              const SizedBox(height: 16),
              _buildPersonalInfoItem(
                title: 'Date of Birth',
                value: _studentData['dateOfBirth'],
                icon: Icons.cake,
                isEditing: _isEditing,
                color: _tertiaryColor,
              ),
              const SizedBox(height: 16),
              _buildPersonalInfoItem(
                title: 'Student ID',
                value: _studentData['id'],
                icon: Icons.badge,
                isEditing: _isEditing,
                color: _primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfoItem({
    required String title,
    required String value,
    required IconData icon,
    required bool isEditing,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                isEditing
                    ? TextFormField(
                        initialValue: value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: color, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsAndLanguages() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 8,
            shadowColor: _primaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    _primaryColor.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [_primaryColor, _primaryColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.psychology,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Skills',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: _primaryColor.withOpacity(0.2),
                    thickness: 1.5,
                    height: 32,
                  ),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['skills'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TextFormField(
                                initialValue: _studentData['skills'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: _primaryColor, width: 2),
                                  ),
                                  suffixIcon: Icon(Icons.edit, color: _primaryColor),
                                  prefixIcon: Icon(Icons.straighten, color: _primaryColor),
                                  fillColor: _primaryColor.withOpacity(0.05),
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(
                            _studentData['skills'].length,
                            (index) => _buildSkillChip(
                              _studentData['skills'][index], 
                              _skillColors[index % _skillColors.length],
                            ),
                          ),
                        ),
                  if (_isEditing)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Add Skill'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _primaryColor,
                          side: BorderSide(color: _primaryColor),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 8,
            shadowColor: _secondaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    _secondaryColor.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [_secondaryColor, _secondaryColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Languages',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: _secondaryColor.withOpacity(0.2),
                    thickness: 1.5,
                    height: 32,
                  ),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['languages'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TextFormField(
                                initialValue: _studentData['languages'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: _secondaryColor, width: 2),
                                  ),
                                  suffixIcon: Icon(Icons.edit, color: _secondaryColor),
                                  prefixIcon: Icon(Icons.translate, color: _secondaryColor),
                                  fillColor: _secondaryColor.withOpacity(0.05),
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                            _studentData['languages'].length,
                            (index) => _buildLanguageItem(_studentData['languages'][index], index),
                          ),
                        ),
                  if (_isEditing)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Add Language'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _secondaryColor,
                          side: BorderSide(color: _secondaryColor),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill, Color color) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(width: 8),
          Text(
            skill,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String language, int index) {
    final List<Color> colors = [
      _primaryColor,
      _secondaryColor,
      _tertiaryColor,
    ];
    
    final Color color = colors[index % colors.length];
    final List<String> parts = language.split('(');
    final String lang = parts[0].trim();
    final String level = parts.length > 1 ? '(${parts[1]}' : '';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.translate,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      if (level.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            level,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    _getLanguageLevelIcon(level),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getLanguageLevelIcon(String level) {
    if (level.contains('Native')) return Icons.star;
    if (level.contains('Advanced')) return Icons.grade;
    if (level.contains('Intermediate')) return Icons.star_half;
    return Icons.star_border;
  }

  Widget _buildAchievementsAndActivities() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 8,
            shadowColor: _tertiaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    _tertiaryColor.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [_tertiaryColor, _tertiaryColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.emoji_events,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Achievements',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _tertiaryColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: _tertiaryColor.withOpacity(0.2),
                    thickness: 1.5,
                    height: 32,
                  ),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['achievements'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TextFormField(
                                initialValue: _studentData['achievements'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: _tertiaryColor, width: 2),
                                  ),
                                  suffixIcon: Icon(Icons.edit, color: _tertiaryColor),
                                  prefixIcon: Icon(Icons.emoji_events_outlined, color: _tertiaryColor),
                                  fillColor: _tertiaryColor.withOpacity(0.05),
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                            _studentData['achievements'].length,
                            (index) => _buildAchievementItem(_studentData['achievements'][index]),
                          ),
                        ),
                  if (_isEditing)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Add Achievement'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _tertiaryColor,
                          side: BorderSide(color: _tertiaryColor),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 8,
            shadowColor: _quaternaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    _quaternaryColor.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [_quaternaryColor, _quaternaryColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.groups,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Extracurricular Activities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _quaternaryColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: _quaternaryColor.withOpacity(0.2),
                    thickness: 1.5,
                    height: 32,
                  ),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['extracurricular'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TextFormField(
                                initialValue: _studentData['extracurricular'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: _quaternaryColor, width: 2),
                                  ),
                                  suffixIcon: Icon(Icons.edit, color: _quaternaryColor),
                                  prefixIcon: Icon(Icons.group, color: _quaternaryColor),
                                  fillColor: _quaternaryColor.withOpacity(0.05),
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                            _studentData['extracurricular'].length,
                            (index) => _buildActivityItem(_studentData['extracurricular'][index], index),
                          ),
                        ),
                  if (_isEditing)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Add Activity'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _quaternaryColor,
                          side: BorderSide(color: _quaternaryColor),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String achievement) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1.0),
      duration: Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _tertiaryColor.withOpacity(0.1),
              _primaryColor.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _tertiaryColor.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: _tertiaryColor.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _tertiaryColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.star,
                      color: _tertiaryColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      achievement,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(String activity, int index) {
    final List<IconData> icons = [
      Icons.code,
      Icons.volunteer_activism,
      Icons.sports_esports,
    ];
    
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1.0),
      duration: Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _quaternaryColor.withOpacity(0.1),
              _quaternaryColor.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _quaternaryColor.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: _quaternaryColor.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _quaternaryColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      icons[index % icons.length],
                      color: _quaternaryColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      activity,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for creating wave effect
class WavePainter extends CustomPainter {
  final Color color;
  
  WavePainter({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
      
    final path = Path();
    
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.7);
    
    for (int i = 0; i < 5; i++) {
      final x1 = size.width * (i * 0.2);
      final y1 = size.height * 0.7 - (i % 2 == 0 ? -10 : 10);
      final x2 = size.width * (i * 0.2 + 0.1);
      final y2 = size.height * 0.7;
      
      path.cubicTo(
        x1, y1, 
        x2, y2,
        size.width * (i * 0.2 + 0.2), size.height * 0.7
      );
    }
    
    path.lineTo(size.width, size.height);
    path.close();
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}