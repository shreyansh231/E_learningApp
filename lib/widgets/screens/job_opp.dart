// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SkillSelectionScreen extends StatefulWidget {
//   @override
//   _SkillSelectionScreenState createState() => _SkillSelectionScreenState();
// }

// class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
//   String selectedSkill = 'Programming'; // Set the default skill here
//   String selectedCourse = '';
//   String jobCompany = ''; // Set the default job here
//   String companyDescription = 'No description available';

//   final Map<String, List<String>> skillsData = {
//     'Programming': ['Java', 'Python', 'C++'],
//     'Design': ['UI/UX Design', 'Graphic Design'],
//     'Data Science': ['Machine Learning', 'Data Analysis'],
//   };

//   final Map<String, String> courseData = {
//     'Java': 'Java Programming Course',
//     'Python': 'Python Programming Course',
//     'C++': 'C++ Programming Course',
//     'UI/UX Design': 'UI/UX Design Course',
//     'Graphic Design': 'Graphic Design Course',
//     'Machine Learning': 'Machine Learning Course',
//     'Data Analysis': 'Data Analysis Course',
//   };

//   final Map<String, String> jobData = {
//     'Java': 'ABC Inc.',
//     'Python': 'XYZ Corp.',
//     'C++': 'Tech Solutions Ltd.',
//     'UI/UX Design': 'Designers R Us',
//     'Graphic Design': 'Creative Studios',
//     'Machine Learning': 'Data Innovators',
//     'Data Analysis': 'Info Analytics',
//   };

//   final Map<String, String> companyDescriptionData = {
//     'ABC Inc.':
//         'ABC Inc. is a leading technology company specializing in software development and IT services.',
//     'XYZ Corp.':
//         'XYZ Corp. is a global tech company known for its cutting-edge innovations in artificial intelligence.',
//     'Tech Solutions Ltd.':
//         'Tech Solutions Ltd. provides IT solutions to businesses of all sizes.',
//     'Designers R Us':
//         'Designers R Us is a creative agency that specializes in UI/UX design and branding.',
//     'Creative Studios':
//         'Creative Studios is an award-winning graphic design agency known for its exceptional design work.',
//     'Data Innovators':
//         'Data Innovators is a data science company that leverages machine learning for data-driven insights.',
//     'Info Analytics':
//         'Info Analytics offers comprehensive data analysis services to help businesses make informed decisions.',
//   };

//   void _selectSkill(String skill) {
//     setState(() {
//       selectedSkill = skill;
//       selectedCourse = '';
//       jobCompany = jobData[skill] ?? 'No company information available';
//       companyDescription =
//           companyDescriptionData[jobCompany] ?? 'No description available';
//     });
//   }

//   void _selectCourse(String course) {
//     setState(() {
//       selectedCourse = course;
//       jobCompany = jobData[course] ?? 'No company information available';
//       companyDescription =
//           companyDescriptionData[jobCompany] ?? 'No description available';
//     });
//   }

