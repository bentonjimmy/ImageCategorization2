function [Scores, maxScore] = SVMClassify(SVMModels, classify, numOfClasses)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Use Models to predict the points in classify
for c=1:numOfClasses
    [~, score] = predict(SVMModels{c}, classify);
    Scores(:,c) = score(:,2); % Second column contains positive-class scores
end

%Assign the points in classify to the class with the highest score
[~,maxScore] = max(Scores,[],2);

end

