pkg load statistics
warning ("off");
t0 = clock (); 

qtd_itr=200000                      
pesos_aux = {'pp', 'pr', 'pi'};         
alias_aux = {'gemael147','ghi355gps','nive20obs','gnssrbc21','ghiniv255','kleincorr',}; 

for alias_num = 1:length(alias_aux)
  for pesos_num = 1:length(pesos_aux)

mfilename ()
rand("state",[51]);randn("state",[51]); 
pesos = pesos_aux{pesos_num}
alias = alias_aux{alias_num}

[A, dp, MVC, P, U, m, n] = get_network(alias);

P = diag(1./diag(MVC)); 
if pesos == "pr"
  P = chol(P); end
if pesos == "pi"
  P = eye(m); end

aux = (mvnrnd(zeros(m,1),MVC,qtd_itr));  
er = aux'; 

I = eye(m); p = diag(P);  
A1 = [A -A -I I];
c = cat(2,zeros(1,2*n),p',p');
ctype = repmat("S",1,m);
vartype = repmat("C",1,2*(n+m));

vAll = [];

for q=1:qtd_itr
[xopt, fopt, erro, extra] = glpk (c, A1, e=er(:,q), lb=[], ub=[], ctype, vartype);
v = xopt(2*n+1:2*n+m) - xopt(2*n+m+1:2*n+2*m);
vAll=[vAll v];
end

Ev_SMC = cov(vAll')
DPvv=sqrt(diag(Ev_SMC))

filename=sprintf("Ev_SMC_L1_%s_%s_%ditr", pesos, alias, qtd_itr);
save ("-ascii", filename, "Ev_SMC");
tempo = etime (clock (), t0)/60

endfor endfor