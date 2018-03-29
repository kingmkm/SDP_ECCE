function  LBBFaceHist = GetLBPFaceHist(image,vis,bloc_step)
% iameg: 2D array containing gray level image
% vis=1 if you want to visulaize porcessed images, 0 otherwise
% bloc_setp bloc resolution e.g.  4 --> 4 x 4 = 16 blocs.
%
% Naoufe Werghi Feb. 2017 


 grayLevelImage = rgb2gray(image);
 LBBFaceHist = FaceLBPSignature(grayLevelImage,vis,bloc_step) ;

 
end 