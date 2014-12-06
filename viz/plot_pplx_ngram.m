clear; close all; clc;

% load data
DATA = dlmread ('../report/perplexity.txt', '\t', 1, 0);
numTopic = DATA(:,1);
unigram = log(DATA(:,2));
bigram = log(DATA(:,3));
unibigram = log(DATA(:,4));

% plot
figure; hold on; 
plot(numTopic, unigram, 'bx-');
plot(numTopic, bigram, 'rx-');
plot(numTopic, unibigram, 'gx-');
grid on;
xlabel('Number of Topics');
ylabel('Log-Perplexity');
title('FCC Net Neutrality - LDA Topic Modeling');
legend('unigram','bigram', 'uni+bigram');

% print
print -dpng 'lda.perplexity.ngram.png';
close all;
