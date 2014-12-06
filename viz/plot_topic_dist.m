clear; close all; clc;

% load data
DATA = dlmread ('../report/topic_dist.txt', '\t', 1, 0);
topic = DATA(:,1);
train_data = DATA(:,2);
infer_data = DATA(:,3);
full_data = DATA(:,4);

% plot
figure; hold on; 
plot(topic, train_data, 'bx-');
plot(topic, infer_data, 'rx-');
plot(topic, full_data, 'gx-');
grid on;
xlabel('Topic-Id');
ylabel('Probability');
title('FCC Net Neutrality - LDA Topic Dist.');
legend('train-data (80%)','infer-data (20%)', 'full-data');

% print
print -dpng 'lda.topic_dist.png';
close all;
