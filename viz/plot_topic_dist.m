clear; close all; clc;

% load data
DATA = dlmread ('../report/topic_dist.txt', '\t', 1, 0);
topic = DATA(:,1);
train_data = DATA(:,2);
infer_data = DATA(:,3);
full_data = DATA(:,4);

% plot
figure; hold on; 
% plot(topic, train_data, 'bx-', 'linewidth', 5);
plot(topic, infer_data, 'rx-', 'linewidth', 5);
% plot(topic, full_data, 'gx-', 'linewidth', 5);
grid on;
xlabel('Topic-Id', 'Fontsize', 16);
ylabel('Probability', 'Fontsize', 16);
title('FCC Net Neutrality - LDA Topic Dist.', 'Fontsize', 20);
% legend('train-data (80%)','infer-data (20%)', 'full-data');
legend('infer-data (20%)');

% print
print -dpng 'lda.topic_dist.png';
close all;
