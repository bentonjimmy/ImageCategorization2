function [SVMModels, Scores, maxScore] = trainclassify(training, trainingclasses, classify)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Create vector holding the unique classes of the training data
uniqueclasses = unique(trainingclasses);
%Array to hold SVM models
SVMModels = cell(length(uniqueclasses), 1);
%Set seed to 1 to be able to reproduce results
rng(1);

for c=1:length(uniqueclasses)
   %Create each training svm
   %uniqueclasses(c) vs others - Create a binary version of the class
   %labels
   currclass = strcmp(trainingclasses, uniqueclasses(c));
   %Training svm is put into a struct
   SVMModels{c} = fitcsvm(training, currclass, 'ClassNames', [false true], 'Standardize', false, 'KernelFunction', 'linear', 'BoxConstraint', .005);
end

%Use Models to predict the points in classify
for c=1:length(uniqueclasses)
    [~, score] = predict(SVMModels{c}, classify);
    Scores(:,c) = score(:,2); % Second column contains positive-class scores
end

%Assign the points in classify to the class with the highest score
[~,maxScore] = max(Scores,[],2);

end

