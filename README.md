# twitch_to_audio

## Description

This small ruby script can be used to simply download your favorite twitch video when given a URL and name for the file.
The video will be dowloaded as an mp4 so the audio will be m4a.

### Dependencies

You must have these things installed and in your path:
* [streamlink](https://github.com/streamlink/streamlink)
* [ffmpeg](https://www.ffmpeg.org/)

I have only tested this on MacOS

## Usage

```shell
Usage: twitch_to_audio.rb [options]
    -t, --twitch-url input           URL to the twitch video
    -n, --file-name name             Name you want the file to be with no file extention
    -d, --dont_delete                Dont delete video file
    -h, --help                       Displays Help
```
