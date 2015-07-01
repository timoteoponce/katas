

def fizzbuzz(top:Int){
  0 to top foreach{ i => 
    var toPrint = if(i % 3 == 0)  "Fizz" else ""
    toPrint = if(i % 5 == 0 ) s"${toPrint}Buzz" else toPrint
    
    if(!toPrint.isEmpty)
      println(s"$i -> $toPrint")
  }
}

fizzbuzz(100)
