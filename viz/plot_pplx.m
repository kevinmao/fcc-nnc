clear; close all; clc;

% load data
DATA = dlmread ('../report/perplexity.txt', '\t', 1, 0);
numTopic = DATA(:,1);
unigram = log(DATA(:,2));

% plot
plot(numTopic, unigram, 'bx-');
grid on;
xlabel('Number of Topics');
ylabel('Log-Perplexity');
title('FCC Net Neutrality - LDA Topic Model');
legend('unigram');

% print
print -dpng 'lda.perplexity.png';
close all;
