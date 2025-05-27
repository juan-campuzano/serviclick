import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: const Placeholder(
              fallbackHeight: 100,
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Interior Design Consultation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text(
            'Get expert advice on transforming your living space with our interior design consultation service. We\'ll help you create a home that reflects your style and meets your needs.',
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 24),

          const SectionTitle('About the Service Provider'),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: Text('S'),
            ),
            title: Text('Sophia Carter'),
            subtitle: Text('5 years of experience'),
          ),

          const SectionTitle('Pricing'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.attach_money),
            ),
            title: const Text('Consultation Fee'),
            subtitle: const Text('Starting from \$150'),
          ),

          const SectionTitle('Reviews'),
          const Text(
            '4.8',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const Text('125 reviews'),
          const SizedBox(height: 12),

          // Rating Bars (mocked)
          ratingBar(5, 0.7),
          ratingBar(4, 0.2),
          ratingBar(3, 0.05),
          ratingBar(2, 0.03),
          ratingBar(1, 0.02),
          const SizedBox(height: 24),

          // Review 1
          reviewTile(
            name: 'Olivia Bennett',
            timeAgo: '2 weeks ago',
            rating: 5,
            comment:
                'Sophia was fantastic! She provided great insights and helped me visualize my dream home. Highly recommend!',
            likes: 15,
            replies: 2,
          ),

          // Review 2
          reviewTile(
            name: 'Ethan Harper',
            timeAgo: '1 month ago',
            rating: 4,
            comment:
                'The consultation was helpful, but I felt it could have included more layout options.',
            likes: 8,
            replies: 1,
          ),
        ],
      ),
    );
  }

  Widget ratingBar(int stars, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$stars'),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(width: 8),
          Text('${(percent * 100).round()}%'),
        ],
      ),
    );
  }

  Widget reviewTile({
    required String name,
    required String timeAgo,
    required int rating,
    required String comment,
    required int likes,
    required int replies,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              child: Text('J'),
            ),
            title: Text(name),
            subtitle: Text(timeAgo),
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(comment),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.thumb_up_alt_outlined,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$likes'),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$replies'),
            ],
          )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
