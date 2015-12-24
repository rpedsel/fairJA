set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7564, <2> 49.1457, <3> 13.3021, <4> 43.9367, <5> 6.76, <6> 16.4498, <7> 48.1919, <8> 9.4765, <9> 2.7542, <10> 38.7158, <11> 26.7826, <12> 38.3254, <13> 21.0367, <14> 6.3095, <15> 1.4766, <16> 40.9299, <17> 3.562, <18> 42.0765, <19> 46.4318, <20> 16.3767;
param workload[JOB] := <1> 8.7564, <2> 49.1457, <3> 13.3021, <4> 43.9367, <5> 6.76, <6> 16.4498, <7> 48.1919, <8> 9.4765, <9> 2.7542, <10> 38.7158, <11> 26.7826, <12> 38.3254, <13> 21.0367, <14> 6.3095, <15> 1.4766, <16> 40.9299, <17> 3.562, <18> 42.0765, <19> 46.4318, <20> 16.3767;
param capacity[MACHINE] := <1> 68.6853, <2> 68.6853, <3> 68.6853, <4> 68.6853, <5> 68.6853, <6> 68.6853, <7> 68.6853;

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
