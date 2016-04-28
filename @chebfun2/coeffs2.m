function varargout = coeffs2( f, m, n) 
% COEFFS2   Bivariate Cheybshev expansion coefficients of f. 
% 
% Same as CHEBCOEFFS2.
%
% See also PLOTCOEFFS2, CHEBCOEFFS2, CHEBCOEFFS.

if ( isempty(f) )
    varargout = { [ ] }; 
    return
end

if ( iszero(f) ) 
    varargout = { 0 } ; 
    return
end

[cols_coeffs, d, rows_coeffs] = chebcoeffs2( f );

if ( nargin == 2 ) 
    n = m; 
end

if ( nargin > 1 ) 
    [mf, rf] = size(cols_coeffs); 
    [nf, rf] = size(rows_coeffs); 
    if ( mf <= m ) 
        cols_coeffs = [ cols_coeffs ; zeros(m-mf,rf) ]; 
    else
        cols_coeffs = cols_coeffs(1:m,:);
    end
    if ( mf <= m ) 
        rows_coeffs = [ rows_coeffs ; zeros(n-nf,rf) ]; 
    else
        rows_coeffs = rows_coeffs(1:n,:);
    end
end


if ( nargout <= 1 )
    % Return the matrix of coefficients
    varargout = { cols_coeffs * d * rows_coeffs.' }; 
elseif ( nargout <= 3 )
    varargout = { cols_coeffs, d, rows_coeffs };
else
    % Two output variables are not allowed.
    error('CHEBFUN:CHEBFUN2:coeffs2:outputs', ...
        'Incorrect number of outputs.');
end

end


