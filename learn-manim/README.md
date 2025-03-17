## Installation

```shell
conda activate <myenv>
brew install cmake
brew install py3cairo
brew install ffmpeg
brew install pango
pip install manim
```

Running `which manim` should point to something like this -
```
/Users/avilayparekh/miniconda3/envs/dev/bin/manim
```

### Old Installation Instructions
```
brew install cmake
brew install pango
brew install --cask mactex

conda activate ai
conda install x264=='1!152.20180717' ffmpeg=4.0.2 -c conda-forge
pip install pycairo
pip install manim
```

## Execution
The `-p` option plays the animation once it has been generated. `-ql` is for low-quality. Other altneratives are `-qm` for medium, `-qh` for high, and `-qk` for 4k quality. To render a specific scene in the python module, name the scene class, like done below. To generate all scenes in the module use the `-a` option. For more details look at the [Configuration](https://docs.manim.community/en/stable/tutorials/configuration.html) section.

`manim -pql scene.py SquareToCircle`

By default the animation is `.mp4`. To generate a gif use the `-i` option.
