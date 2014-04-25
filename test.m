function test(testdir,code,name)

%dirlist=dir(testdir);
%for k=1:size(dirlist, 1)
 %   file=dirlist(k).name;
  %  disp(file);
   % if strcmp(file,'.')~=1 && strcmp(file,'..')~=1
    %    disp(file);
        file1=strcat(testdir,'/',name);
        [s, fs] = wavread(file1);       
         
        v = mfcc(s, fs);            % Compute MFCC's 

        distmin = inf; 
        k1 = 0;
        
        for l = 1:length(code)      % each trained codebook, compute distortion 
        d = disteu(v, code{l});  
        dist = sum(min(d,[],2)) / size(d,1); 
      % disp(dist);
        if dist < distmin 
             distmin = dist; 
            k1 = l; 
        end       
        end
        distmin=distmin*distmin;
    if distmin<9.61
        disp(distmin);
        msg = sprintf('Speaker %s you have been granted access successfully!',name); 
        disp(msg);
    else
        disp(distmin);
        disp('Not a Registered User');
    end
  %  end
%end
