set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7486, <2> 29.7035, <3> 16.7224, <4> 22.4618, <5> 27.8954, <6> 28.6957, <7> 28.2946, <8> 30.4301, <9> 15.5689, <10> 21.8385;
param workload[JOB] := <1> 6.7558, <2> 9.7772, <3> 16.9893, <4> 14.7407, <5> 19.9095, <6> 3.0301, <7> 37.2734, <8> 29.5268, <9> 37.8069, <10> 31.2829;
param capacity[MACHINE] := <1> 207.0926, <2> 207.0926, <3> 207.0926;

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
