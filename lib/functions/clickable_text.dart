import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {

  final String text; 

  const ClickableText({super.key, required this.text});  

  //Process the text: return sentences and all words
  Map<String, List<String>> splitText(String text) {
  // Splitting sentences
  RegExp sentencePattern = RegExp(r'(?<=[.!?])\s+(?=[A-Z])');
  List<String> sentences = text.split(sentencePattern);

  // Splitting words to include special characters
  // Using a range of Unicode characters to include accents and other non-standard characters.
  // This pattern matches sequences of one or more characters that are letters (including those with diacritics).
  RegExp wordPattern = RegExp(r'[A-Za-z\u00C0-\u00FF\u0100-\u017F\u0180-\u024F]+');
  List<String> words = wordPattern.allMatches(text).map((match) => match.group(0)!).toList();

  return {
    'sentences': sentences,
    'words': words,
  };
}


  @override
  Widget build(BuildContext context) {
    var result = splitText(text);
    //List<String> sentences = result['sentences']!;
    List<String> words = result['words']!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8.0,
              children: words.map((word) => InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:  Text(word),
                        content: Text('You clicked "$word"'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  word,
                  style: const TextStyle(color: Colors.black),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }



} //class ender

    
    

