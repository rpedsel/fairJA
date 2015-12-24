set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3268, <2> 26.308, <3> 22.2961, <4> 25.4033, <5> 24.6634, <6> 19.8193, <7> 31.8606, <8> 24.7835, <9> 26.3012, <10> 26.8784, <11> 23.8967, <12> 16.9946, <13> 16.3729, <14> 19.9347, <15> 31.8468, <16> 20.3047, <17> 34.9175, <18> 33.4128, <19> 21.8418, <20> 12.7531;
param workload[JOB] := <1> 4.6181, <2> 5.1291, <3> 4.7219, <4> 5.0402, <5> 4.9662, <6> 4.4519, <7> 5.6445, <8> 4.9783, <9> 5.1285, <10> 5.1844, <11> 4.8884, <12> 4.1225, <13> 4.0463, <14> 4.4648, <15> 5.6433, <16> 4.5061, <17> 5.9091, <18> 5.7804, <19> 4.6735, <20> 3.5711;
param capacity[MACHINE] := <1> 97.4686, <2> 97.4686, <3> 97.4686, <4> 97.4686, <5> 97.4686, <6> 97.4686, <7> 97.4686;

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
