function pass = test_power( ) 
% Test power in SPHEREFUN 

tol = 1e3*chebfunpref().techPrefs.eps;

f = spherefun(@(x,y,z) z );
g = spherefun(@(x,y,z) z.^2 );
pass(1) = norm( sample(f,100,100).^2 - ...
                sample(g,100,100), inf ) < tol; 

% Another example: 
f = spherefun(@(x,y,z) cos(x.*y.*z)); 
g = spherefun(@(x,y,z) cos(x.*y.*z).^cos(x.*y.*z)); 
pass(2) = ( norm( f.^f - g ) < tol );

end