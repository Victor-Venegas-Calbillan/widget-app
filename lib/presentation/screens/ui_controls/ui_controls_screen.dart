import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevelopre = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLauch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Enable developer mode'),
            value: isDevelopre,
            onChanged: (value) => setState(() {
                  isDevelopre = !isDevelopre;
                })),
        ExpansionTile(
          title: const Text('Vehiculos de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('viaje en auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('viaje en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('viaje en avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('viaje en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          subtitle: const Text('Do you want breakfast?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Lauch'),
          subtitle: const Text('Do you want Launch?'),
          value: wantsLauch,
          onChanged: (value) => setState(() {
            wantsLauch = !wantsLauch;
          }),
        ),
        CheckboxListTile(
          title: const Text('dinner'),
          subtitle: const Text('Do you want dinne?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
