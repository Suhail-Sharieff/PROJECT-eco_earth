import 'package:flutter/material.dart';

enum StepType { personalInfo, accountInfo, review, confirmation }

class StepModel {
  final StepType type;
  final String title;
  final String description;
  final bool isCompleted;

  StepModel({
    required this.type,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}

class CustomStepper extends StatefulWidget {
  final List<StepModel> steps;

  const CustomStepper({super.key, required this.steps});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: widget.steps.length.toDouble())
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
          _currentStep = _animation.value.floor();
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _shouldShowCompleted(int index) {
    return widget.steps[index].isCompleted;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: ListView.builder(
    itemCount: widget.steps.length,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // Top Connector
                if (index > 0)
                  Container(
                    width: 2,
                    height: 20,
                    color: index <= _currentStep ? Colors.green : Colors.grey[300],
                  ),

                // Step Circle
                _buildStepCircle(index),

                // Bottom Connector
                if (index < widget.steps.length - 1)
                  Container(
                    width: 2,
                    height: 40,
                    color: index < _currentStep
                        ? Colors.green
                        : Colors.grey[300],
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.steps[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.steps[index].description,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),

    );
  }

  Widget _buildStepCircle(int index) {
    final isReached = index <= _currentStep;
    final isCompleted = widget.steps[index].isCompleted;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isReached
            ? (isCompleted ? Colors.green[700] : Colors.grey)
            : Colors.grey[200],
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Center(
        child: Icon(
          isCompleted ? Icons.check : null,
          size: 16,
          color: isCompleted ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

}
