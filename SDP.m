%Create a detector object
% %pointTracker = vision.PointTracker('MaxBidirectionalError', 2);
 %cam = webcam('Microsoft Camera Front');
 %videoFrame = snapshot(cam);
 frameSize = size(videoFrame);
% % Create the video player object.
 videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
 runloop = true;
% clear all;
% close all;
%a = imaq.VideoDevice('Microsoft Camera Front',1,'MJPG_1024x576');
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); 
count=0;
while runloop
    

step(videoPlayer, img);
%img = step(a);
%imshow(img);
count=count+1;
if count>-1
    img=rgb2gray(img); % convert to gray
    BB=step(faceDetector,img); % Detect faces
    face=imcrop(img,BB(1,:));
    fac=imresize(face,[212,192]);
    ftrs = detectSURFFeatures(fac);
    figure(2);
 imshow(fac);hold on; plot(ftrs);
 count=0;
end
%Plot facial features.
%step(videoPlayer, img);
runLoop = isOpen(videoPlayer);
end
% Clean up.
clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);