function NumObj(obj){
   if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
    return true;
   } else {
   event.returnValue = false;
  } 
}
 

