
import 'package:dashboard/ui/pages/home.dart';
import 'package:dashboard/widgets/screens/filter_screen.dart';
import 'package:dashboard/widgets/screens/help_support.dart';
import 'package:dashboard/widgets/screens/job_opp.dart';
import 'package:dashboard/widgets/screens/metors.dart';
import 'package:dashboard/widgets/screens/study_material.dart';
import 'package:dashboard/widgets/screens/test_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id == 'c5') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else if(id=='c2'){
            Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FilterScreen(),
            ),
          );
        }else if(id=='c1'){
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => StudyMaterialApp(),
            ),
          );
        }
        else if(id=='c3'){
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MentorAssignmentScreen(),
            ),
          );
        } else if (id == 'c4') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => QuizScreen(),
            ),
          );
        } else if (id == 'c7') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SkillSelectionScreen(),
            ),
          );
        } else if (id == 'c6') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => HelpAndSupportPage(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Text('This is the Home Screen.'),
      ),
    );
  }
}
// import 'package:dashboard/widgets/screens/help_support.dart';
// import 'package:dashboard/widgets/screens/job_opp.dart';
// import 'package:flutter/cupertino.dart';

// class CategoryItem extends StatelessWidget {
//   final String id;
//   final String title;
//   final Color color;

//   CategoryItem(this.id, this.title, this.color);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       onPressed: () {
//         navigateToScreen(context);
//       },
//       padding: EdgeInsets.all(0),
//       child: Container(
//         padding: EdgeInsets.all(15),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: CupertinoColors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               color.withOpacity(0.8),
//               color,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }

//   void navigateToScreen(BuildContext context) {
//     Widget screen;

//     switch (id) {
//       case 'c1':
//         screen = CupertinoPageRoute(
//           builder: (context) => StudyMaterialApp(),
//         ) as Widget;
//         break;
//       case 'c2':
//         screen = CupertinoPageRoute(
//           builder: (context) => FilterScreen(),
//         ) as Widget;
//         break;
//       case 'c3':
//         screen = CupertinoPageRoute(
//           builder: (context) => MentorAssignmentScreen(),
//         ) as Widget;
//         break;
//       case 'c4':
//         screen = CupertinoPageRoute(
//           builder: (context) => TestAssignmentScreen(),
//         ) as Widget;
//         break;
//       case 'c5':
//         screen = CupertinoPageRoute(
//           builder: (context) => Home(),
//         ) as Widget;
//         break;
//       case 'c6':
//         screen = CupertinoPageRoute(
//           builder: (context) => OrganizationListScreen(),
//         ) as Widget;
//         break;
//       case 'c7':
//         screen = CupertinoPageRoute(
//           builder: (context) => SkillSelectionScreen(),
//         ) as Widget;
//         break;
//       default:
//         return;
//     }

//     Navigator.of(context).push(screen as Route<Object?>);
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Home'),
//       ),
//       child: Center(
//         child: Text('This is the Home Screen.'),
//       ),
//     );
//   }
// }

