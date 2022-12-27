function [errors] = export_fit_data(fit_)
%GETERRORSFROMFIT Summary of this function goes here
%   Detailed explanation goes here
errors = confint(fit_);
errors = abs(errors(1,:) - errors(2,:)) / 4;


names = coeffnames(fit_);
values = coeffvalues(fit_);

fileID = fopen('fitResults.txt','w');
for i = 1:length(names)
    fprintf(fileID, '%s = ufloat(%g, %g)\n', names{i}, values(i), errors(i));
end

fprintf(fileID, '\n\n');

for i = 1:length(names)
    fprintf(fileID, '%s = %g\n', names{i}, values(i));
end

fclose(fileID);
