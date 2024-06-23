import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:GymBro/routes.dart';

Widget exerciseContainer(BuildContext context, String exercise, String path) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          context.go(path);
        },
        child: Container(
          width: 250,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    exercise,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
