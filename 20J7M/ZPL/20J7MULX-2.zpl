set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7113, <2> 21.4354, <3> 9.7547, <4> 33.4991, <5> 38.4267, <6> 32.9393, <7> 17.6646, <8> 44.6491, <9> 49.8434, <10> 27.4385, <11> 14.8495, <12> 24.5094, <13> 14.7817, <14> 6.5199, <15> 6.5178, <16> 41.0066, <17> 16.7877, <18> 44.628, <19> 9.8514, <20> 0.3856;
param workload[JOB] := <1> 3.1163, <2> 4.6298, <3> 3.1233, <4> 5.7878, <5> 6.1989, <6> 5.7393, <7> 4.2029, <8> 6.682, <9> 7.06, <10> 5.2382, <11> 3.8535, <12> 4.9507, <13> 3.8447, <14> 2.5534, <15> 2.553, <16> 6.4036, <17> 4.0973, <18> 6.6804, <19> 3.1387, <20> 0.621;
param capacity[MACHINE] := <1> 12.925, <2> 12.925, <3> 12.925, <4> 12.925, <5> 12.925, <6> 12.925, <7> 12.925;

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
