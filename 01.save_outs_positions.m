pkg load statistics
warning ("off");
t0 = clock (); 

qtd_0out = 200000
qtd_itr=50000                           
qtt_outs_min = 1                           
qtt_outs_max = 2                          
alias_aux = {'gemael147','ghi355gps','nive20obs','gnssrbc21','ghiniv255','kleincorr',}; 
for alias_num = 1:length(alias_aux)      
   for min_err = [3, 6]                  
   
    mfilename ()
    alias = alias_aux{alias_num}
    min_err
    max_err = min_err + 3              
    
    
rand("state",[14]);randn("state",[14]);

[A, dp, MVC, P, U, m, n] = get_network(alias);

[obs_errors, outs_positions] = gera_smc_0outdif(qtd_0out,MVC, dp, m, qtd_itr, qtt_outs_min, qtt_outs_max, min_err, max_err);


if qtt_outs_max != 0
filename=sprintf("%s_outs_positions_0out%d_%d-%douts_%d-%ds_%ditr", alias,... 
qtd_0out, qtt_outs_min, qtt_outs_max, min_err, max_err, qtd_itr);
save ("-ascii", filename, "outs_positions");
end
tempo = etime (clock (), t0)/60

endfor endfor 