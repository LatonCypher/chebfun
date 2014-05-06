function projOrder = getProjOrder(L)
%GETPROJORDER   Get projection order of a discretization.
%   Each boundary and continuity constraint in a linop forces a reduction in the
%   total number of rows in the discrete operator, so that the composite is
%   square. The reduction is found by down-projection of the result of applying
%   the operator.
%
%   PROJORDER = GETPROJORDER(DISC) returns a matrix of dimensions by which each
%   column of the DISC.SOURCE should be down-projected in order to end with a
%   square system. This value is obtained from calling the GETPROJORDER() method
%   of DISC.SOURCE. If no such method exists, PROJORDER = 0 is returned.
%   
%   PROJORDER = DISC.GETPROJORDER(SOURCE) is an equivalent calling sequence.

% Copyright 2014 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

if ( isa(L, 'chebDiscretization' ) )
    L = L.source;
end

try
    % Attempt to call the getProjOrder() method of L.
    projOrder = getProjOrder(L);
    
catch ME
    % Calling getProjOrder(L) failed...
    
    if ( strcmp(ME.identifier, 'MATLAB:UndefinedFunction') )
        % If no such method exists, return a zero projection order:
        projOrder = 0;
    else
        % If a different error occured, rethrow that:
        rethrow(ME);
    end

end      
    
end