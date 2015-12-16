set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7686, <2> 35.8215, <3> 20.4519, <4> 16.743, <5> 22.1059, <6> 19.3469, <7> 18.3577, <8> 28.5283, <9> 21.5235, <10> 19.9285, <11> 27.6346, <12> 31.514, <13> 24.5349, <14> 26.6127, <15> 24.99, <16> 27.9958, <17> 15.7456, <18> 32.9045, <19> 27.8651, <20> 28.3577;
param workload[JOB] := <1> 28.7686, <2> 35.8215, <3> 20.4519, <4> 16.743, <5> 22.1059, <6> 19.3469, <7> 18.3577, <8> 28.5283, <9> 21.5235, <10> 19.9285, <11> 27.6346, <12> 31.514, <13> 24.5349, <14> 26.6127, <15> 24.99, <16> 27.9958, <17> 15.7456, <18> 32.9045, <19> 27.8651, <20> 28.3577;
param capacity[MACHINE] := <1> 499.7307, <2> 499.7307, <3> 499.7307, <4> 499.7307, <5> 499.7307, <6> 499.7307;

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
