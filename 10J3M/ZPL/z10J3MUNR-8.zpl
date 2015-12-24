set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.689, <2> 36.7657, <3> 3.4961, <4> 38.0461, <5> 7.8943, <6> 17.1202, <7> 3.8843, <8> 6.6916, <9> 10.258, <10> 25.6141;
param workload[JOB] := <1> 23.7997, <2> 16.082, <3> 42.4155, <4> 15.6716, <5> 32.8019, <6> 6.0117, <7> 9.2366, <8> 49.2194, <9> 10.1304, <10> 35.0341;
param capacity[MACHINE] := <1> 240.4029, <2> 240.4029, <3> 240.4029;

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
