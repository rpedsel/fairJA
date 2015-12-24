set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.3125, <2> 8.3318, <3> 7.7259, <4> 7.6679, <5> 2.0131, <6> 26.0169, <7> 3.032, <8> 36.2882, <9> 22.0325, <10> 5.6972;
param workload[JOB] := <1> 24.4837, <2> 10.2104, <3> 19.5648, <4> 4.3255, <5> 16.5396, <6> 46.314, <7> 9.8216, <8> 11.1022, <9> 3.0731, <10> 26.0354;
param capacity[MACHINE] := <1> 171.4703, <2> 171.4703, <3> 171.4703;

var x[JM] binary;
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
