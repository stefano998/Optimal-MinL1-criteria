function [acc, y_pred_acertou] = acc_score(y_pred,y_val)
#y_pred=[y_pred(1:5,:);y_pred(50011:50015,:)];
#y_val=[y_val(1:5,:);y_val(50011:50015,:)];

qtt_outs_min = sum(y_val(1,:));
qtt_outs_max = sum(y_val(rows(y_val),:));
acc = [];
y_pred_acertou=[];
for qtt_outliers = qtt_outs_min:qtt_outs_max

aux = (find(sum(y_val')==qtt_outliers))';  #retorna indices das linhas que atendem condicao
count = 0;
for i = aux(1,1):(aux(1,1)+rows(aux)-1)
    if y_val(i,:)==y_pred(i,:)
      count = count+1;
      y_pred_acertou=[y_pred_acertou; y_val(i,:)]; endif end

acc = [acc; qtt_outliers 100*(count/rows(aux))];
end

end