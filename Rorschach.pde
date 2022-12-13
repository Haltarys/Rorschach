// Processing default function
void settings() {
    size(SIDE, SIDE);
    // frameRate(FR);
}

// Processing default function
void setup() {
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
}

void generateBlots() {
    for (int i = 0; i < NB_BLOTS; i++)
        inkBlots[i] = new InkBlot();
}

InkBlot[] inkBlots = new InkBlot[NB_BLOTS];