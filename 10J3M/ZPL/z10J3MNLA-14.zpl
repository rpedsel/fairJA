set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9508, <2> 26.6622, <3> 24.1169, <4> 20.992, <5> 29.3145, <6> 25.8556, <7> 16.5357, <8> 32.0274, <9> 27.6954, <10> 26.8069;
param workload[JOB] := <1> 622.5424, <2> 710.8729, <3> 581.6249, <4> 440.6641, <5> 859.3399, <6> 668.5121, <7> 273.4294, <8> 1025.7544, <9> 767.0352, <10> 718.6099;
param capacity[MACHINE] := <1> 2222.7951, <2> 2222.7951, <3> 2222.7951;

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
