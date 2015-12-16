set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.4366, <2> 11.0091, <3> 28.9194, <4> 23.61, <5> 3.4591, <6> 21.9494, <7> 45.3435, <8> 22.943, <9> 23.4419, <10> 18.3346, <11> 27.3375, <12> 18.978, <13> 32.7645, <14> 44.957, <15> 1.5611, <16> 10.1168, <17> 38.1729, <18> 0.5058, <19> 31.6173, <20> 7.0611;
param workload[JOB] := <1> 13.4366, <2> 11.0091, <3> 28.9194, <4> 23.61, <5> 3.4591, <6> 21.9494, <7> 45.3435, <8> 22.943, <9> 23.4419, <10> 18.3346, <11> 27.3375, <12> 18.978, <13> 32.7645, <14> 44.957, <15> 1.5611, <16> 10.1168, <17> 38.1729, <18> 0.5058, <19> 31.6173, <20> 7.0611;
param capacity[MACHINE] := <1> 53.1898, <2> 53.1898, <3> 53.1898, <4> 53.1898, <5> 53.1898, <6> 53.1898;

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
