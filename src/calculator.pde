
Button[] numButs = new Button[10]; 
Button[] charButs = new Button[16];
float s;
PShape del;
String ls, rs, nrs, nls, ers;
float ans;
char op, lOp, eop;
Boolean left, eq, dot, lper, rper, lneg, rneg;
int rx, ry, rw, rh;

void setup() {
  frameRate(1000);
  size(300, 420);
  s = 1.0;
  op = ' ';
  eop = ' ';
  left = true;
  eq = false;
  ls = "0";
  rs = "";
  nls = "";
  nrs = "";
  lOp = ' ';
  ans = 0.0;
  dot = false;
  lper = false;
  rper = false;
  ers = "";
  lneg = false;
  rneg = false;
}

void draw() {

  background(0);
  drawingButtons();
  updateDisplay();
  stroke(255);
  textAlign(LEFT);

  noStroke();
  for (int i = 0; i< numButs.length; i++) {
    numButs[i].over();
    numButs[i].display();
  }
  for (int i = 0; i< charButs.length; i++) {
    charButs[i].over();
    charButs[i].display();
  }
  fill(255);
  rect(10, 10, 13, 20);
  makeDelete();
}


void updateDisplay() {
  textAlign(RIGHT);
  if (eq) {
    text(ans, 285, 100);
  } else {
    if (rs == str(round(float(rs)))||ls == str(round(float(ls)))) {
      dot = false;
    }
    if (left) {

      if (float(ls) != ans) {
        nrs = "";
        lOp = ' ';
        nls = ls;
      }
      if (ls.length()< 20) {
        textSize(20);
      } else if (ls.length() < 26) {
        textSize(15);
      } else if (ls.length() < 50) {
        textSize(7);
      } else {
        if (float(ls)>1) {
          ls = "Infinity";
        } else {
          ls = "0";
        }
      }
      if (ls == "") {
        text(0, 285, 100);
      } else {
        text(ls, 285, 100);
      }
    } else {
      if (rs.length()< 20) {
        textSize(20);
      } else if (rs.length() < 26) {
        textSize(15);
      } else if (rs.length() < 50) {
        textSize(7);
      } else {
        if (float(rs)>1) {
          rs = "Infinity";
        } else {
          rs = "0";
        }
      }
      if (rs != "" ) {
        text(rs, 285, 100);
      } else {
        if (ls.length()< 20) {
          textSize(20);
        } else if (ls.length() < 26) {
          textSize(15);
        } else if (ls.length() < 50) {
          textSize(7);
        } else {
          if (float(ls)>1) {
            ls = "Infinity";
          } else {
            ls = "0";
          }
        }

        text(ls, 285, 100);
      }
    }

    if (ls == "" && op != ' ') {
      ls = "0";
    }
    if (nls.length()+nrs.length() < 26)//
    {
      textSize(15);
    } else if (nls.length()+nrs.length() < 31) {
      textSize(12);
    } else if (nls.length()+nrs.length() < 70) {
      textSize(7);
    }
    text(nls+lOp+nrs, 285, 50);
  }
}
void keyReleased(){
  
  
}
void mouseReleased() {
  for (int i = 0; i< numButs.length; i++) {
    if (numButs[i].hov && left) {
      if (ls == "Infinity") {
        ls = "" ;
      }
      if (ls == "-0"|| ls == "-") {
        ls = "-" + numButs[i].v;
      } else {
        if (ls.equals("0")) {
          ls="";
          ls += numButs[i].v;
        } else 
        {
          ls += numButs[i].v;
        }
      }
    } else if (numButs[i].on && !left) {
      if (rs == "Infinity") {
        rs = "" ;
      }
      if (rs.equals("0")) {
        rs="";
        rs += numButs[i].v;
      } else 
      {
        rs += numButs[i].v;
      }
      nrs = rs;
    }
  }
  for (int i = 0; i< charButs.length; i++) {
    if (charButs[i].hov && charButs[i].o == '+' ) {
      if (op == ' ') {
        nrs = "";
      } 
      op = charButs[i].o;
      lOp = charButs[i].o;
      left = false;
      if (ls == "") {
        ls = "0";
        nls = "0";
      }
      nls = ls;
    } else if (charButs[i].hov && charButs[i].o == '-' ) {
      if (op == ' ') {       
        nrs = "";
      }
      op = charButs[i].o;
      lOp = charButs[i].o;
      left = false;      
      if (ls == "") {        
        ls = "0";        
        nls = "0";
      }

      nls = ls;
    } else if (charButs[i].hov && charButs[i].o == '/' ) {
      if (op == ' ') {       
        nrs = "";
      }
      op = charButs[i].o;
      lOp = charButs[i].o;
      left = false;      
      if (ls == "") {        
        ls = "0";        
        nls = "0";
      }

      nls = ls;
    } else if (charButs[i].hov && charButs[i].o == '*' ) {
      if (op == ' ') {       
        nrs = "";
      }
      op = charButs[i].o;
      lOp = charButs[i].o;
      left = false;      
      if (ls == "") {        
        ls = "0";        
        nls = "0";
      }

      nls = ls;
    } else if (charButs[i].hov && charButs[i].o == '%' ) {
      if (left == true) {
        rs = "";
        nrs = "";
        nls = ls;
        lOp = ' ';
        if (ls == "") {
          ls = "0";
          nls = "0";
        }
        if (lper == false) {  
          ans = float(ls)*(100);
          nls = "%"+ls;
          if (round(ans) == ans ) {
            dot = false;
            ls = str(round(ans));
          } else {
            ls = str((float)ans);
          }

          left = true;
          lper = true;
        } else if (lper == true) {
          ans = float(ls)/(100);
          lOp = charButs[i].o;
          if (round(ans) == ans ) {
            dot = false;
            ls = str(round(ans));
          } else {
            ls = str((float)ans);
          }
          left = true;

          lper = false;
        }
      } else if (left == false) { 
        if (rs == "") {
          rs = "0";
          nrs = rs;
        }
        if (rper == false) {
          rper = true;
          nrs = "%"+rs;
          rs = str(float(rs)*(100));
          if (round(float(rs)) == float(rs)) {
            dot = false;
            rs = str(round(float(rs)));
          } 
          rper = true;
        } else if (rper == true) {
          nrs = rs+"%";
          rs = str(float(rs)/(100));
          if (round(float(rs)) == float(rs)) {
            dot = false;
            rs = str(round(float(rs)));
          }
          rper = false;
        }
      }
    } else if (charButs[i].hov && charButs[i].o == '^' ) {
      if (op == ' ') {       
        nrs = "";
      }
      op = charButs[i].o;
      lOp = charButs[i].o;
      left = false;      
      if (ls == "") {        
        ls = "0";        
        nls = "0";
      }
      nls = ls;
    } else if (charButs[i].hov && charButs[i].o == 'f' ) {
      if (left == true) {
        if (ls == "") {
          ls = "0";
          nls = "0";
        }
        rs = "";
        nrs = "";
        lOp = ' ';
        nls = "1/"+ls;
        if (ls == "Infinity")
        {
          ls = "Infinity";
        } else {
          ans = 1/float(ls);
          if (round(ans) == ans ) {
            dot = false;
            ls = str(round(ans));
          } else {
            ls = str((float)ans);
          }
        }
        left = true;
      } else if (left == false) {
        if (rs == "") {
          rs = "0";
          nrs = rs;
        }
        if (rs == "0") {
          nrs = "Infinity";
        }

        nrs = "(1/"+rs+")";
        if (rs == "Infinity")
        {
          rs = "Infinity";
        } else {
          rs = str(1/float(rs));
        }
        left = false;
      }
    } else if (charButs[i].hov && charButs[i].o == '±' ) {
      if (left == true) {
        if (ls == "") {
          ls = "0";
          nls = "0";
        }
        rs = "";
        nrs = "";
        nls = "±"+ls;
        ans = float(ls)*(-1);
        lOp = ' ';
        if (op == ' ') {       
          nrs = "";
        }
        if (round(ans) == ans ) {
          dot = false;
          ls = str(round(ans));
        } else {
          ls = str((float)ans);
        }
        left = true;
      } else if (left == false) {
        if (rs == "") {
          rs = "0";
        }
        nrs = "±"+rs; 
        rs = str(float(rs)*(-1));
        left = false;
      }
    } else if (charButs[i].hov && charButs[i].o == 'π' ) {
      if (left == true) {
        rs = "";
        nrs = "";
        lOp = ' ';
        if (ls == "0") {               /// get help with 0pi
          ls = str(PI);
          nls = "π";
        } else {
          nls = ls + "π";
          ls = str(float(ls)*PI);//
        }
        if (op == ' ') {       
          nrs = "";
        }
        dot = true;
        left = true;
      } else if (left == false) {
        if (rs == "0") {
          rs = str(PI);
          nrs = "π";
        } else {
          nrs = rs + "π"; 
          rs = str(float(rs)*(PI));
          left = false;
          dot = true;
        }
      }
    } else if (charButs[i].hov && charButs[i].o == '.' ) {
      if (left && !dot) {
        nls = ls;
        if (op == ' ') {       
          nrs = "";
        }
        ls = ls + ".";
        dot = true;
      } else if (!left && !dot) {
        if (rs == "") {
          rs = "0";
        }
        rs = rs + ".";
        dot = true;
      }
    } else if (charButs[i].hov && charButs[i].o == 'c' ) {
      pclear();
    } else if (charButs[i].hov && charButs[i].o == 'w' ) {
      if (s == 1.0) {
        s=1.25;
      } else if (s == 1.25) {
        s=1.0;
      }
    } else if (charButs[i].hov && charButs[i].o == 'd' ) {
      if (ls.length() < 1) {
        ls = "0";
      }
      if (left) {

        ls = ls.substring(0, ls.length()-1);
        nls = ls;
        if (ls.length() < 1) {
          ls = "0";
        }
      } else if (rs.length() < 1) {
        op = ' ';
        lOp = op;
        left = true;
      } else if (!left) {
        rs = rs.substring(0, rs.length()-1);
        nrs = rs;
      }
    } else if (charButs[i].hov && charButs[i].o == '=' ) {
      if (op != ' ' && rs=="" ) {
        rs = ls;
        nrs = ls;
      }
      if (rs == "" && op == ' ')
      {
        op = eop;
        lOp = eop;
        rs = ers;
        nrs = ers;
        nls = ls;
      }
      eq = true;
      solve();
    }
  }
}

