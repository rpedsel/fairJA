set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.477, <2> 34.3354, <3> 10.3586, <4> 18.9114, <5> 3.1636, <6> 32.8804, <7> 48.9083, <8> 44.1924, <9> 22.0819, <10> 41.3296, <11> 23.9817, <12> 41.7006, <13> 26.3839, <14> 41.8439, <15> 6.0276, <16> 0.028, <17> 41.8172, <18> 32.0329, <19> 9.9132, <20> 24.0446;
param workload[JOB] := <1> 4.5252, <2> 5.8596, <3> 3.2185, <4> 4.3487, <5> 1.7787, <6> 5.7341, <7> 6.9934, <8> 6.6477, <9> 4.6991, <10> 6.4288, <11> 4.8971, <12> 6.4576, <13> 5.1365, <14> 6.4687, <15> 2.4551, <16> 0.1673, <17> 6.4666, <18> 5.6598, <19> 3.1485, <20> 4.9035;
param capacity[MACHINE] := <1> 15.9991, <2> 15.9991, <3> 15.9991, <4> 15.9991, <5> 15.9991, <6> 15.9991;

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
