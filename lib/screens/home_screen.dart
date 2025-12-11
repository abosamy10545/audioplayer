import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 0;
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration postion = Duration.zero;
  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration dur) {
      duration = dur;
      setState(() {});
    });

    audioPlayer.onPositionChanged.listen((Duration pos) {
      postion = pos;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xff0c091c)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  Row(
                    children: [
                      Icon(Icons.lens, color: Color(0xff6b54f4), size: 11),
                      const SizedBox(width: 10),
                      Icon(Icons.lens, color: Colors.white, size: 10),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
              Spacer(),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 95, 88, 224),
                      blurRadius: 150,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff242165),
                        Color(0xff663ec8),
                        Color(0xff242165),
                        Color(0xff663ec8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage: AssetImage(
                      'assets/images/yasser_image.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Surah Al-Fatihah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.menu_open_outlined, color: Colors.white),
                        const SizedBox(width: 25),
                        Icon(Icons.favorite, color: Color(0xff5e57f2)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Yasir al-Dawsari',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Slider(
                padding: EdgeInsets.all(8.0),
                min: 0,
                max: duration.inSeconds.toDouble() > 0
                    ? duration.inSeconds.toDouble()
                    : 1,
                value: postion.inSeconds.toDouble().clamp(
                  0,
                  duration.inSeconds.toDouble() > 0
                      ? duration.inSeconds.toDouble()
                      : 1,
                ),
                onChanged: (val) {
                  audioPlayer.seek(Duration(seconds: val.toInt()));
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${postion.inMinutes}:${postion.inSeconds}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${duration.inMinutes}:${duration.inSeconds}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.shuffle, color: Colors.white),
                    Icon(Icons.skip_previous, color: Colors.white),
                    InkWell(
                      onTap: () {
                        isPlaying = !isPlaying;
                        setState(() {});
                        if (isPlaying) {
                          audioPlayer.play(
                            AssetSource('audios/surah_al_fatihah.mp3'),
                          );
                        } else {
                          audioPlayer.pause();
                        }
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xff5059f5),
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                          size: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.skip_next, color: Colors.white),
                    Icon(Icons.repeat_one, color: Colors.white),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
