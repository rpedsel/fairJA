set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.95, <2> 16.3508, <3> 18.0044, <4> 24.4554, <5> 23.3601, <6> 19.1032, <7> 14.123, <8> 20.5701, <9> 22.9846, <10> 31.4304, <11> 32.1949, <12> 30.3449, <13> 18.476, <14> 21.2302, <15> 25.9175, <16> 29.2272, <17> 28.4802, <18> 30.5805, <19> 19.6854, <20> 20.3025;
param workload[JOB] := <1> 4.8939, <2> 4.0436, <3> 4.2432, <4> 4.9452, <5> 4.8332, <6> 4.3707, <7> 3.7581, <8> 4.5354, <9> 4.7942, <10> 5.6063, <11> 5.6741, <12> 5.5086, <13> 4.2984, <14> 4.6076, <15> 5.0909, <16> 5.4062, <17> 5.3367, <18> 5.53, <19> 4.4368, <20> 4.5058;
param capacity[MACHINE] := <1> 10.3306, <2> 10.3306, <3> 10.3306, <4> 10.3306, <5> 10.3306, <6> 10.3306, <7> 10.3306;

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
