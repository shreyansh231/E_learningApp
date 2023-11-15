import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyMaterialApp extends StatefulWidget {
  const StudyMaterialApp({Key? key}) : super(key: key);

  @override
  _StudyMaterialAppState createState() => _StudyMaterialAppState();
}

class _StudyMaterialAppState extends State<StudyMaterialApp> {
  List<StudyMaterial> studyMaterials = [
    StudyMaterial(
      category: 'Programming',
      title: 'Learn the Basics',
      description: 'Master 3D modeling for animation.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Programming',
      title: 'Data Structures and Algorithms',
      description: 'Learn animation principles and techniques.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Programming',
      title: 'Projects and Practice',
      description: 'Learn animation principles and techniques.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'Graphic Design Fundamentals',
      description: 'Get started with graphic design.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'UI/UX Design',
      description: 'Learn user interface and user experience design.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Cybersecurity',
      title: 'Network Security',
      description: 'Explore network security concepts.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    // Add more study materials here
  ];

  List<StudyMaterial> filteredStudyMaterials = [
    StudyMaterial(
      category: 'Programming',
      title: 'Learn the Basics',
      description: 'Master 3D modeling for animation.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Programming',
      title: 'Data Structures and Algorithms',
      description: 'Learn animation principles and techniques.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Programming',
      title: 'Projects and Practice',
      description: 'Learn animation principles and techniques.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'Graphic Design Fundamentals',
      description: 'Get started with graphic design.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'UI/UX Design',
      description: 'Learn user interface and user experience design.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
    StudyMaterial(
      category: 'Cybersecurity',
      title: 'Network Security',
      description: 'Explore network security concepts.',
      duration: '4 weeks',
      steps: [
        'Step 1: Introduction',
        'Step 2: Basic Principles',
        'Step 3: Advanced Topics'
      ],
    ),
  ];

  String selectedCategory = 'Programming';

  @override
  void initState() {
    super.initState();
    filterStudyMaterials();
  }

  void filterStudyMaterials() {
    setState(() {
      filteredStudyMaterials = studyMaterials
          .where((material) => material.category == selectedCategory)
          .toList();
    });
  }

  void openFilterSkillsActionSheet() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text(
            'Filter Skills',
            style: TextStyle(fontSize: 24),
          ),
          actions: studyMaterials
              .map(
                (material) => CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      selectedCategory = material.category;
                      filterStudyMaterials();
                    });
                    Navigator.pop(context); // Close the action sheet
                  },
                  child: Text(material.category),
                ),
              )
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context); // Close the action sheet
            },
            child: const Text('Cancel'),
            isDefaultAction: true,
          ),
        );
      },
    );
  }

  void openMaterialDetailsPage(StudyMaterial material) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(material.title),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${material.title}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description: ${material.description}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Duration: ${material.duration}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Steps to Complete:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: material.steps.map((step) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            step,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Study Materials'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(18),
                pressedOpacity: .8,
                color: Colors.white,
                onPressed: () {
                  openFilterSkillsActionSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Filter Skills: $selectedCategory',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const Icon(
                      CupertinoIcons.down_arrow,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudyMaterials.length,
                itemBuilder: (context, index) {
                  final material = filteredStudyMaterials[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                        title: Text(material.title),
                        subtitle: Text(material.description),
                        trailing: Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onTap: () {
                          openMaterialDetailsPage(material);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyMaterial {
  final String category;
  final String title;
  final String description;
  final String duration;
  final List<String> steps;

  StudyMaterial({
    required this.category,
    required this.title,
    required this.description,
    required this.duration,
    required this.steps,
  });
}
