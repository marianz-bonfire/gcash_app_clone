import 'package:flutter/material.dart';

class ServiceImageButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const ServiceImageButton({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Column(
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
