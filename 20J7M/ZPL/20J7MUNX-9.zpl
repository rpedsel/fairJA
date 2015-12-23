set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.656, <2> 23.2183, <3> 12.917, <4> 4.2875, <5> 30.7103, <6> 29.5698, <7> 13.6586, <8> 30.5686, <9> 11.3856, <10> 22.9248, <11> 29.4708, <12> 18.3108, <13> 24.5885, <14> 23.1931, <15> 38.4817, <16> 40.152, <17> 24.0372, <18> 33.3873, <19> 41.5502, <20> 20.1519;
param workload[JOB] := <1> 3.8283, <2> 4.8185, <3> 3.594, <4> 2.0706, <5> 5.5417, <6> 5.4378, <7> 3.6958, <8> 5.5289, <9> 3.3743, <10> 4.788, <11> 5.4287, <12> 4.2791, <13> 4.9587, <14> 4.8159, <15> 6.2034, <16> 6.3366, <17> 4.9028, <18> 5.7782, <19> 6.4459, <20> 4.4891;
param capacity[MACHINE] := <1> 96.3163, <2> 96.3163, <3> 96.3163, <4> 96.3163, <5> 96.3163, <6> 96.3163, <7> 96.3163;

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
