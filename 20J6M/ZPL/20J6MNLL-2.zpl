set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4744, <2> 30.3618, <3> 19.6397, <4> 18.3707, <5> 23.3949, <6> 25.6937, <7> 16.0002, <8> 30.2224, <9> 18.2163, <10> 30.5627, <11> 25.2732, <12> 22.9936, <13> 28.967, <14> 36.2263, <15> 26.0274, <16> 24.9203, <17> 23.8985, <18> 18.7656, <19> 28.7203, <20> 18.6796;
param workload[JOB] := <1> 25.4744, <2> 30.3618, <3> 19.6397, <4> 18.3707, <5> 23.3949, <6> 25.6937, <7> 16.0002, <8> 30.2224, <9> 18.2163, <10> 30.5627, <11> 25.2732, <12> 22.9936, <13> 28.967, <14> 36.2263, <15> 26.0274, <16> 24.9203, <17> 23.8985, <18> 18.7656, <19> 28.7203, <20> 18.6796;
param capacity[MACHINE] := <1> 82.0681, <2> 82.0681, <3> 82.0681, <4> 82.0681, <5> 82.0681, <6> 82.0681;

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
