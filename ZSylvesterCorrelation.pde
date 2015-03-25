BufferedReader reader;
String line;
int currentYear = 2004;
int earlierX = 50;
int earlierY = 550;
int laterX = 550;
int laterY = 550;
int buttonSize = 10;
String maine[];
String newhamp[];
String mass[];
String vermont[];
String rhode[];
String conn[];
String meIncome;
String nhIncome;
String maIncome;
String vtIncome;
String riIncome;
String ctIncome;
String meTax;
String nhTax;
String maTax;
String vtTax;
String riTax;
String ctTax;
int meY;
int nhY;
int maY;
int vtY;
int riY;
int ctY;
int[] ranker = new int[5];
int rankIndex = 0;


void setup() {
  size(600,600);
  
  maine = loadStrings("maine.txt");
  newhamp = loadStrings("newhamp.txt");
  mass = loadStrings("mass.txt");
  vermont = loadStrings("vermont.txt");
  rhode = loadStrings("rhode.txt");
  conn = loadStrings("conn.txt");
  
 


}


void draw() {
  background(25);
  color(255);
  text("Viewing Year: " + currentYear, 250,580);
  fill(255,0,0);
  textSize(12);
  fill(200);
  rect(earlierX,earlierY, buttonSize,buttonSize);
  rect(laterX,laterY,buttonSize,buttonSize);
  meIncome = income(currentYear, maine);
  nhIncome = income(currentYear, newhamp);
  maIncome = income(currentYear, mass);
  vtIncome = income(currentYear, vermont);
  riIncome = income(currentYear, rhode);
  ctIncome = income(currentYear, conn);
  meTax = taxReturn(maine);
  nhTax = taxReturn(newhamp);
  maTax = taxReturn(mass);
  vtTax = taxReturn(vermont);
  riTax = taxReturn(rhode);
  ctTax = taxReturn(conn);
  meY = moveState(currentYear,maine);
  nhY = moveState(currentYear,newhamp);
  maY = moveState(currentYear,mass);
  vtY = moveState(currentYear,vermont);
  riY = moveState(currentYear,rhode);
  ctY = moveState(currentYear,conn);
  fill(255);
  text("Median Household Income | Income Tax (Lowest Bracket)", 250, 80);
  text("Maine: " + meIncome + " | " + meTax, 250, meY);
  text("New Hampshire: " + nhIncome + " | " + nhTax, 250, nhY);
  text("Massachusetts: " + maIncome + " | " + maTax, 250, maY);
  text("Vermont: " + vtIncome + " | " + vtTax, 250, vtY);
  text("Rhode Island: " + riIncome + " | " + riTax, 250, riY);
  text("Connecticut: " + ctIncome + " | " + ctTax, 250, ctY);
  fill(200,0,0);
  textSize(20);
  text("Median Household Income for New England States", 10, 13);
  text("Compared to Lowest Bracket Income Tax (2004 - 2011)", 10, 30);
  fill(255);
  textSize(12);
    
}

void mouseClicked() {
  if(mouseX >= earlierX && mouseX <= earlierX + buttonSize) {
    if(mouseY <= earlierY + buttonSize && mouseY >= earlierY) {
      earlier();
    }
  }
  if(mouseX >= laterX && mouseX <= laterX + buttonSize) {
    if(mouseY <= laterY + buttonSize && mouseY >= laterY) {
      later();
    }
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      earlier();
    }
    
    else if(keyCode == RIGHT) {
      later();
    }
  }
}

void earlier() {
  if(currentYear == 2004) {
    text("Cannot go any further back!",80,300);
  }
  else { 
    currentYear -= 1;
  }
}

void later() {
  if(currentYear == 2011) {
    text("Cannot go any farther forward!",100,300);
  }
  else {
    currentYear += 1;
  }
  
}

int arraySort(int year) {
  if(year == 2004) {
    return 1;
  } 
  else if(year == 2005) {
    return 2;
  } 
  else if(year == 2006) {
    return 3;
  } 
  else if(year == 2007) {
    return 4;
  } 
  else if(year == 2008) {
    return 5;
  }
  else if(year == 2009) {
    return 6;
  } 
  else if(year == 2010) {
    return 7;
  } 
  else if(year == 2011) {
    return 8;
  } 
  else {
    return 1;
  }
}

int moveState(int currentYear, String[] state) {
  int index = arraySort(currentYear);
  String[] stateholder = split(state[index],TAB);
  if(stateholder[2].equals("1")) {
    return 100;
  }
  else if(stateholder[2].equals("2")) {
    return 150;
  }
    else if(stateholder[2].equals("3")) {
    return 200;
  }
    else if(stateholder[2].equals("4")) {
    return 250;
  }
    else if(stateholder[2].equals("5")) {
    return 300;
  }
    else if(stateholder[2].equals("6")) {
    return 350;
  }
  else {
    return 0;
  }
}

String taxReturn(String[] state) {
  return state[0];
}

String income(int currentYear, String[] state) {
  String[] stateHolder;
  int index = arraySort(currentYear);
  stateHolder = split(state[index],TAB);
  return stateHolder[1];
}
