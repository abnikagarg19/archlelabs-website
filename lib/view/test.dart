import 'package:flutter/material.dart';

class SlidingTabsExample extends StatefulWidget {
  @override
  _SlidingTabsExampleState createState() => _SlidingTabsExampleState();
}

class _SlidingTabsExampleState extends State<SlidingTabsExample>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0; // Default to showing Form 1
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  final List<String> tabs = ["Tab 1", "Tab 2", "Tab 3", "Tab 4"];
  final List<Widget> forms = [
    FormContainer(color: Colors.red, text: "Form 1"),
    FormContainer(color: Colors.blue, text: "Form 2"),
    FormContainer(color: Colors.green, text: "Form 3"),
    FormContainer(color: Colors.orange, text: "Form 4"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0.0), // Start at normal position
      end: Offset(0.0, 0.0),   // Stay in place
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); _controller.forward(from: 0.0); // Restart animation

  }

  void onTabPress(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
      _controller.forward(from: 0.0); // Restart animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar (Tabs)
          Container(
            width: 120,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                (index) => GestureDetector(
                  onTap: () => onTabPress(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedIndex == index ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Form Section (Show first form by default)
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0), // Start from right
                    end: Offset(0.0, 0.0),   // Move to position
                  ).animate(animation),
                  child: child,
                );
              },
              child: forms[selectedIndex], // Ensure the correct form is displayed
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Form Container
class FormContainer extends StatelessWidget {
  final Color color;
  final String text;

  FormContainer({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey<String>(text), // Ensures correct animation
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
