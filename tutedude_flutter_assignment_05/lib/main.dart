import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double _heightCm = 170;
  double _weightKg = 65;

  double get _bmi => _weightKg / ((_heightCm / 100) * (_heightCm / 100));

  String get _category {
    final b = _bmi;
    if (b < 18.5) return 'Underweight';
    if (b < 25) return 'Normal';
    if (b < 30) return 'Overweight';
    return 'Obese';
  }

  String get _emoji {
    switch (_category) {
      case 'Underweight':
        return '😟';
      case 'Normal':
        return '🙂';
      case 'Overweight':
        return '😬';
      default:
        return '😵';
    }
  }

  List<Color> get _gradient {
    switch (_category) {
      case 'Underweight':
        return [Colors.blue.shade200, Colors.blue.shade400];
      case 'Normal':
        return [Colors.green.shade400, Colors.teal.shade500];
      case 'Overweight':
        return [Colors.orange.shade400, Colors.deepOrange.shade500];
      default:
        return [Colors.red.shade400, Colors.red.shade700];
    }
  }

  void _reset() {
    setState(() {
      _heightCm = 170;
      _weightKg = 65;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bmiText = _bmi.toStringAsFixed(1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reset),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              children: [
                Flexible(
                  child: _Card(
                    title: 'Height',
                    value: '${_heightCm.round()} cm',
                    child: Slider(
                      min: 100,
                      max: 220,
                      divisions: 120,
                      value: _heightCm,
                      label: _heightCm.round().toString(),
                      onChanged: (v) => setState(() => _heightCm = v),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Flexible(
                  // fit: FlexFit.loose,
                  child: _Card(
                    title: 'Weight',
                    value: '${_weightKg.round()} kg',
                    child: Slider(
                      min: 30,
                      max: 150,
                      divisions: 120,
                      value: _weightKg,
                      label: _weightKg.round().toString(),
                      onChanged: (v) => setState(() => _weightKg = v),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
            AnimatedContainer(
              width: (MediaQuery.of(context).size.width / 2) - 40,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: _gradient),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Your BMI',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, anim) =>
                          ScaleTransition(scale: anim, child: child),
                      child: Text(
                        bmiText,
                        key: ValueKey(bmiText),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$_emoji $_category',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _reset,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Reset'),
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String value;
  final Widget child;

  const _Card({required this.title, required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                Text(value, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
