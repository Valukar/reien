import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class QuizNouns extends StatelessWidget {
  const QuizNouns({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[700],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: "Volver",
          ),
          title: const Text("Reien"),
        ),
        body: Material(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 450),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'Pregunta 1',
                        style: TextStyle(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.indigo.shade100, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              leading: Text('${index + 1}'),
                              title: const Text('Respuesta'),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[700],
                      ),
                      onPressed: () async {
                        final img =
                            await rootBundle.load('images/congratulations.png');
                        final bufferImg = img.buffer;
                        Share.shareXFiles(
                          [
                            XFile.fromData(
                              bufferImg.asUint8List(
                                img.offsetInBytes,
                                img.lengthInBytes,
                              ),
                              name: 'Congratulations!',
                              mimeType: 'image/png',
                            ),
                          ],
                          subject: 'Reien Quiz Results',
                        );
                      },
                      child: const Text("Share results"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}