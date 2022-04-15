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
            pixels[getIndex(x,y)] = color(255); 
            pixels[getIndex(x + 1,y)] = color(0); 
            pixels[getIndex(x + 2,y)] = color(0); 
            pixels[getIndex(x,y + 1)] = color(255); 
            pixels[getIndex(x + 1,y + 1)] = color(255); 
            pixels[getIndex(x + 2,y + 1)] = color(0); 
            
            pixels[getIndex(x,y + 2)] = color(0); 
            pixels[getIndex(x + 1,y + 2)] = color(0); 
            pixels[getIndex(x + 2,y + 2)] = color(0); 
            
            pixels[getIndex(x,y + 3)] = color(0); 
            pixels[getIndex(x + 1,y + 3)] = color(255); 
            pixels[getIndex(x + 2,y + 3)] = color(0);  
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

float getMean(int x, int y) {
    //photo.loadPixels();
    int total = 0;
    for (int rX = 0;rX < xGridSize;rX++) {
        for (int rY = 0;rY < yGridSize;rY++) {
            
            try {
                total += pixels[getIndex(x + rX,y + rY)];
            } catch(ArrayIndexOutOfBoundsException e) {
                println(" x: " + x);
                println(" y: " + y);
                println(" rx: " + rX);
                println(" ry: " + rY);
            }
            
        
            
            // exit();
        }
    }
    float mean = ((float)total) / xGridSize * yGridSize;
    //photo.updatePixels();
    return mean;
}
