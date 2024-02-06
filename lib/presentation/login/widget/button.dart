import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_color.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.onClick, required this.buttonText});

  final Function() onClick;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TTNFlixSpacing.spacing10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient:  const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Colors.red,
              Colors.redAccent,
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
                const Size(50, 24)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.only(
              top: TTNFlixSpacing.spacing10,
              bottom: TTNFlixSpacing.spacing10,
            ),
            child: Text(buttonText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}