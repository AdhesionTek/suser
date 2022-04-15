int xGridSize = 3;
int yGridSize = 4;
PImage photo;
void setup() {
    size(720,720);
    photo = loadImage("c.png");
    
    println(photo.height);
    image(photo, 0,0);
    loadPixels();
    for (int x = 0; x < photo.width - xGridSize; x += xGridSize) {
        for (int y = 0; y < photo.height - yGridSize;y += yGridSize) {
            // try{
            //println(y);
            if(y>720){
                exit();
            }
            //int mean = (int)getMean(x,y);
            int[] mmm = getMeanMaxAndMin(x,y);
            int max = mmm[1];
            int min = mmm[2];
            pixels[getIndex(x,y)] = color(max); 
            pixels[getIndex(x + 1,y)] = color(min); 
            pixels[getIndex(x + 2,y)] = color(min); 

            pixels[getIndex(x,y + 1)] = color(max); 
            pixels[getIndex(x + 1,y + 1)] = color(max); 
            pixels[getIndex(x + 2,y + 1)] = color(min); 
            
            pixels[getIndex(x,y + 2)] = color(min); 
            pixels[getIndex(x + 1,y + 2)] = color(min); 
            pixels[getIndex(x + 2,y + 2)] = color(min); 
            
            pixels[getIndex(x,y + 3)] = color(min); 
            pixels[getIndex(x + 1,y + 3)] = color(max); 
            pixels[getIndex(x + 2,y + 3)] = color(min);  
        // }
            
            // catch (ArrayIndexOutOfBoundsException e) {
            //     //print("Oh");
            //     println("Pos: "+x+" | "+y);
        // }
        }
    }
    updatePixels();
    //print(photo.height);
    //image(photo, 0,0);
    saveFrame("output.png");
}

void draw() {
    //image(photo, 0,0);
}

int getIndex(int x, int y) {
    return x + (y * photo.width);
}

int[] getMeanMaxAndMin(int x, int y) {
    //photo.loadPixels();
    int total = 0;

    int max = 0;
    int min = color(255);
    for (int rX = 0;rX < xGridSize;rX++) {
        for (int rY = 0;rY < yGridSize;rY++) {
            
            try {
                int currentPixel = pixels[getIndex(x + rX,y + rY)];
                total += currentPixel;
                if(currentPixel>max){
                    max = currentPixel;
                }
                if(currentPixel<min){
                    min=currentPixel;
                }
            } catch(ArrayIndexOutOfBoundsException e) {
                println(" x: " + x);
                println(" y: " + y);
                println(" rx: " + rX);
                println(" ry: " + rY);
            }
            
        
            
            // exit();
        }
    }
    int mean = (int)(((float)total) / xGridSize * yGridSize);
    int[] output = new int[]{mean,max,min};
    //photo.updatePixels();
    return output;
}
