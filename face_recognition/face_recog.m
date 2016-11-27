%% Face recognition program

clear all;
close all;
faceDatabase = imageSet('gallery','recursive');
galleryNames = {faceDatabase.Description};
displayFaceGallery(faceDatabase,galleryNames);
%% Create HoG training features from database
trainingFeatures = zeros(60,10404);
featureCount = 1;

for i=1:size(faceDatabase,2)
    for j = 1:faceDatabase(i).Count
        sizeNormalizedImage = imresize(read(faceDatabase(i),j),[150 150]);
        trainingFeatures(featureCount,:) = extractHOGFeatures(sizeNormalizedImage);
        trainingLabel{featureCount} = faceDatabase(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = faceDatabase(i).Description
end
%% Create Classifier 
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

%% Read test data
testSet = imageSet('intruders');
figure;
figureNum = 1;
for  i= 1: testSet.Count
    queryImage = read(testSet,i);
    b = imresize(queryImage,[150 150]);
    queryFeatures = extractHOGFeatures(b);
    personLabel = predict(faceClassifier,queryFeatures)
    booleanIndex = strcmp(personLabel, personIndex);
    integerIndex = find(booleanIndex);
    subplot(5,2,figureNum);imshow(queryImage);title('Query Face');
    subplot(5,2,figureNum+1);imshow(read(faceDatabase(integerIndex),1));title('Matched Class');
    figureNum = figureNum+2;
    
end