% Create the face detector object.
faceDetector = vision.CascadeObjectDetector();
% Create the point tracker object.
pointTracker = vision.PointTracker('MaxBidirectionalError', 2);
% Create the webcam object.
cam = webcam('Microsoft Camera Front');
% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runloop = true;
while runloop
        videoFrame = snapshot(cam);
        step(videoPlayer, videoFrame);
        runLoop = isOpen(videoPlayer);
end

% Clean up.
clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);