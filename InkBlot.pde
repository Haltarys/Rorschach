class InkBlot {
    private float _x;
    private float _y;
    private int _radius;
    private float _xspeed;
    private float _yspeed;
    private PImage _img;

    public InkBlot () {
        // set random radius
        _radius = (int) random(RADIUS_MIN, RADIUS_MAX);

        // set coordinates with left half of the window
        _x = random(_radius, width - _radius);
        _y = random(_radius, height - _radius);

        // set random speed
        _xspeed = random(- SPEED, SPEED);
        _yspeed = random(- SPEED, SPEED);

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

    private void bounce() {
        if (_x < _radius || _x >= width - _radius)
            _xspeed *= -1;
        if (_y < _radius || _y >= height - _radius)
            _yspeed *= -1;
    }

    public void move() {
        // bounce off edges
        bounce();

        _x += _xspeed;
        _y += _yspeed;
    }

    public void draw() {
        // draw image and its mirror
        image(_img, _x - _radius, _y - _radius, _radius * 2, _radius * 2);
        image(_img, width - _x - 1 - _radius, _y - _radius, _radius * 2, _radius * 2);
    }
}
