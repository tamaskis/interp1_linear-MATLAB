%-------------------------------------------------------------------------%

% TAMAS KIS

% interpolateExtrapolate.m
% Interpolates or extrapolates a value from data.

%-------------------------------------------------------------------------%



%% FUNCTION

% INPUT(S): x - vector of independent variable values
%           y - vector of dependent variable variable values
%           x1 - point at which you would like to interpolate or
%                extrapolate a value for y
% OUTPUT(S): y1 - interpolated value of y at x = x1
function y1 = interpolateExtrapolate(x,y,x1)

    % determines number of data points, max is taken to negate effects of
    % array orientation (vertical vs. horizontal)
    dataSize = max(size(x,1),size(x,2));
    
    % determines the index n where x1 is greater than x at n but less than
    % x at n+1
    n = 2;
    while (x1 > x(n)) && (n < dataSize)
        n = n + 1;
    end

    % performs linear interpolation/extrapolation to find diffusivity
    if (n < dataSize)
        
        % linear interpolation if x1 is within data set
        slope = (y(n)-y(n-1))/(x(n)-x(n-1));
        y1 = y(n-1) + slope*(x1-x(n-1));
        
    elseif x1 < x(1)
        
        % linear extrapolation if x1 is below data set
        slope = (y(2)-y(1))/(x(2)-x(1));
        y1 = y(1) + slope*(x1-x(1));
    
    else
    
        % linear extrapolation if x1 is above data set
        slope = (y(dataSize)-y(dataSize-1))/(x(dataSize)-...
            x(dataSize-1));
        y1 = y(dataSize) + slope*(x1-x(dataSize));
        
    end
    
end