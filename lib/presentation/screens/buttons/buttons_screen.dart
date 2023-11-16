import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: const Text('Elevated Button'), 
            ),
            const ElevatedButton(
              onPressed: null, 
              child: Text('Elevated disabled'), 
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.access_alarm_outlined),
              label: const Text('Elevated Icon'),
              onPressed: (){}, 
            ),
            FilledButton(
              onPressed: (){}, 
              child: const Text('Filled'),
            ),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.accessibility_new),
              label: const Text('Filled Button Icon'),
            ),
            OutlinedButton(
              onPressed:(){}, 
              child: const Text('Outlined Button'),
            ),
            OutlinedButton.icon(
              onPressed:(){}, 
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined Button Icon'),
            ),
            TextButton(onPressed: (){}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.terrain),
              label: const Text('Text Button Icon'),
            ),
            const CustomButton(),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_alarm),
            ),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_alarm),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor:const MaterialStatePropertyAll(Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: 
              Text('hola mundo', style: TextStyle(color: Colors.white)
            )
          ),
        ),
      ),
    );
  }
}