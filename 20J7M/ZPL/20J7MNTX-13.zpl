set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6858, <2> 30.8244, <3> 29.1379, <4> 21.9418, <5> 29.8325, <6> 29.816, <7> 23.7299, <8> 27.7264, <9> 22.5045, <10> 25.6556, <11> 24.0498, <12> 32.1756, <13> 22.995, <14> 28.4115, <15> 23.2847, <16> 30.8403, <17> 33.93, <18> 24.4094, <19> 28.218, <20> 24.3734;
param workload[JOB] := <1> 5.5395, <2> 5.552, <3> 5.398, <4> 4.6842, <5> 5.4619, <6> 5.4604, <7> 4.8713, <8> 5.2656, <9> 4.7439, <10> 5.0651, <11> 4.9041, <12> 5.6724, <13> 4.7953, <14> 5.3302, <15> 4.8254, <16> 5.5534, <17> 5.8249, <18> 4.9406, <19> 5.3121, <20> 4.9369;
param capacity[MACHINE] := <1> 11.1575, <2> 11.1575, <3> 11.1575, <4> 11.1575, <5> 11.1575, <6> 11.1575, <7> 11.1575;

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
