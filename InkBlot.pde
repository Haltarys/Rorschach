class InkBlot {
    private float _x;
    private float _y;
    private int _radius;
    private float _xspeed;
    private float _yspeed;
    private float _xtime;
    private float _ytime;
    private float _xdir;
    private float _ydir;
    private PImage _img;

    public InkBlot () {
        // set random radius
        _radius = (int) random(RADIUS_MIN, RADIUS_MAX);

        // set coordinates with left half of the window
        _x = random(_radius, width - _radius);
        _y = random(_radius, height - _radius);

        // set random speed
        _xspeed = random(MAX_SPEED);
        _yspeed = random(MAX_SPEED);

        // set random direction
        _xdir = random(1) < 0.5? -1 : 1;
        _ydir = random(1) < 0.5? -1 : 1;

        // start at random point on sine wave for speed boost
        _xtime = random(START_TIME);
        _ytime = random(START_TIME);

        // generate blot
        generateImage();
    }

    private void generateImage() {
        // setup image
        _img = createImage(_radius * 2, _radius * 2, ARGB);

        for (int y = 0; y <= _radius; y++) {
            for (int x = 0; x <= _radius; x++) {
                // compute radius length
                float r = sqrt(sq(_radius - x) + sq(_radius - y));

                float alpha = constrain(256 * (1 - r / _radius), 0, 255);
                color c = color(0, alpha);

                _img.set(x, y, c);
                _img.set(2 * _radius - x, y, c);
                _img.set(x, 2 * _radius - y, c);
                _img.set(2 * _radius - x, 2 * _radius - y, c);
            }
        }
    }

    private float speedBoost(float x) {
        // Creates a curve that looks like: ____/\____/\____
        float boost = pow(sin(x * SPIKES_FREQUENCY), SPIKES_DURATION) * SPIKES_INTENSITY;

        return boost;
    }

    private void bounce() {
        if (_x < _radius) {
            _x = _radius;
            _xdir *= -1;
        } else if (_x >= width - _radius) {
            _x = width - _radius - 1;
            _xdir *= -1;
        }

        if (_y < _radius) {
            _y = _radius;
            _ydir *= -1;
        } else if (_y >= height - _radius) {
            _y = height - _radius - 1;
            _ydir *= -1;
        }
    }

    public void move() {
        // move by an amount + an extra amount for acceleration
        _x += (_xspeed + speedBoost(_xtime)) * _xdir;
        _y += (_yspeed + speedBoost(_ytime)) * _ydir;
        _xtime += DELTA;
        _ytime += DELTA;

        // bounce off edges
        bounce();
    }

    public void draw() {
        // draw image and its mirror
        image(_img, _x - _radius, _y - _radius, _radius * 2, _radius * 2);

        if (DRAW_MIRROR)
            image(_img, width - _x - 1 - _radius, _y - _radius, _radius * 2, _radius * 2);
    }
}
