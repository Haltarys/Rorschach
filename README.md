# Rorschach

Procedurally generated Rorschach-like image animated in real time using the [Processing](https://processing.org/) programming language.

![Example](output.gif)

## Launch

When in the root directory, run:

### Linux

```bash
processing-java --sketch="$(pwd)" --run
```

### Windows

```powershell
processing-java --sketch="$(pwd)" --run
```

## GIF recording

Edit `parameters.pde` and set the desired values for the GIF.

Run
```bash
ffmpeg -i frames/frame-%4d.jpg output.gif
```

You can download `ffmpeg` [here](https://ffmpeg.org/).
