import 'package:flutter/material.dart';

import '../../enum/_02_order_status.dart';

// Your OrderStatus enum in order.

class CustomStepper extends StatefulWidget {
  final List<OrderStatus> steps=OrderStatus.values;
  final OrderStatus currentStatus;

  const CustomStepper({
    super.key,
    required this.currentStatus,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentStep = 0.0;

  @override
  void initState() {
    super.initState();
    // Animate from 0 up to current status index + 1 for smooth fill.
    int targetIndex = widget.currentStatus.index;
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: targetIndex.toDouble() + 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
          _currentStep = _animation.value;
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // A step is completed if its index is less than or equal to the current status index.
  bool _shouldShowCompleted(int index) {
    return index <= widget.currentStatus.index;
  }

  // Fixed title based on the OrderStatus.
  String _getStepTitle(OrderStatus status) {
    switch (status) {
      case OrderStatus.Packed:
        return "Packed";
      case OrderStatus.Shipped:
        return "Shipped";
      case OrderStatus.Delivered:
        return "Delivered";
      case OrderStatus.Paid:
        return "Paid";
      case OrderStatus.Approved:
        return "Approved";
      case OrderStatus.Cancelled:
        return "Cancelled";
    }
  }

  // Fixed description based on the OrderStatus.
  String _getStepDescription(OrderStatus status) {
    switch (status) {
      case OrderStatus.Packed:
        return "Your order has been packed.";
      case OrderStatus.Shipped:
        return "Your order is on its way.";
      case OrderStatus.Delivered:
        return "Your order has been delivered.";
      case OrderStatus.Paid:
        return "Payment has been confirmed.";
      case OrderStatus.Approved:
        return "Your order has been approved.";
      case OrderStatus.Cancelled:
        return "Your order was cancelled.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body:(widget.currentStatus==OrderStatus.Cancelled)?const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel, color: Colors.red, size: 80),
            SizedBox(height: 20),
            Text(
              "Your order was cancelled by the vendor.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ): ListView.builder(
        itemCount: widget.steps.length,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemBuilder:(context, index) {
          if(widget.steps[index]!=OrderStatus.Cancelled) {
            return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column: road connectors and step circle.
              Column(
                children: [
                  // Top Connector (if not the first step)
                  if (index > 0)
                    Container(
                      width: 2,
                      height: 20,
                      color: index <= _currentStep ? Colors.green : Colors.grey[300],
                    ),
                  // Step Circle
                  _buildStepCircle(index),
                  // Bottom Connector (if not the last step)
                  if (index < widget.steps.length - 1)
                    Container(
                      width: 2,
                      height: 40,
                      color: index < _currentStep ? Colors.green : Colors.grey[300],
                    ),
                ],
              ),
              const SizedBox(width: 12),
              // Right column: fixed title and description.
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getStepTitle(widget.steps[index]),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getStepDescription(widget.steps[index]),
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
          }
          return null;
        }
      ),
    );
  }

  Widget _buildStepCircle(int index) {
    final isReached = index < _currentStep;
    final isCompleted = _shouldShowCompleted(index);

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
          isCompleted ? Icons.check : Icons.circle_outlined,
          size: 16,
          color: isCompleted ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
