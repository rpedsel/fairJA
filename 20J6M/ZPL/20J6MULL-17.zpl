set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0472, <2> 7.5749, <3> 47.389, <4> 8.3189, <5> 10.1406, <6> 30.4335, <7> 39.2977, <8> 30.4663, <9> 13.1709, <10> 22.7456, <11> 1.2135, <12> 3.5336, <13> 28.1136, <14> 7.3241, <15> 33.7504, <16> 36.9035, <17> 33.8741, <18> 14.8556, <19> 7.8481, <20> 11.0799;
param workload[JOB] := <1> 11.0472, <2> 7.5749, <3> 47.389, <4> 8.3189, <5> 10.1406, <6> 30.4335, <7> 39.2977, <8> 30.4663, <9> 13.1709, <10> 22.7456, <11> 1.2135, <12> 3.5336, <13> 28.1136, <14> 7.3241, <15> 33.7504, <16> 36.9035, <17> 33.8741, <18> 14.8556, <19> 7.8481, <20> 11.0799;
param capacity[MACHINE] := <1> 66.5135, <2> 66.5135, <3> 66.5135, <4> 66.5135, <5> 66.5135, <6> 66.5135;

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
