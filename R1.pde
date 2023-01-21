ArrayList ball = new ArrayList();

int MaxColor;
float GRAVITY = 0.98;    // 重力
float FRICTION = 1;  // 減衰率

float X, Y;            // 物体の座標
float Spx, Spy;        // 物体の速度
int Radius = 30;        // 半径

float x=0;    //rectの位置
float y=400;

int count=0;
int shape=0;
int clear=1000;

void setup() {
  size(800, 800);
  MaxColor = width;
  colorMode(HSB, MaxColor); // HSB表色系(レンジはウィンドウ幅)
  background(MaxColor-1);   // 背景を白にする
  frameRate(15);            // フレームレートは15fps
  
  X = width / 2;
  Y = 10;
  Spx = random(-5, 5);
  Spy = -10;
}




void draw() {
    background(MaxColor-1);
  
  // 描画処理  
  noStroke();
  for(int i = 0 ; i < ball.size(); i++){
    Ball b = (Ball)ball.get(i);
    b.draw();
  }

}

void keyPressed() {
    if (key == CODED) {            // コード化されているキーが押された
        if (keyCode == DOWN) {        // キーコードを判定
             clear=clear-10;
             if(clear<0){
                 clear=0;
             }
        } else if (keyCode == UP) {
             clear=clear+10;
             if(clear>1000){
                 clear=1000;
             }
        }
    }
}


void mousePressed() 
{
    if( mouseButton == LEFT ){
        ball.add(new Ball());
    } 
    
    else if( mouseButton == RIGHT ){
        if(shape==0){
           shape=1;
       }
       else if(shape==1)
       {
           shape=2;
       }
       else if(shape==2){
           shape=3;
       }
       else if(shape==3)
       {
           shape=0;
       }
   }
}



class Ball{
  
  float X = mouseX;
  float Y = mouseY;
  
  float Spx = random(-5,5);
  float Spy = -10;
  
  float R=random(5,70);


  
  void draw(){

      if(shape==0){
          fill(Y, MaxColor*0.5, MaxColor-1,clear);
          ellipse(X,Y,R,R);
          
          Spy += GRAVITY;
          X += Spx;
          Y += Spy;
          
          float bounceMinX = Radius;
          float bounceMaxX = width - Radius;
          float bounceMinY = Radius;
          float bounceMaxY = height - Radius;
          
          if((X<bounceMinX) || (bounceMaxX<X)){
              Spx = -Spx * FRICTION;
              if (abs(Spx) < 1) Spx = 0; //速度が小さくなったら止める
              if (X < bounceMinX) X = bounceMinX * 2 - X;
              if (X > bounceMaxX) X = bounceMaxX * 2 - X;
          }
          if((Y<bounceMinY) || (bounceMaxY<Y)){
              Spy = -Spy * FRICTION;
              if (abs(Spy) < 1) Spy = 0;
              if (Y < bounceMinY) Y = bounceMinY * 2 - Y;
              if (Y > bounceMaxY) Y = bounceMaxY * 2 - Y;
          }
      }
      
      else if(shape==1){
          fill(Y, MaxColor*0.5, MaxColor-1,clear);
          rect(X,Y,R,R);
          
          Spy += GRAVITY;
          X += Spx;
          Y += Spy;
    
    float bounceMinX = Radius;
          float bounceMaxX = width - Radius;
          float bounceMinY = Radius;
          float bounceMaxY = height - Radius;
          
          if((X<bounceMinX) || (bounceMaxX<X)){
              Spx = -Spx * FRICTION;
              if (abs(Spx) < 1) Spx = 0; //速度が小さくなったら止める
              if (X < bounceMinX) X = bounceMinX * 2 - X;
              if (X > bounceMaxX) X = bounceMaxX * 2 - X;
          }
          if((Y<bounceMinY) || (bounceMaxY<Y)){
              Spy = -Spy * FRICTION;
              if (abs(Spy) < 1) Spy = 0;
              if (Y < bounceMinY) Y = bounceMinY * 2 - Y;
              if (Y > bounceMaxY) Y = bounceMaxY * 2 - Y;
          }
      }
      
      else if(shape==2){
          fill(Y, MaxColor*0.5, MaxColor-1,clear);
          triangle(X,Y,X-R,Y+R,X+R,Y+R);
          
          Spy += GRAVITY;
          X += Spx;
          Y += Spy;
          
          float bounceMinX = Radius;
          float bounceMaxX = width - Radius;
          float bounceMinY = Radius;
          float bounceMaxY = height - Radius;
          
          if((X<bounceMinX) || (bounceMaxX<X)){
              Spx = -Spx * FRICTION;
              if (abs(Spx) < 1) Spx = 0; //速度が小さくなったら止める
              if (X < bounceMinX) X = bounceMinX * 2 - X;
              if (X > bounceMaxX) X = bounceMaxX * 2 - X;
          }
          if((Y<bounceMinY) || (bounceMaxY<Y)){
              Spy = -Spy * FRICTION;
              if (abs(Spy) < 1) Spy = 0;
              if (Y < bounceMinY) Y = bounceMinY * 2 - Y;
              if (Y > bounceMaxY) Y = bounceMaxY * 2 - Y;
          }
      }
      else if(shape==3){
          fill(Y, MaxColor*0.5, MaxColor-1,clear);
          strokeJoin(ROUND); //線のつなぎ目について設定
          drawMoon(X, Y, R);  // 横の位置、縦の位置、大きさ調整用変数
          
          Spy += GRAVITY;
          X += Spx;
          Y += Spy;
          
          float bounceMinX = Radius;
          float bounceMaxX = width - Radius;
          float bounceMinY = Radius;
          float bounceMaxY = height - Radius;
          
          if((X<bounceMinX) || (bounceMaxX<X)){
              Spx = -Spx * FRICTION;
              if (abs(Spx) < 1) Spx = 0; //速度が小さくなったら止める
              if (X < bounceMinX) X = bounceMinX * 2 - X;
              if (X > bounceMaxX) X = bounceMaxX * 2 - X;
          }
          if((Y<bounceMinY) || (bounceMaxY<Y)){
              Spy = -Spy * FRICTION;
              if (abs(Spy) < 1) Spy = 0;
              if (Y < bounceMinY) Y = bounceMinY * 2 - Y;
              if (Y > bounceMaxY) Y = bounceMaxY * 2 - Y;
          }
      }
  }
}

void drawMoon(float x, float y, float size) {
    ellipse(x,y,size,size);
    fill(MaxColor-1);
    ellipse(x-size/5,y-size/5,size,size);
}
