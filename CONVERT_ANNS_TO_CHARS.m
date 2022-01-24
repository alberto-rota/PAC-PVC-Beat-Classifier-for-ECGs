files = dir("C:\Users\alber\Desktop\annotations_consegna");
files = files(3:end);
for i = 1:length(files)
   load(string(files(i).folder)+"\"+files(i).name);
   clear labels
   labels(numlabels==1)='N';
   labels(numlabels==2)='S';
   labels(numlabels==3)='V';
   labels = labels';
   save("C:\Users\alber\Desktop\Files\Università\V ANNO ACCADEMICO\AI in Biomedicine\Workshop\PAC-PVC-Beat-Classifier-for-ECGs\ss\"+files(i).name(1:end-4)+".mat","labels");
end