function [IDX, D] = addToCluster(points, centroids)
%addToCluster Find the nearest cluster to a set of points
%   Using predefined cluster centers, the points will be assigned to a
%   cluster based off of their euclidean distance to the centroids

[rows, ~] = size(centroids);
[IDX, D] = knnsearch(centroids, points, 'k', rows);

end

