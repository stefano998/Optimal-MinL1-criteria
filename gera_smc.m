function [obs_errors, outs_positions] = gera_smc(MVC, dp, m, qtd_itr, qtt_outs_min, qtt_outs_max, min_err, max_err)

outs_positions = [];
obs_errors = [];

for qtt_outliers = qtt_outs_min:qtt_outs_max
qtt_outliers
er = (mvnrnd(zeros(m,1),MVC,qtd_itr));

aux_positions = zeros (qtd_itr, m);
[out,idx] = sort(rand(m,qtd_itr));
idx = idx(1:qtt_outliers,:)';

for i=1:qtd_itr
  aux_positions(i,idx(i,1:qtt_outliers))=1; end

sign_choices = 2*randi([0 1],qtd_itr, m)-1;
er = er + aux_positions.*sign_choices.*dp.*(min_err .+ (max_err-min_err).*rand(qtd_itr,m));

outs_positions = [outs_positions; aux_positions];
obs_errors = [obs_errors; er];
end

endfunction