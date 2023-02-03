pkg load statistics
warning ("off");
t0 = clock ();

qtd_0out = 200000
qtd_itr=50000                           
qtt_outs_min = 1                        
qtt_outs_max = 2                        
pesos_aux = {'pp', 'pr', 'pi'};           
alias_aux = {'gemael147','ghi355gps','nive20obs','gnssrbc21','ghiniv255','kleincorr',}; 
test_stat_aux = {'sig_obs', 'sigma_v'};   
for alias_num = 1:length(alias_aux)
 for test_stat_num = 1:length(test_stat_aux)         
  for pesos_num = 1:length(pesos_aux)
   for min_err = [3, 6]                   
   
    mfilename ()
    pesos = pesos_aux{pesos_num}
    alias = alias_aux{alias_num}
    test_stat = test_stat_aux{test_stat_num}
    min_err
    max_err = min_err + 3                  


[A, dp, MVC, P, U, m, n] = get_network(alias);

filename=sprintf("Ev_SMC_L1_%s_%s_%ditr", pesos, alias, 200000);
Ev_SMC=importdata(filename);
DPvv=(sqrt(diag(Ev_SMC)))';

filename=sprintf("%s_vAll_L1_%s_0out%d_%d-%douts_%d-%ds_%ditr", alias,... 
pesos, qtd_0out, qtt_outs_min, qtt_outs_max, min_err, max_err, qtd_itr);
vAll=importdata(filename);


if test_stat == "sigma_v"
  wAll = abs(vAll./(DPvv.+0.00000000001));
  else wAll = abs(vAll./dp);end


filename=sprintf("%s_wAllEL1_%s_%s_0out%d_%d-%douts_%d-%ds_%ditr", alias,... 
pesos, test_stat, qtd_0out, qtt_outs_min, qtt_outs_max, min_err, max_err, qtd_itr);
save ("-ascii", filename, "wAll");

ww=abs(wAll(1:qtd_0out,:));
vetorMax_ww=max(ww');
vetorMax_ww=sort(vetorMax_ww);

VC=[];
alpha = 0.05;
for alfa = [0.001, 0.0027,0.005, 0.01, 0.025, 0.05, 0.10, alpha]
  Posicao_corte=round((qtd_0out)*(1-alfa));
  Valor_corte=vetorMax_ww(Posicao_corte);
  VC=[VC; alfa Valor_corte];
end

VC
filename=sprintf("VC_L1_%s_%s_%s_%d", pesos, alias, test_stat, qtd_0out);
save ("-ascii", filename, "VC");

tempo = etime (clock (), t0)/60



endfor endfor endfor endfor
