extension StringExtension on String{
    String getWord(int wordNumber){
      
     List<String> allWords = split(' ');
     String concate = '${allWords[2]} ${allWords[3]}';
     allWords.replaceRange(2, 3, [concate]);
     allWords.removeAt(3);

     if(allWords.length<wordNumber){
      return "check the index";
     }else{
      return allWords[wordNumber];
     }

  }
}