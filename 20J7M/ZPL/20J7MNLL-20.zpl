set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3542, <2> 28.0452, <3> 15.7106, <4> 24.8122, <5> 21.6249, <6> 29.3894, <7> 21.6964, <8> 20.2536, <9> 33.6409, <10> 19.5732, <11> 15.2975, <12> 19.8106, <13> 27.851, <14> 27.387, <15> 24.3324, <16> 33.4303, <17> 26.66, <18> 19.5446, <19> 22.2833, <20> 28.4774;
param workload[JOB] := <1> 17.3542, <2> 28.0452, <3> 15.7106, <4> 24.8122, <5> 21.6249, <6> 29.3894, <7> 21.6964, <8> 20.2536, <9> 33.6409, <10> 19.5732, <11> 15.2975, <12> 19.8106, <13> 27.851, <14> 27.387, <15> 24.3324, <16> 33.4303, <17> 26.66, <18> 19.5446, <19> 22.2833, <20> 28.4774;
param capacity[MACHINE] := <1> 68.1678, <2> 68.1678, <3> 68.1678, <4> 68.1678, <5> 68.1678, <6> 68.1678, <7> 68.1678;

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
