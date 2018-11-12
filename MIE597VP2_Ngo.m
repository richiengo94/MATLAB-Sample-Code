function[M, K, lambda] = MIE597VP2_Ngo(n, L, P)
    %Richie Ngo MIE 597V 27413591 Project 2
    %This function is supposed to solve Project 2 for the cantilever beam
    %using the given information and through the Galerkin method. 
    E = 195*10^9;       %Young's Modulus (Pa)
    d = .01;            %Diameter (m)
    I = pi*(d/2)^4/2;   %Area moment of inertia (m^4)
    cross_A = pi*(d/2)^2;       %Cross-sectional area (m^2)
    rho = 8000;         %Density (kg/m^3)
    m = rho*cross_A*L;  %Mass (kg)
    zeta = .01;
    beta = [1.875 4.694 7.855 10.996 14.137]';  %Beta for cantilever and n <= 5
    %Could not figure out how to do anything in this problem without the
    %symbolic toolbox
    syms x
    if n > 5
        for j = 6:n
            beta(j) = (2*j - 1)*pi/(2*L);   %Beta for cantilever and n > 5
        end
    end
    phi = sym(zeros(1, n));
    phi_2 = phi;
    phi_4 = phi;
    for j = 1:n
        sigma = (sinh(beta(j)*L) - sin(beta(j)*L))/...  %Sigma
            (cosh(beta(j)*L) + cos(beta(j)*L));
        phi(j) = cosh(beta(j)*x) - cos(beta(j)*x) -...  %Phi
            sigma*(sinh(beta(j)*x) - sin(beta(j)*x));
        phi_2(j) = diff(phi(j), x, 2);    %Second derivative of phi
        phi_4(j) = diff(phi(j), x, 4);    %Fourth derivative of phi
    end
    F1 = sym(zeros(n));
    F2 = F1;
    F3 = F1;
    for i = 1:n
        for j = 1:n
            F1(i, j) = phi(i)*phi_4(j);
            F2(i, j) = phi(i)*phi_2(j);
            F3(i, j) = phi(i)*phi(j);
        end
    end
    A = double(int(F1, 0, L));
    B = double(int(F2, 0, L));
    G = double(int(F3, 0, L));
    K = E*I*A + P*B;    %Stiffness matrix
    M = m*G;            %Mass matrix
    %Do not have notes for how to find damping matrix
    D = inv(M)*K;
    lambda = sqrt(eig(D));  %Eigenvalues
    %I do not know how to proceed
end