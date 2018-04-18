


class Button {
  int  y, h, c, cON, hc, tHc,v;
  boolean on, hov, num, siz;
  String text;
  char o; 
  float w, x;
  
  Button(float x, int y, float w, int h, String text, int c, int cON, int tHc)
  {
    this.x = x*s;
    this.y = y;
    this.w = w*s;
    this.h = h;
    this.c = c;
    this.cON = cON;
    this.text = text;
    this.tHc = tHc;
  }
  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }
  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }



  void display() {

    if (mousePressed && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      on = true;
    } else {
      on = false;
    }
    if (hov == true) {
      hc = tHc;
    } else {
      hc =0;
    }

    stroke(0);
    if (on) {
      fill(color(cON+hc));
    } else {
      fill(color(c+hc));
    }
    noStroke();
    rect(x, y, w, h);
    fill(255);
    textSize(14);
    textAlign(CENTER);
if( w== 59*s || w== 60*s){
    text(text, x+30*s, y+34);
}
else{
text(text, x+60*s, y+34);}
  }



  void over() {
    if ( mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      hov = true;
    } else {
      hov = false;
    }
  }
} 