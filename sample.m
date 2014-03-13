function s = sample(image, ss)
%Sample This will sample the values of an image an ss number of times
%   This will create a vector that contains an ss number of values sampled
%   from the input image
[rows, cols] = size(image);
if(ss > (rows * cols))
   ss =  (rows * cols);
end
s = zeros(ss);
randrow = randsample(1:rows, ss, true);
randcol = randsample(1:cols, ss, true);
for i=1:ss
   s(i) = image(randrow(i), randcol(i)); 
end

end

