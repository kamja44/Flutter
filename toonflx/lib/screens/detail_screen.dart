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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "[ ${snapshot.data!.genre} / ${snapshot.data!.age} ]",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                }
                return const Text("...");
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: episoeds,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: episodeList(snapshot),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  ListView episodeList(AsyncSnapshot<List<WebtoonEpisodeModel>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var episode = snapshot.data![index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  episode.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: snapshot.data!.length,
    );
  }
}
