
% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();
% Read a video frame and run the face detector.
videoFileReader = vision.VideoFileReader('Busy people walking the city streets in London, HD Stock Footage.mp4');
videoFrame      = step(videoFileReader);
frameSize       = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);


while true
videoFrame      = step(videoFileReader);
bbox            = step(faceDetector, videoFrame);
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
 step(videoPlayer, videoFrame);
end