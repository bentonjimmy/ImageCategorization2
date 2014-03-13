function [samparray, sampledfilename, fileclass] = samplefiles(directory, samplesize, pointssampled)
%SampleFiles This will sample the samplesize number of files in the
%directory.  Each file is sampled pointssampled amount of times.
%   This will sample the samplesize number of files in the
%directory.  Each file is sampled pointssampled amount of times.

if(isdir(directory))
    allfiles = dir(directory);
    j=1;
    for i=1:length(allfiles)
       if(allfiles(i).isdir == 0)
           files(j) = allfiles(i);
           j = j + 1;
       end
    end
    if(strcmpi(samplesize, 'all') == 1)
       samplesize = length(files); 
    elseif(samplesize > length(files))
       samplesize = length(files); 
    end
    samparray = zeros(samplesize, pointssampled);
    if(length(files) ~= samplesize)
        filesample = randsample(files, samplesize, true);
    else
        filesample = files;
    end
    sampledfilename = cell(length(filesample), 1);
    fileclass = cell(length(filesample), 1);
    for i=1:length(filesample)
       fileclass{i, 1} = strtok(filesample(i).name, '_');
       sampledfilename{i, 1} = filesample(i).name;
       toread = strcat(directory,'/', sampledfilename{i, 1});
       image = imread(toread); %Load the image
       s = sample(image, pointssampled); %Sample the image
       for j=1:length(s)
          samparray(i, j) = s(j); %Put the sampled points into the sample array 
       end
       clear image; %remove the image
    end
end

end

