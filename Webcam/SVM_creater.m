p1=load('Mohammed_khalid.mat');
p2=load('Rashed Almenhali.mat');
p3=load('Hazza_Daiban.mat');
p4=load('Eissa_alromaithi.mat');
p5=load('Ali_Abdulla.mat');

% hi



%% 
for j=1:50
    x1=p1(1).colorLBPHist(j,1);
for i=1:2124
    
    fun = @(x) x(i);
    x2(j,i) = cellfun(fun,x1);
end
end
%% 

save('subject_1.mat','x2');

p6=load('subject_1.mat');
x3=p6.x2;