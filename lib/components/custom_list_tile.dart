import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String name;
  final String country;
  final bool status;
  final void Function()? onTap;

  const CustomListTile({
    Key? key,
    required this.name,
    required this.country,
    required this.status,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(08)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      country,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(Radius.circular(08))),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      status ? 'Nice! 😃' : 'Naughty! 😈',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
