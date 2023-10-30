import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_models.dart';


class MyComponent{


  static Widget buildNews (BuildContext context , Articles models)=> InkWell(
    onTap: ()async{
      var myUrl = Uri.parse(models.url!);
        if (!await launchUrl(myUrl)) {
          throw Exception('Could not launch');
      }
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: models.urlToImage == null ? NetworkImage("https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg") : NetworkImage("${models.urlToImage}"),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10) , bottomRight: Radius.circular(10))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "${models.title}",
                      style: GoogleFonts.abel(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${models.author}",
                      style: GoogleFonts.abel(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${models.publishedAt}",
                    style: GoogleFonts.abel(
                        fontSize: 13, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );













  static void NavTo (BuildContext context, Widget screen)=> Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
}