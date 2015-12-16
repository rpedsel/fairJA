set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5733, <2> 24.1177, <3> 33.1917, <4> 17.5818, <5> 25.8255, <6> 24.879, <7> 23.91, <8> 26.5347, <9> 13.1131, <10> 28.3724, <11> 10.4388, <12> 15.8213, <13> 27.5596, <14> 20.5445, <15> 26.0879, <16> 27.0707, <17> 18.5333, <18> 22.8054, <19> 24.5662, <20> 27.5416;
param workload[JOB] := <1> 5.251, <2> 4.911, <3> 5.7612, <4> 4.1931, <5> 5.0819, <6> 4.9879, <7> 4.8898, <8> 5.1512, <9> 3.6212, <10> 5.3266, <11> 3.2309, <12> 3.9776, <13> 5.2497, <14> 4.5326, <15> 5.1076, <16> 5.203, <17> 4.305, <18> 4.7755, <19> 4.9564, <20> 5.248;
param capacity[MACHINE] := <1> 95.7612, <2> 95.7612, <3> 95.7612, <4> 95.7612, <5> 95.7612, <6> 95.7612;

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
