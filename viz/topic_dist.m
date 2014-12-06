clear; close all; clc;

% load data
numTopics = 20;
DataDir = strcat('../mallet-data/unigram/', int2str(numTopics));
Train = dlmread (strcat(DataDir,'/doc_topics.txt'), '\t', 1, 2);
Infer = dlmread (strcat(DataDir,'/infer.doc_topics.txt'), '\t', 1, 2);

% topic dist
A = sum(Train) / size(Train,1);
B = sum(Infer) / size(Infer,1);
C = (0.8*A + 0.2*B);

% put all together
M = [ [1:numTopics]' A' B' C'];

% save
fname = '../report/topic_dist.txt';
header = {'topic', 'train', 'infer', 'full'};
fmt = repmat('%s\t ', 1, length(header));
fmt(end:end+1) = '\n';
fid = fopen(fname, 'w');
fprintf(fid, fmt, header{:});
fclose(fid);
dlmwrite(fname, M, '-append','delimiter','\t');

