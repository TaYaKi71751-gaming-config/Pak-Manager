import 'package:flutter/material.dart';
import 'package:pak_manager/util/mod/ModList.dart';
import 'package:pak_manager/util/Process.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palworld Pak Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Palworld Pak Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _kill() async {
    await Task.kill('Palworld-Win64-Shipping.exe');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                    children: (ModList.all.map((mod) {
                  return Column(
                    children: [
                      Text(
                        mod.path!,
                        style: TextStyle(fontSize: 20),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            mod.status = !mod.status;
                          });
                        },
                        tooltip: mod.status ? 'Enabled' : 'Disabled',
                        child: Icon(mod.status ? Icons.check : Icons.close),
                      ),
                    ],
                  );
                })).toList()),
              ),
            );
          },
        ),
        floatingActionButton: Wrap(
          children: [
            FloatingActionButton(
              onPressed: _kill,
              tooltip: 'Kill',
              child: const Icon(Icons.close),
            ),
          ],
        ));
  }
}
