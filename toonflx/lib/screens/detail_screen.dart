import 'package:flutter/material.dart';
import 'package:toonflx/models/webtoon_detail_model.dart';
import 'package:toonflx/models/webtoon_episode_model.dart';
import 'package:toonflx/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episoeds;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episoeds = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "[ ${snapshot.data!.genre} / ${snapshot.data!.age} ]",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }
              return const Text("...");
            },
          )
        ],
      ),
    );
  }
}
