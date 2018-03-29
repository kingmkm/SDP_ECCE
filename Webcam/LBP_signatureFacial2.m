function   global_LBP_Hist = LBP_signatureFacial2(image_name,vis)
%LBP_SIGNATUREFACIAL Summary of this function goes here
%   Detailed explanation goes here
%close all ;
%a=imread(image_name,'bmp');
a=image_name ;
bloc_step = 4 ;
%%

MAPPING =getmapping(8,'u2');
LBP_1_8 = lbp(a,1,8,MAPPING,'im')  ;
% LBP_2_8 = lbp(a,2,8,MAPPING,'im')  ;
% LBP_3_8 = lbp(a,3,8,MAPPING,'im')  ;
% LBP_4_8 = lbp(a,4,8,MAPPING,'im')  ;
% LBP_5_8 = lbp(a,5,8,MAPPING,'im')  ;



%%
%%%%% Extraction des bloc_step*bloc_step  bloc and computation of their histgrams 
Im = LBP_1_8 ;
visIm = Im ; 
if (vis==1)
  imshow(visIm);
  hold
end 
[m,n] =size(Im) ;
row_step = floor(m/bloc_step);
col_step = floor(n/bloc_step) ;
global_LBP_Hist  =[];   % global histogram 
% Determine the size of single bloc 
   bloc=ones(row_step,col_step);
   bloc_LBP_Hist = lbp(bloc,1,8,MAPPING,'h') ;
   [r,s]= size(bloc_LBP_Hist);
    nbr_blocs = bloc_step*bloc_step;
% set an initial zero_valued global histogram 
   global_LBP_Hist = zeros(r,nbr_blocs*s);    
   size( global_LBP_Hist);
 
nbr=0;
for j=0: bloc_step -1
 for k=0: bloc_step -1
  
     LUC =  [j*row_step + 1, k*col_step + 1] ;
     RUC =  [LUC(1), LUC(2) + col_step-1  ] ;
     LBC =  [LUC(1) + row_step-1 , LUC(2)] ;
     RBC =  [LUC(1) + row_step-1 ,  LUC(2) + col_step-1 ] ;
     if (vis==1)
        visIm(LUC(1):LBC(1),LUC(2):RUC(2))= 255 ;
        imshow(visIm) ;
     end
     Bloc = Im(LUC(1):LBC(1),LUC(2):RUC(2)) ;
     bloc_LBP_Hist = lbp(Bloc,1,8,MAPPING,'h') ;
    % global_LBP_Hist = [global_LBP_Hist, bloc_LBP_Hist] ;
     global_LBP_Hist(:,nbr*s +1 : (nbr+1)*s) =  bloc_LBP_Hist ;
     nbr=nbr+1;
     
 end
end
 
%global_LBP_Hist contains the gloal LBP histogram describing the face, that
% is the face signature. You have to compute for each enrolled face and
% save it with the other subject data


end

