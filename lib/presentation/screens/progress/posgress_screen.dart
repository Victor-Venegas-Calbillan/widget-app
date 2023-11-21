import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text('CircularProgressIndicator'),
            const SizedBox(height: 10),
            CircularProgressIndicator(
                strokeWidth: 3, backgroundColor: colors.primaryContainer),
            const SizedBox(height: 30),
            const Text('Circular y linear controlado'),
            const SizedBox(height: 10),
            const _ControllerProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.black12,
              )),
            ],
          ),
        );
      },
    );
  }
}
