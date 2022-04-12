clear, close all

%% load credit_card data.
num = readmatrix('credit_card_1000.csv');
txt = readcell('credit_card_1000.csv');
raw = readcell('credit_card_1000.csv');

excludeind=[];
% construct Table array
data=cell2table(raw(2:end,2:end));
for i=1:size(data,2)
    data.Properties.VariableNames{i}=raw{1,i+1}; % assign the VariableNames   
    
    % identify patients with missing data
    if iscell(data{:,i})
        tmpind=find(ismember(data{:,i},'NA'));  
    else
       tmpind=find(isnan(data{:,i}));  
    end
    excludeind=[excludeind, tmpind'];        
end
data(unique(excludeind),:)=[]; % remove the patients with missing data

%% Separate data into training (70%) and test (30%) datasets
% randomly hold out 30% of subjects for test
C = cvpartition(size(data,1),'holdout',0.30); 
dataTrain = data(C.training,:);
dataTest = data(C.test,:);

% Construct a SVM classificatier using the training dataset
predictors={'LIMIT_BAL','SEX', 'EDUCATION', 'MARRIAGE', 'AGE', 'PAY_0'};
svm_model = fitcsvm(dataTrain,'default','PredictorNames',predictors,...
    'OptimizeHyperparameters','all',...
    'HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus','kfold',5));

spread_predict=predict(svm_model,dataTest);
[ConfusionMatrix,order]=confusionmat(dataTest.default,spread_predict)
accurarcy=trace(ConfusionMatrix)/sum(ConfusionMatrix(:))
save('trainedSVMmodel.mat','svm_model')

return
%% ClassifierLearner
classificationLearner
