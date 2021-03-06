set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.1442, <2> 3.9686, <3> 12.4851, <4> 1.9809, <5> 7.5345, <6> 18.9889, <7> 44.7324, <8> 5.3682, <9> 6.4121, <10> 35.3702, <11> 41.1016, <12> 8.622, <13> 1.4959, <14> 23.3117, <15> 28.2075, <16> 15.909, <17> 26.4366, <18> 8.9317, <19> 28.6263, <20> 17.1499;
param workload[JOB] := <1> 38.2294, <2> 45.5016, <3> 26.1184, <4> 49.8005, <5> 26.7354, <6> 16.8368, <7> 5.3655, <8> 47.5349, <9> 11.2386, <10> 7.1473, <11> 41.1353, <12> 36.2968, <13> 43.8017, <14> 46.2595, <15> 28.8594, <16> 37.248, <17> 18.8704, <18> 2.1969, <19> 36.0374, <20> 38.3209;
param capacity[MACHINE] := <1> 603.5347, <2> 603.5347, <3> 603.5347, <4> 603.5347, <5> 603.5347, <6> 603.5347, <7> 603.5347;

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
