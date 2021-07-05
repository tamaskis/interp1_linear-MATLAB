%==========================================================================
%
% interp1_linear  1D linear interpolation.
%
%   yq = interp1_linear(x,y,xq)
%
% See also interp1, interp2, interp3, interpn.
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-05
%
%--------------------------------------------------------------------------
%
% GitHub: https://github.com/tamaskis/interp1_linear
%
% See EXAMPLES.mlx for examples.
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - (n×1 or 1×n) independent variable data
%   y       - (n×1 or 1×n) dependent variable data
%   xq      - (q×1 or 1×q) query points (i.e. where to interpolate)
%
% -------
% OUTPUT:
% -------
%   yq      - (q×1 or 1×q) interpolated values of y at the query points
%
% -----
% NOTE:
% -----
%   --> n = number of data points
%   --> q = number of query points
%
%==========================================================================
function yq = interp1_linear(x,y,xq)

    % determines number of data points
    n = length(x);
    
    % determines number of query points
    q = length(xq);
    
    % preallocates vector to store interpolated values
    yq = zeros(size(xq));
    
    % linear interpolation at each query point
    for j = 1:q
    
        % determines the index i where xq is greater than x at i but less 
        % than x at i+1
        i = 2;
        while (xq(j) > x(i)) && (i < n)
            i = i+1;
        end

        % performs linear interpolation/extrapolation
        if (i < n)

            % linear interpolation if x1 is within data set
            m = (y(i)-y(i-1))/(x(i)-x(i-1));
            yq(j) = y(i-1)+m*(xq(j)-x(i-1));

        elseif xq(j) < x(1)

            % linear extrapolation if x1 is below data set
            m = (y(2)-y(1))/(x(2)-x(1));
            yq(j) = y(1)+m*(xq(j)-x(1));

        else

            % linear extrapolation if x1 is above data set
            m = (y(n)-y(n-1))/(x(n)-x(n-1));
            yq(j) = y(n)+m*(xq(j)-x(n));

        end
    
    end
    
end