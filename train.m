function code = train(traindir)  
k = 16;                         % number of centroids required 
 i=1; 
dirlist=dir(traindir);
for k=1:size(dirlist, 1)
    file=dirlist(k).name;
    disp(file);
    if strcmp(file,'.')~=1 && strcmp(file,'..')~=1
        
        disp(file);
        file1=strcat(traindir,'/',file);    
    [s, fs] = wavread(file1);

    v = mfcc(s, fs);            % Compute MFCC's 
    code{i} = vqlbg(v, k);      % Train VQ codebook 
    i=i+1;
    end
end