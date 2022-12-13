////////////////////////////////////////
// WINDOW INITIALISATION ///////////////
////////////////////////////////////////

// Window size in pixel
static final int SIDE = 800;

// Frame rate
static final int FR = 60;

// Draw mirror or not
static final boolean DRAW_MIRROR = true;

// Brightness threshold for "merging" the ink blots
// 0: no merge, 1: full merge
static final float THRES = 0.5;

////////////////////////////////////////
////////////////////////////////////////

////////////////////////////////////////
// INK BLOTS SETTINGS //////////////////
////////////////////////////////////////

// Number of blots (twice as many will appear on screen)
static final int NB_BLOTS = 24;

// Min and max radius size of blots
static final int RADIUS_MIN = 70;
static final int RADIUS_MAX = 100;

////////////////////////////////////////
////////////////////////////////////////

////////////////////////////////////////
// INK BLOTS MOVEMENT SETTINGS /////////
////////////////////////////////////////

// Maximum speed for each blot
static final float MAX_SPEED = 3;

// Maximum start value for _xtime and _ytime (between 0 and TWO_PI)
static final float START_TIME = TWO_PI;

// speedBoost() curve looks like: ____/\____/\____
// In speedBoost(), controls speed boost frequency
static final float SPIKES_FREQUENCY = 0.1;

// In speedBoost(), controls speed boost duration (higher is shorter)
static final float SPIKES_DURATION = 1000;

// In speedBoost(), controls speed boost intensity
static final float SPIKES_INTENSITY = 5;

// Step to control how fast you loop over the speed boost curve
static final private float DELTA = 0.01;

////////////////////////////////////////
////////////////////////////////////////

////////////////////////////////////////
// GIF RECORDING SETTINGS //////////////
////////////////////////////////////////

// Number of frames for the GIF image
static final float GIF_FRAMES = 1000;
static final boolean GIF_IS_RECORDING = true;

////////////////////////////////////////
////////////////////////////////////////
