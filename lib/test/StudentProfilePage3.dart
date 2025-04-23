import 'package:flutter/material.dart';
import 'dart:math' as math;

class Studentprofilepage3 extends StatefulWidget {
  const Studentprofilepage3({super.key});

  @override
  State<Studentprofilepage3> createState() => _Studentprofilepage3State();
}

class _Studentprofilepage3State extends State<Studentprofilepage3> with SingleTickerProviderStateMixin {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleEditMode,
        icon: Icon(_isEditing ? Icons.save : Icons.edit),
        label: Text(_isEditing ? 'Save' : 'Edit'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
                Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              ],
            ),
          ),
          child: Stack(
            children: List.generate(20, (index) {
              return Positioned(
                left: math.Random().nextDouble() * MediaQuery.of(context).size.width,
                top: math.Random().nextDouble() * 120,
                child: Container(
                  width: math.Random().nextDouble() * 20 + 5,
                  height: math.Random().nextDouble() * 20 + 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ],
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
              Hero(
                tag: 'profile-image',
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://i.pravatar.cc/300?img=11',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (_isEditing)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
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
              ? TextFormField(
                  initialValue: _studentData['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                )
              : Text(
                  _studentData['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                  decoration: const InputDecoration(
                    labelText: 'Student ID',
                    border: OutlineInputBorder(),
                  ),
                )
              : Text(
                  'ID: ${_studentData['id']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.contact_mail,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            _buildContactItem(
              icon: Icons.email,
              title: 'Email',
              value: _studentData['email'],
              isEditing: _isEditing,
            ),
            _buildContactItem(
              icon: Icons.phone,
              title: 'Phone',
              value: _studentData['phone'],
              isEditing: _isEditing,
            ),
            _buildContactItem(
              icon: Icons.location_on,
              title: 'Address',
              value: _studentData['address'],
              isEditing: _isEditing,
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.secondary,
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
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                isEditing
                    ? TextFormField(
                        initialValue: value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      )
                    : Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16,
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
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.school,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Academic Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Department',
                      value: _studentData['department'],
                      icon: Icons.business,
                      color: Colors.blue,
                      isEditing: _isEditing,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Year',
                      value: _studentData['year'],
                      icon: Icons.calendar_today,
                      color: Colors.green,
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
                      color: Colors.orange,
                      isEditing: _isEditing,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      title: 'Enrollment Date',
                      value: _studentData['enrollmentDate'],
                      icon: Icons.date_range,
                      color: Colors.purple,
                      isEditing: _isEditing,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Current Courses',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _isEditing
                  ? Column(
                      children: List.generate(
                        _studentData['courses'].length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: TextFormField(
                            initialValue: _studentData['courses'][index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: const Icon(Icons.edit),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(
                        _studentData['courses'].length,
                        (index) => _buildCourseItem(_studentData['courses'][index]),
                      ),
                    ),
              if (_isEditing)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add Course'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          isEditing
              ? TextFormField(
                  initialValue: value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildCourseItem(String course) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.book,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              course,
              style: const TextStyle(
                fontSize: 15,
              ),
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
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16),
              _buildPersonalInfoItem(
                title: 'Date of Birth',
                value: _studentData['dateOfBirth'],
                icon: Icons.cake,
                isEditing: _isEditing,
              ),
              const SizedBox(height: 16),
              _buildPersonalInfoItem(
                title: 'Student ID',
                value: _studentData['id'],
                icon: Icons.badge,
                isEditing: _isEditing,
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
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.tertiary,
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
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              isEditing
                  ? TextFormField(
                      initialValue: value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    )
                  : Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsAndLanguages() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.psychology,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Skills',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['skills'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                initialValue: _studentData['skills'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            _studentData['skills'].length,
                            (index) => Chip(
                              label: Text(_studentData['skills'][index]),
                              backgroundColor: [
                                Colors.blue[100],
                                Colors.green[100],
                                Colors.orange[100],
                                Colors.purple[100],
                              ][index % 4],
                              side: BorderSide(
                                color: [
                                  Colors.blue[300]!,
                                  Colors.green[300]!,
                                  Colors.orange[300]!,
                                  Colors.purple[300]!,
                                ][index % 4],
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                  if (_isEditing)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add Skill'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Languages',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['languages'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                initialValue: _studentData['languages'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(Icons.edit),
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
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add Language'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
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

  Widget _buildLanguageItem(String language, int index) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors[index % colors.length].withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors[index % colors.length].withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors[index % colors.length].withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.translate,
              color: colors[index % colors.length],
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            language,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsAndActivities() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Achievements',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['achievements'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                initialValue: _studentData['achievements'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(Icons.edit),
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
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add Achievement'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.groups,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Extracurricular Activities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  _isEditing
                      ? Column(
                          children: List.generate(
                            _studentData['extracurricular'].length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                initialValue: _studentData['extracurricular'][index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(Icons.edit),
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
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add Activity'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.secondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              achievement,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String activity, int index) {
    final List<IconData> icons = [
      Icons.code,
      Icons.school,
      Icons.sports_esports,
    ];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icons[index % icons.length],
              color: Theme.of(context).colorScheme.tertiary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              activity,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
