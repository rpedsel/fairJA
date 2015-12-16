set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.7791, <2> 30.2162, <3> 18.6486, <4> 23.8024, <5> 13.5165, <6> 2.1027, <7> 34.4565, <8> 42.3316, <9> 24.6152, <10> 43.3939;
param workload[JOB] := <1> 5.8974, <2> 5.4969, <3> 4.3184, <4> 4.8788, <5> 3.6765, <6> 1.4501, <7> 5.87, <8> 6.5063, <9> 4.9614, <10> 6.5874;
param capacity[MACHINE] := <1> 16.5477, <2> 16.5477, <3> 16.5477;

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
