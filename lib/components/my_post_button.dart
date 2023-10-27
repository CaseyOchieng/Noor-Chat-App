import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;
  const PostButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Icon(
            Icons.done,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
