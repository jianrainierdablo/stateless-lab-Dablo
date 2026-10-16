import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Ana Cruz',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'ana.cruz@school.edu',
  ),
  Student(
    name: 'Mark Reyes',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'mark.reyes@school.edu',
  ),
  Student(
    name: 'Liza Ramos',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'liza.ramos@school.edu',
  ),
  Student(
    name: 'Paolo Santos',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'paolo.santos@school.edu',
  ),
  Student(
    name: 'Jenny Lim',
    course: 'BS Information Technology',
    yearLevel: 2,
    email: 'jenny.lim@school.edu',
  ),
  Student(
    name: 'Carlo Mendoza',
    course: 'BS Computer Science',
    yearLevel: 3,
    email: 'carlo.mendoza@school.edu',
  ),
];

// Stateless because the app only shows fixed data and never changes by itself.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Directory',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, // Customization 1: teal theme seed color
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless because the screen just lays out the list and has no data that changes.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFA), // Customization 2: light teal page background
      appBar: AppBar(
        title: const Text(
          'Campus Directory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal, // Customization 3: solid teal app bar
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16), // Customization 4: extra padding around the list
        children: [
          const SectionHeader(title: 'Students'),
          for (final s in students) StudentCard(student: s),
        ],
      ),
    );
  }
}

// Stateless because it only displays the title it is given.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const Divider(color: Colors.teal),
      ],
    );
  }
}

// Stateless because it only shows the Student it receives and never edits it.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14), // Customization 5: rounded card corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.teal, // Customization 6: teal avatar color
              foregroundColor: Colors.white,
              child: Text(
                student.name[0],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold, // Customization 7: bold name text
                    ),
                  ),
                  Text(
                    student.course,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless because it only shows the icon and text passed into it.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.teal), // teal icons to match the sample
          const SizedBox(width: 6), // small gap between icon and text
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
