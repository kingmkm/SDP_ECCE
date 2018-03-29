% vid = videoinput('winvideo', 1, 'MJPG_1024x576');
% src = getselectedsource(vid);
% 
% vid.FramesPerTrigger = 1;
% 
% preview(vid);

clear all;
close all;

cam = webcam('Microsoft Camera Front');
%cam = webcam('Microsoft Camera Rear');
 videoFrame = snapshot(cam);
 frameSize = size(videoFrame);
% % Create the video player object.
 videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

block_res = 6;       % number of blocs in the face image, to be used in 
                     % building the LBP signature 
               
im_width=100;        % standard size of the 
im_height=100;       % image
size_lbpHist = 2124 ; %  depends on bloc_res ; check the output size of GetLBPFaceHist
nbr_samples = 50 ;   % nbr of captured face samples 
%a = imaq.VideoDevice('winvideo',1,'MJPG_1024x576');
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');

subject_name='Rash';

colorLBPHist=cell(nbr_samples,size_lbpHist);
for i=1:nbr_samples
        colorImage = snapshot(cam);
        bbox = step(faceDetector, colorImage);
        imshow(colorImage);
     if ~isempty(bbox)
      
         % bbox = step(faceDetector,colorImage);
        rectangle('position',bbox(1,:),'Linewidth',2,'Linestyle','-','Edgecolor','y');
          % to visualze the face bounding box detector
   
            c1=bbox(1,1)+bbox(1,3);
            c2=bbox(1,2)-bbox(1,4);
            c3=bbox(1,2);
            c4=bbox(1,1);
          % cropFace{i} = imresize( imcrop(colorImage,bbox),[im_width,im_height]);
          if ((c1<1920)&&(c2>0)&&(c3<1080)&&(c4>0))
          x=imcrop(colorImage,bbox(1,:));
           cropFace = imresize( x,[im_width,im_height]);
            imshow(cropFace);
            %grayLevelImage = rgb2gray(cropFace);
           colorLBPHist{i} = GetLBPFaceHist(cropFace,0,block_res);
           %colorLBPHist{i} = extractLBPFeatures(grayLevelImage,'NumNeighbors',8);
           %imshow(colorLBPHist{i});
           pause(0.001)  % to kepp visualzing the face bounding box detector
         end
     end
     bbox=[];
end
clear cam;
save(subject_name,'colorLBPHist'); % save the nbr_samples samples of facet signature
