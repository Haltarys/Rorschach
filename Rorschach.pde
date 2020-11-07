// Processing default function
void settings() {
    String os = System.getProperty("os.name");

    if (os.contains("Windows")) {
        size(SIDE, SIDE, P2D);
    } else {
        size(SIDE, SIDE);
    }
}

// Processing default function
void setup() {
    frameRate(FR);
    generateBlots();
}

// Processing default function
void draw() {
    background(255);

    for (int i = 0; i < NB_BLOTS; i++)
        inkBlots[i].move();
    for (int i = 0; i < NB_BLOTS; i++)
        inkBlots[i].draw();
    filter(THRESHOLD, THRES);

    if (GIF_IS_RECORDING) {
        if (counter >= GIF_FRAMES) {
            exit();
        }
        saveFrame("frames/frame-####.jpg");
        counter++;
    }
}

void generateBlots() {
    for (int i = 0; i < NB_BLOTS; i++)
        inkBlots[i] = new InkBlot();
}

InkBlot[] inkBlots = new InkBlot[NB_BLOTS];
int counter = 0;