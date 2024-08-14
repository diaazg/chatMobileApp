extension StringExtension on String{
    String getWord(int wordNumber){
      
     List<String> allWords = split(' ');
     if(allWords.length<wordNumber){
      return "check the index";
     }else{
      return allWords[wordNumber-1];
     }

  }
}