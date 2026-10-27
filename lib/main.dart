import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLearnApp());
}

class FlutterLearnApp extends StatelessWidget {
  const FlutterLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apprendre Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon premier compteur'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tu as appuyé sur le bouton :',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '$_count',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 12),
              const Text(
                'Essaie le bouton +, puis remets le compteur à zéro.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Réinitialiser'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Incrémenter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
