set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0281, <2> 28.051, <3> 26.927, <4> 15.4023, <5> 22.6199, <6> 24.9245, <7> 24.1876, <8> 24.1037, <9> 15.9545, <10> 20.9532, <11> 20.2849, <12> 22.1481, <13> 23.6149, <14> 27.3629, <15> 23.1836, <16> 22.5561, <17> 25.411, <18> 25.6617, <19> 27.6213, <20> 27.4827;
param workload[JOB] := <1> 4.9018, <2> 5.2963, <3> 5.1891, <4> 3.9246, <5> 4.756, <6> 4.9924, <7> 4.9181, <8> 4.9096, <9> 3.9943, <10> 4.5775, <11> 4.5039, <12> 4.7062, <13> 4.8595, <14> 5.231, <15> 4.8149, <16> 4.7493, <17> 5.0409, <18> 5.0657, <19> 5.2556, <20> 5.2424;
param capacity[MACHINE] := <1> 96.9291, <2> 96.9291, <3> 96.9291, <4> 96.9291, <5> 96.9291, <6> 96.9291;

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
