float x = 0;
float y = 0;

float spacing = 100;

void setup(){
  size(1000,1000);
  background(0);
}

void draw(){
 int[][]pattern = {
  {0,0,1}, {1,0,2}, {2,0,1}, {3,0,2}, {4,0,1}, {5,0,2}, {6,0,1}, {7,0,2}, {8,0,1}, {9,0,2},
  {0,1,0}, {1,1,3}, {2,1,0}, {3,1,3}, {4,1,0}, {5,1,3}, {6,1,0}, {7,1,3}, {8,1,0}, {9,1,3},
  {0,2,1}, {1,2,2}, {2,2,1}, {3,2,2}, {4,2,1}, {5,2,2}, {6,2,1}, {7,2,2}, {8,2,1}, {9,2,2},
  {0,3,0}, {1,3,3}, {2,3,0}, {3,3,3}, {4,3,0}, {5,3,3}, {6,3,0}, {7,3,3}, {8,3,0}, {9,3,3},
  {0,4,1}, {1,4,2}, {2,4,1}, {3,4,2}, {4,4,1}, {5,4,2}, {6,4,1}, {7,4,2}, {8,4,1}, {9,4,2},
  {0,5,0}, {1,5,3}, {2,5,0}, {3,5,3}, {4,5,0}, {5,5,3}, {6,5,0}, {7,5,3}, {8,5,0}, {9,5,3},
  {0,6,1}, {1,6,2}, {2,6,1}, {3,6,2}, {4,6,1}, {5,6,2}, {6,6,1}, {7,6,2}, {8,6,1}, {9,6,2},
  {0,7,0}, {1,7,3}, {2,7,0}, {3,7,3}, {4,7,0}, {5,7,3}, {6,7,0}, {7,7,3}, {8,7,0}, {9,7,3},
  {0,8,1}, {1,8,2}, {2,8,1}, {3,8,2}, {4,8,1}, {5,8,2}, {6,8,1}, {7,8,2}, {8,8,1}, {9,8,2},
  {0,9,0}, {1,9,3}, {2,9,0}, {3,9,3}, {4,9,0}, {5,9,3}, {6,9,0}, {7,9,3}, {8,9,0}, {9,9,3},
  };
  DrawGrid();
  for (int x = 0; x < pattern.length; x++) {
    int[] params = pattern[x];
    DrawTriangle(params[0], params[1], params[2]);
  }
}

void DrawGrid(){
    background(0);
    
  stroke(245);
  strokeWeight(1);
  
  x = 0;
  while(x < width){
    line(x, 0, x, height);
    x = x + spacing;
  }
  
  y = 0;
  while(y < height){
    line(0, y, width, y);
    y = y + spacing;
  }
}

void DrawTriangle(int cellX, int cellY, int orientation){
  if (orientation == -1){
    return;
  }
  float[][] vertices = {
    {0, 0}, 
    {0, spacing}, 
    {spacing, spacing},
    {spacing, 0},
  };
  float screenX = (float)cellX * spacing;
  float screenY = (float)cellY * spacing;
  
  int next = orientation;
  float[] v1 = vertices[next];
  next = (next + 1) % 4;
  float[] v2 = vertices[next];
  next = (next + 1) % 4;
  float[] v3 = vertices[next];
  pushMatrix();
  translate(screenX, screenY);
  triangle(v1[0], v1[1], v2[0], v2[1], v3[0], v3[1]); 
  popMatrix();
}    
