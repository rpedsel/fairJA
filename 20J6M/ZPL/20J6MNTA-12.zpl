set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6802, <2> 20.6275, <3> 29.3918, <4> 31.4195, <5> 31.5933, <6> 15.8729, <7> 23.839, <8> 15.0271, <9> 17.7151, <10> 23.9823, <11> 27.0519, <12> 23.7515, <13> 28.2735, <14> 26.7679, <15> 19.3991, <16> 14.7496, <17> 21.2823, <18> 31.4728, <19> 27.0915, <20> 25.9198;
param workload[JOB] := <1> 766.1935, <2> 425.4938, <3> 863.8779, <4> 987.185, <5> 998.1366, <6> 251.949, <7> 568.2979, <8> 225.8137, <9> 313.8248, <10> 575.1507, <11> 731.8053, <12> 564.1338, <13> 799.3908, <14> 716.5205, <15> 376.3251, <16> 217.5507, <17> 452.9363, <18> 990.5371, <19> 733.9494, <20> 671.836;
param capacity[MACHINE] := <1> 1528.8635, <2> 1528.8635, <3> 1528.8635, <4> 1528.8635, <5> 1528.8635, <6> 1528.8635;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