void pclear() {
  op = ' ';
  ans = 0.0;
  left = true;
  eq = false;
  ls = "0";
  rs = "";
  lOp = ' ';
  nrs = "";
  nls = "";
  dot = false;
  rper = false;
  lper = false;
  ers = "";
    lneg = false;
  rneg = false;
}

void solve () {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    if (round(ans) == ans ) {
      dot = false;
      ls = str(round(ans));
    } else {
      ls = str((float)ans);
    }
    left = true;
    break;
  case '-': 
    ans = (float(ls)-float(rs));
    if (round(ans) == ans ) {
      dot = false;
      ls = str(round(ans));
    } else {
      ls = str((float)ans);
    }
    left = true;
    break;
  case '*': 
    ans = float(ls)*float(rs);
    if (round(ans) == ans ) {
      dot = false;
      ls = str(round(ans));
    } else {
      ls = str((float)ans);
    }
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    if (round(ans) == ans ) {
      dot = false;
      ls = str(round(ans));
    } else {
      ls = str((float)ans);
    }
    left = true;
    break;
  case '^': 
    ans = pow(float(ls), float(rs));
    if (round(ans) == ans ) {
      dot = false;
      ls = str(round(ans));
    } else {
      ls = str((float)ans);
    }
    left = true;
    break;
  }

  nrs = rs;
  ers = rs;
  eop = op;
  op = ' ';
  rs = "";
  eq = false;
}
void drawingButtons() {
  numButs[0] = new Button(0, 360, 59, 60, "0", 50, 100, 10).asNumber(0);
  numButs[1] = new Button(0, 300, 59, 59, "1", 50, 100, 10).asNumber(1);
  numButs[2] = new Button(60, 300, 59, 59, "2", 50, 100, 10).asNumber(2);
  numButs[3] = new Button(120, 300, 59, 59, "3", 50, 100, 10).asNumber(3);
  numButs[4] = new Button(0, 240, 59, 59, "4", 50, 100, 10).asNumber(4);
  numButs[5] = new Button(60, 240, 59, 59, "5", 50, 100, 10).asNumber(5);
  numButs[6] = new Button(120, 240, 59, 59, "6", 50, 100, 10).asNumber(6);
  numButs[7] = new Button(0, 180, 59, 59, "7", 50, 100, 10).asNumber(7);
  numButs[8] = new Button(60, 180, 59, 59, "8", 50, 100, 10).asNumber(8);
  numButs[9] = new Button(120, 180, 59, 59, "9", 50, 100, 10).asNumber(9);


  charButs[0] = new Button(0, 120, 59, 59, "c", 50, 100, 10).asOperator('c');
  charButs[1] = new Button(60, 120, 59, 59, "±", 50, 100, 10).asOperator('±');
  charButs[2] = new Button(120, 120, 59, 59, "%", 50, 100, 10).asOperator('%');
  charButs[3] = new Button(180, 120, 59, 59, "x", 50, 100, 10).asOperator('*');
  charButs[4] = new Button(240, 120, 60, 59, "1/x", 50, 100, 10).asOperator('f');
  charButs[5] = new Button(60, 360, 59, 60, ".", 50, 100, 10).asOperator('.');
  charButs[6] = new Button(180, 180, 59, 59, "÷", 50, 100, 10).asOperator('/');
  charButs[7] = new Button(180, 240, 59, 59, "-", 50, 100, 10).asOperator('-');
  charButs[8] = new Button(180, 300, 59, 59, "+", 50, 100, 10).asOperator('+');
  charButs[9] = new Button(240, 360, 60, 60, "", 50, 100, 10).asOperator('1');
  charButs[10] = new Button(240, 180, 60, 59, "^", 50, 100, 10).asOperator('^');
  charButs[11] = new Button(240, 240, 60, 59, "π", 50, 100, 10).asOperator('π');
  charButs[12] = new Button(240, 300, 60, 59, "", 50, 100, 10).asOperator('4');
  charButs[13] = new Button(120, 360, 119, 60, "=", 50, 100, 10).asOperator('=');
  charButs[14] = new Button(0, 10, 23, 20, "", 0, 0, 0).asOperator('w');
  charButs[15] = new Button(0, 86, 31, 14, "", 0, 0, 0).asOperator('d');
}


void makeDelete() {
  del = createShape();
  del.beginShape();
  del.fill(255);
  del.noStroke();
  del.vertex(0, 7);
  del.vertex(7, 0);
  del.vertex(21, 0);
  del.vertex(21, 14);
  del.vertex(7, 14);
  del.endShape(CLOSE);
  shape(del, 10, 86);
  textAlign(CENTER);
  fill(0);
  text("x", 23.5, 96.5);
  fill(255);
}
