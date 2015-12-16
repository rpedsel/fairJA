set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.025, <2> 18.9124, <3> 25.0806, <4> 15.4422, <5> 20.3738, <6> 29.0504, <7> 24.5226, <8> 32.4162, <9> 23.7891, <10> 25.0938, <11> 33.8093, <12> 26.9261, <13> 22.93, <14> 22.8628, <15> 35.6409, <16> 27.9317, <17> 25.8044, <18> 32.1331, <19> 20.8637, <20> 24.2927;
param workload[JOB] := <1> 29.025, <2> 18.9124, <3> 25.0806, <4> 15.4422, <5> 20.3738, <6> 29.0504, <7> 24.5226, <8> 32.4162, <9> 23.7891, <10> 25.0938, <11> 33.8093, <12> 26.9261, <13> 22.93, <14> 22.8628, <15> 35.6409, <16> 27.9317, <17> 25.8044, <18> 32.1331, <19> 20.8637, <20> 24.2927;
param capacity[MACHINE] := <1> 86.1501, <2> 86.1501, <3> 86.1501, <4> 86.1501, <5> 86.1501, <6> 86.1501;

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
