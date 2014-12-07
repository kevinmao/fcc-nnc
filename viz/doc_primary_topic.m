clear; close all; clc;

% function
function M = groupPrimary(data)
    [I,J] = sort(data, 2, 'descend');
    A = J(:,1);
    Aset = unique(A(:));
    count = hist(A(:),Aset);
    M = [Aset count'];
end

% load data
numTopics = 20;
DataDir = strcat('../mallet-data/unigram/', int2str(numTopics));
Train = dlmread (strcat(DataDir,'/doc_topics.txt'), '\t', 1, 2);
Infer = dlmread (strcat(DataDir,'/infer.doc_topics.txt'), '\t', 1, 2);

% primary topic dist
A = groupPrimary(Train);
B = groupPrimary(Infer);
C = [A(:,1) A(:,2)+B(:,2)];
C

