set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.8529, <2> 19.3966, <3> 18.7808, <4> 19.5207, <5> 43.0566, <6> 40.4859, <7> 24.1421, <8> 39.3326, <9> 1.7532, <10> 45.2958, <11> 22.9767, <12> 44.2175, <13> 48.6743, <14> 19.4754, <15> 27.1834, <16> 43.2609, <17> 13.1413, <18> 42.9991, <19> 47.7871, <20> 6.9476;
param workload[JOB] := <1> 2.8023, <2> 4.4042, <3> 4.3337, <4> 4.4182, <5> 6.5618, <6> 6.3629, <7> 4.9135, <8> 6.2716, <9> 1.3241, <10> 6.7302, <11> 4.7934, <12> 6.6496, <13> 6.9767, <14> 4.4131, <15> 5.2138, <16> 6.5773, <17> 3.6251, <18> 6.5574, <19> 6.9128, <20> 2.6358;
param capacity[MACHINE] := <1> 14.6396, <2> 14.6396, <3> 14.6396, <4> 14.6396, <5> 14.6396, <6> 14.6396, <7> 14.6396;

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
