import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Navigator.pushNamed(context, '/todo');
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/to-do-list.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'T O D O',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'nachos',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'roses',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'dessert',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'letters',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {},
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(150),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'oranges',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
