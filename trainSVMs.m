function [SVMModels] = trainSVMs(training, trainingclasses)
%trainSVMs Summary of this function goes here
%   Detailed explanation goes here

%Create vector holding the unique classes of the training data
uniqueclasses = unique(trainingclasses);
%Array to hold SVM models
SVMModels = cell(length(uniqueclasses), 1);

for c=1:length(uniqueclasses)
   %Create each training svm
   %uniqueclasses(c) vs others - Create a binary version of the class
   %labels
   currclass = strcmp(trainingclasses, uniqueclasses(c));
   %Training svm is put into a struct
   SVMModels{c} = fitcsvm(training, currclass, 'ClassNames', [false true], 'Standardize', false, 'KernelFunction', 'linear', 'BoxConstraint', .005);
end


