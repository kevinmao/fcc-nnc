clear; close all; clc;

% load data
DATA = dlmread ('../report/perplexity.txt', '\t', 1, 0);
numTopic = DATA(:,1);
unigram = log(DATA(:,2));
bigram = log(DATA(:,3));
unibigram = log(DATA(:,4));

% plot
figure; hold on; 
plot(numTopic, unigram, 'bx-', 'linewidth', 5);
plot(numTopic, bigram, 'rx-', 'linewidth', 5);
plot(numTopic, unibigram, 'gx-', 'linewidth', 5);
grid on;
xlabel('Number of Topics', 'Fontsize', 16);
ylabel('Log-Perplexity', 'Fontsize', 16);
title('FCC Net Neutrality - LDA Topic Modeling', 'Fontsize', 20);
legend('unigram','bigram', 'uni+bigram');

% print
print -dpng 'lda.perplexity.ngram.png';
close all;
