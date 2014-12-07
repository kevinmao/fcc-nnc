clear; close all; clc;

% load data
DATA = dlmread ('../report/primaryTopicHist.txt', '\t');
topics = DATA(:,1);
doc_counts = DATA(:,2);

% plot
bar(topics, doc_counts, 'FaceColor', [0,0.7,0.7]);
grid on;
xlabel('Topic-Id');
ylabel('Number-of-Documents');
title('FCC Net Neutrality - LDA Primary Topic Hist.');
set(gca,'XLim',[1 length(topics)+1])

% print
print -dpng 'lda.primary_topic_hist.png';
close all;
