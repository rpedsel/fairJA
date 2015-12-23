set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5364, <2> 22.7767, <3> 19.746, <4> 13.3278, <5> 37.7994, <6> 31.8781, <7> 43.7871, <8> 12.0372, <9> 19.1041, <10> 16.5791, <11> 15.6995, <12> 26.6588, <13> 22.4861, <14> 28.3452, <15> 29.7398, <16> 27.7381, <17> 46.188, <18> 14.2792, <19> 47.1128, <20> 37.2254;
param workload[JOB] := <1> 4.8514, <2> 4.7725, <3> 4.4436, <4> 3.6507, <5> 6.1481, <6> 5.6461, <7> 6.6172, <8> 3.4695, <9> 4.3708, <10> 4.0717, <11> 3.9623, <12> 5.1632, <13> 4.742, <14> 5.324, <15> 5.4534, <16> 5.2667, <17> 6.7962, <18> 3.7788, <19> 6.8639, <20> 6.1013;
param capacity[MACHINE] := <1> 101.4934, <2> 101.4934, <3> 101.4934, <4> 101.4934, <5> 101.4934, <6> 101.4934, <7> 101.4934;

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