//   void _showCompanyDetails(String companyName) {
//     // Navigate to a new screen to show company details
//     Navigator.of(context).push(
//       CupertinoPageRoute(
//         builder: (context) {
//           // You can customize the company details page here
//           return CupertinoPageScaffold(
//             navigationBar: CupertinoNavigationBar(
//               middle: Text('Company Details'),
//             ),
//             child: SafeArea(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Company: $companyName',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Details: $companyDescription',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Skill Selection'),
//         leading: CupertinoButton(
//           padding: EdgeInsets.all(0),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(CupertinoIcons.back),
//         ),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             CupertinoButton(
//               onPressed: () {
//                 showCupertinoModalPopup(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return CupertinoActionSheet(
//                       title: Text('Select a Skill'),
//                       actions: skillsData.keys.map((skill) {
//                         return CupertinoActionSheetAction(
//                           onPressed: () {
//                             _selectSkill(skill);
//                             Navigator.pop(context);
//                           },
//                           child: Text(skill),
//                         );
//                       }).toList(),
//                     );
//                   },
//                 );
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Skill: $selectedSkill'),
//                   Icon(CupertinoIcons.arrow_down,
//                       color: CupertinoColors.activeBlue),
//                 ],
//               ),
//             ),
//             if (selectedSkill.isNotEmpty)
//               CupertinoButton(
//                 onPressed: () {
//                   showCupertinoModalPopup(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return CupertinoActionSheet(
//                         title: Text('Select a Course for $selectedSkill'),
//                         actions: skillsData[selectedSkill]!.map((course) {
//                           return CupertinoActionSheetAction(
//                             onPressed: () {
//                               _selectCourse(course);
//                               Navigator.pop(context);
//                             },
//                             child: Text(course),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Course: $selectedCourse'),
//                     Icon(CupertinoIcons.arrow_down,
//                         color: CupertinoColors.activeBlue),
//                   ],
//                 ),
//               ),
//             if (selectedCourse.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   margin: EdgeInsets.zero,
//                   child: InkWell(
//                     onTap: () {
//                       _showCompanyDetails(jobCompany);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Job Opportunity',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Company: $jobCompany',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Details: $companyDescription',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillSelectionScreen extends StatefulWidget {
  @override
  _SkillSelectionScreenState createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
  String selectedSkill = 'Programming'; // Set the default skill here
  String selectedCourse = 'Java'; // Set the default course here
  String jobCompany = 'ABC Inc.'; // Set the default job here
  String companyDescription =
      'ABC Inc. is a leading technology company specializing in software development and IT services.'; // Set the default company description here

  final Map<String, List<String>> skillsData = {
    'Programming': ['Java', 'Python', 'C++'],
    'Design': ['UI/UX Design', 'Graphic Design'],
    'Data Science': ['Machine Learning', 'Data Analysis'],
  };

  final Map<String, String> courseData = {
    'Java': 'Java Programming Course',
    'Python': 'Python Programming Course',
    'C++': 'C++ Programming Course',
    'UI/UX Design': 'UI/UX Design Course',
    'Graphic Design': 'Graphic Design Course',
    'Machine Learning': 'Machine Learning Course',
    'Data Analysis': 'Data Analysis Course',
  };

  final Map<String, String> jobData = {
    'Java': 'ABC Inc.',
    'Python': 'XYZ Corp.',
    'C++': 'Tech Solutions Ltd.',
    'UI/UX Design': 'Designers R Us',
    'Graphic Design': 'Creative Studios',
    'Machine Learning': 'Data Innovators',
    'Data Analysis': 'Info Analytics',
  };

  final Map<String, String> companyDescriptionData = {
    'ABC Inc.':
        'ABC Inc. is a leading technology company specializing in software development and IT services.',
    'XYZ Corp.':
        'XYZ Corp. is a global tech company known for its cutting-edge innovations in artificial intelligence.',
    'Tech Solutions Ltd.':
        'Tech Solutions Ltd. provides IT solutions to businesses of all sizes.',
    'Designers R Us':
        'Designers R Us is a creative agency that specializes in UI/UX design and branding.',
    'Creative Studios':
        'Creative Studios is an award-winning graphic design agency known for its exceptional design work.',
    'Data Innovators':
        'Data Innovators is a data science company that leverages machine learning for data-driven insights.',
    'Info Analytics':
        'Info Analytics offers comprehensive data analysis services to help businesses make informed decisions.',
  };

  @override
  void initState() {
    super.initState();
    // Set initial values here
    _selectSkill(selectedSkill);
    _selectCourse(selectedCourse);
  }

  void _selectSkill(String skill) {
    setState(() {
      selectedSkill = skill;
      // selectedCourse = '';
      jobCompany = jobData[skill] ?? 'No company information available';
      companyDescription =
          companyDescriptionData[jobCompany] ?? 'No description available';
    });
  }

  void _selectCourse(String course) {
    setState(() {
      selectedCourse = course;
      jobCompany = jobData[course] ?? 'No company information available';
      companyDescription =
          companyDescriptionData[jobCompany] ?? 'No description available';
    });
  }

  void _showCompanyDetails(String companyName) {
    // Navigate to a new screen to show company details
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          // You can customize the company details page here
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Company Details'),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Text(
                      'Company: $companyName',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Details: $companyDescription',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
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
        middle: Text('Skill Selection'),
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CupertinoButton(
                color: Colors.white,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        title: Text(
                          'Select a Skill',
                          style: TextStyle(color: Colors.black),
                        ),
                        actions: skillsData.keys.map((skill) {
                          return CupertinoActionSheetAction(
                            onPressed: () {
                              _selectSkill(skill);
                              Navigator.pop(context);
                            },
                            child: Text(
                              skill,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skill : $selectedSkill',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    Icon(CupertinoIcons.arrow_down,
                        color: CupertinoColors.black),
                  ],
                ),
              ),
            ),
            if (selectedSkill.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  color: Colors.white,
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: Text('Select a Course for $selectedSkill'),
                          actions: skillsData[selectedSkill]!.map((course) {
                            return CupertinoActionSheetAction(
                              onPressed: () {
                                _selectCourse(course);
                                Navigator.pop(context);
                              },
                              child: Text(course),
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Proficient : $selectedCourse',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        Icon(CupertinoIcons.arrow_down,
                            color: CupertinoColors.black),
                      ],
                    ),
                  ),
                ),
              ),
            if (selectedCourse.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {
                      _showCompanyDetails(jobCompany);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Opportunity',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Company: $jobCompany',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Details: $companyDescription',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
