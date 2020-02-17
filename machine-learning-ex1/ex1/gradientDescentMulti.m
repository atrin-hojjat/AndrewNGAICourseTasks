function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
[m,n] = size(X);
J_history = zeros(num_iters, 1);

X = X';
y = y';
theta = theta';

for iter = 1:num_iters

% ====================== YOUR CODE HERE ======================
% Instructions: Perform a single gradient step on the parameter vector
%               theta.
%
% Hint: While debugging, it can be useful to print out the values
%       of the cost function (computeCost) and gradient here.
%

delta = zeros(size(theta));

for i=1:m
delta+=(theta*X(:,i) - y(:,i))*X(:,i)';
end

theta -= alpha *delta/m;



% ============================================================

% Save the cost J in every iteration

J_history(iter) = computeCost(X', y', theta');
                                                     
end
                                                     
theta = theta';
end