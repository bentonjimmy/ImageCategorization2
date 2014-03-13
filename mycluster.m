function [IDX, C, D] = mycluster(carray, numclusters, startloc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Check the number of arguments passed since startloc is optional
if(nargin < 3) 
    [r, c] = size(carray);
    if(numclusters > r)
        numclusters = r;
    end
    %Take a random sample to create initial locations of clusters
    s = randsample(1:r, numclusters);
    for i=1:length(s)
       for j=1:c
          %Put rows at s(i) into startloc
          startloc(i,j) = carray(s(i),j);
       end
    end
end

[IDX, C, ~, D] = kmeans(carray, numclusters, 'start', startloc);


end

