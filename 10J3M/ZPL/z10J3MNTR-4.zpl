set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.1768, <2> 32.8532, <3> 19.0824, <4> 26.1337, <5> 18.9137, <6> 21.3021, <7> 30.6049, <8> 28.1927, <9> 33.6084, <10> 19.8633;
param workload[JOB] := <1> 28.7012, <2> 32.4886, <3> 13.1272, <4> 16.9749, <5> 17.2002, <6> 9.2482, <7> 38.9518, <8> 38.4703, <9> 36.439, <10> 39.6014;
param capacity[MACHINE] := <1> 67.8007, <2> 67.8007, <3> 67.8007;

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
