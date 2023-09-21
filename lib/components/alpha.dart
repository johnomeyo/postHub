import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  const Post(
      {super.key,
      required this.caption,
      required this.imageUrl,
      required this.likes});
  final String caption;
  final String imageUrl;
  final String likes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey.shade600,),borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    
                    child: ClipOval(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1635&q=80",
                        height: 40,width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "@astropphel",
                    style: GoogleFonts.lato(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                caption,
                style: GoogleFonts.lato(fontSize: 15),
              ),
              const SizedBox(height: 10),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              //like or comment section
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        likes,
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_outlined)),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.comment_outlined))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
