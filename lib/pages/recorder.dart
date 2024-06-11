import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RecorderPage extends StatefulWidget {
  const RecorderPage({super.key});

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  bool isRecording = false;
  bool recorded = false;

  Widget isNotRecordingContent() {
    return Center(
      child: IconButton(
        icon: Icon(isRecording ? Icons.mic : Icons.mic_none, size: 92),
        onPressed: () {
          setState(() {
            isRecording = !isRecording;

            if (!isRecording) {
              recorded = true;
            }
          });
        },
        autofocus: true,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24),
        ),
      ),
    );
  }

  Widget isRecordedContent() {
    return VBox(
      children: [
        const Text('Enregistrement terminé !'),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            setState(() {
              recorded = false;
            });
          },
          child: const Text('Recommencer'),
        ),

        VBox(
          children: [
            const Text('Durée: 2.1 secondes'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),


        OutlinedButton(
          onPressed: () {
            // TODO
          },
          child: const Text('Envoyer'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VBox(
          children: [
            if (!recorded)
              isNotRecordingContent(),
            
            if (!recorded && isRecording)
              const Text('Enregistrement en cours...'),
            
            if (recorded)
              isRecordedContent()
          ],
        )
      )
    );
  }
}