# PAC-PVC-Beat-Classifier-for-ECGs
An AI-based classifier for Normal, Sopraventricular and Ventricular heartbeats from ECG signals.
***
Active Contributors: *Alberto Rota, Gabriele Santicchi* (Politecnico di Milano)
***
The anomalous morphology of ECG hearbeats reflects pathological phenomena occuring during the hearbeat, which involves the electrical activity of the excitable cells of the myocardium. From a dataset of 105 patients with ECG recorded in a 30min interval, an AI-based model is built in order to perform real-time classification of the newly-recorded ECG signals. 

ECG sections are labelled as follows:
* NRS: Normal Sinus Rythm - Normal
* PAC: Premature Atrial Complex - Sopraventricular
* PVC: Premature Ventricular Complex - Ventricular

A two-lead example is displayed below:

![lead1](https://github.com/alberto-rota/PAC-PVC-Beat-Classifier-for-ECGs/blob/main/lead1_example_img.png)
![lead2](https://github.com/alberto-rota/PAC-PVC-Beat-Classifier-for-ECGs/blob/main/lead2_example_img.png)

## Windowing strategy
Three windowing strategies have been considered:
* RRR-based: Each heartbeat is considered as starting
from the R-peak of the previous one and ending to the
R-peak of the following one (with some margin, 5% of
the window width by default, in order to not include the
QR and RS slopes of the adjacent beats). This splitting
strategy keeps the highest possible amount of information
inside the window but, crucially, produces windows of
inconsistent width, which depends on the patient heart-rate.
* Fixed width: A predefined width w (in samples) is
chosen and each window is considered as starting from
xpeak − w/2 to xpeak + w/2. This approach assures
a consistent window size and, additionally, makes sure
that the R-peak is centered in the window. For patients
with a high heart-rate though, adjacent R-peaks may be
unavoidably included in the window.
* Adjusted RRR-based: This approach combines the two
previously described strategies by initially performing the
RRR-splitting and later, after choosing a window width
like in the fixed-width approach, padding or cropping to
the desired size. This approach makes sure that a single
R-peak is contained in the window, and it assures a
Fig. 3. Left: Distribution of the RR-interval in samples. Right: Distribution
of the distances between abnormal heartbeats. For example, most abnormal
heartbeats (over 4500) are located 2 beats after the previous abnormal
heartbeat
uniform width among all the splittings: to this extent,
the informative content of the window is reduced by the
least possible amount

![windows](https://github.com/alberto-rota/PAC-PVC-Beat-Classifier-for-ECGs/blob/main/report/img/windowing.jpg)

## The Model
The proposed model is a History-Time-Frequency ensemble
(HTF), as the classification is performed in parallel in the Time
domain and in the Frequency domain, while also accounting
for History in terms of the labels of the past heartbeats in the
ECG recording

![model](https://github.com/alberto-rota/PAC-PVC-Beat-Classifier-for-ECGs/blob/main/report/img/model.png)

## Test-set results
Results have been evaluated in terms of the model precision,
recall and f1-score on the 3 classes separately. The test set used
for such evaluation consists of 10% of the available dataset. The confusion matrix below reports the accuracy obtained by the Time model, Frequency Model and Ensembled Model for the three classes:

![confusion_matrices](https://github.com/alberto-rota/PAC-PVC-Beat-Classifier-for-ECGs/blob/main/report/img/confmatr.png)

