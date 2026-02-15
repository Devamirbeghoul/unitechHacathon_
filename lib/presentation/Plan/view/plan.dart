import 'package:flutter/material.dart';

class CreatePlanScreen extends StatelessWidget {
  const CreatePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Cover Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://i.pinimg.com/736x/4b/3a/a6/4b3aa6b47842e6ed3e0f1e4da152391c.jpg',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title + Add Friends Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Bali, Indonesia 🇮🇩',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // + Circle + Add Friends text
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Coming soon'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(Icons.add,
                                    color: Colors.white, size: 24),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Add your friends',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Day Cards Horizontal Scroll
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        dayCard(
                          'https://i.pinimg.com/736x/4b/3a/a6/4b3aa6b47842e6ed3e0f1e4da152391c.jpg',
                          'Day 1',
                        ),
                        const SizedBox(width: 16),
                        dayCard(
                          'https://i.pinimg.com/736x/4f/32/fa/4f32fa3df4808403ba401bc88f948461.jpg',
                          'Day 2',
                        ),
                        const SizedBox(width: 16),
                        dayCard(
                          'https://i.pinimg.com/736x/88/50/1e/88501e167ecb4bb56c786c63ed50e7e5.jpg',
                          'Day 3',
                        ),
                        const SizedBox(width: 16),
                        dayCard(
                          'https://i.pinimg.com/736x/92/b9/14/92b914356c42f7635185026574d21716.jpg',
                          'Day 4',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),

            // Back Button (bottom left)
            Positioned(
              bottom: 12,
              left: 16,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "Back",
                  style: TextStyle(color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget dayCard(String imageUrl, String dayLabel) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            imageUrl,
            height: 180,
            width: 140,
            fit: BoxFit.cover,
          ),
          Container(
            width: 140,
            color: Colors.deepPurpleAccent.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Text(
                dayLabel,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}