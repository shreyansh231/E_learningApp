
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  final List<String> helpTopics = [
    "How to Sign In",
    "How to Reset Password",
    "How to Use Features",
    "Contact Support",
    "Submit Feedback",
    "NGO Details",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Help and Support'),
      ),
      child: ListView.builder(
        itemCount: helpTopics.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  helpTopics[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  if (helpTopics[index] == 'Contact Support') {
                    _showContactSupportModal(context);
                  } else if (helpTopics[index] == 'Submit Feedback') {
                    _showFeedbackFormDialog(context);
                  } else if (helpTopics[index] == 'NGO Details') {
                    // Navigate to the NGO Details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NGODetailsPage(),
                      ),
                    );
                  } else {
                    // Handle tapping on other help topics
                    // You can navigate to a detailed help page or show relevant information.
                    // For simplicity, we're not doing that here.
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showContactSupportModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Contact Support',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'If you need further assistance, please contact our support team:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your logic to contact support (e.g., open a chat or email support).
                  // You can use external packages like URL Launcher for this.
                },
                child: Text('Contact Support', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFeedbackFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submit Feedback'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  hintText: 'Enter your feedback here',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your logic to submit feedback
                  // You can send the feedback to your server or handle it locally.
                  // Close the dialog when done.
                  Navigator.of(context).pop();
                },
                child: Text('Submit', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NGODetailsPage extends StatelessWidget {
  final List<String> dummyNGOs = [
    "1.Kerala State Welfare Corporation for Forward Communities (KSBCFC) ",
    "2. Kerala State Welfare Corporation for Forward Communities (KSBCFC)",
    "3. Scheduled Tribe Development Department:",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('NGO Details'),
      ),
      child: ListView.builder(
        itemCount: dummyNGOs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  dummyNGOs[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to the specific NGO Details page based on the selected NGO.
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NGO1DetailsPage(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NGO2DetailsPage(),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NGO3DetailsPage(),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class NGO1DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('NGO 1 Details'),
      ),
      child: Center(
        child: Text(
          'KSBCFC is a government agency that implements various welfare programs for the economic and educational development of forward communities, including scholarships and financial assistance for students.',
          style: TextStyle(fontSize: 18,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class NGO2DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('NGO 2 Details'),
      ),
      child: Center(
        child: Text(
          'This government department works on programs and initiatives aimed at the development and empowerment of Scheduled Caste communities in the state, including education and skill development programs.',
          style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class NGO3DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('NGO 3 Details'),
      ),
      child: Center(
        child: Text(
          'Development Department, this department focuses on the welfare and development of Scheduled Tribe communities in Kerala, including education and healthcare initiatives.',
          style: TextStyle(fontSize: 18,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
