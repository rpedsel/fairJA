set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.8575, <2> 39.0189, <3> 40.9278, <4> 27.7567, <5> 12.2642, <6> 32.1461, <7> 22.3858, <8> 5.7997, <9> 25.1885, <10> 4.1284, <11> 15.3127, <12> 29.2834, <13> 35.4936, <14> 45.2876, <15> 18.1472, <16> 26.1007, <17> 40.0968, <18> 12.5773, <19> 15.6942, <20> 17.0666;
param workload[JOB] := <1> 2102.9103, <2> 1522.4746, <3> 1675.0848, <4> 770.4344, <5> 150.4106, <6> 1033.3717, <7> 501.124, <8> 33.6365, <9> 634.4605, <10> 17.0437, <11> 234.4788, <12> 857.5175, <13> 1259.7956, <14> 2050.9667, <15> 329.3209, <16> 681.2465, <17> 1607.7534, <18> 158.1885, <19> 246.3079, <20> 291.2688;
param capacity[MACHINE] := <1> 1731.1924, <2> 1731.1924, <3> 1731.1924, <4> 1731.1924, <5> 1731.1924, <6> 1731.1924, <7> 1731.1924;

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