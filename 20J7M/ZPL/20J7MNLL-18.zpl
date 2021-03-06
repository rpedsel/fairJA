set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.0239, <2> 17.8877, <3> 31.0123, <4> 15.7052, <5> 20.9394, <6> 25.7944, <7> 29.1567, <8> 21.155, <9> 26.1527, <10> 16.8166, <11> 27.1968, <12> 27.7422, <13> 21.1367, <14> 27.4654, <15> 31.5222, <16> 27.5113, <17> 26.5552, <18> 30.7125, <19> 21.7028, <20> 23.7055;
param workload[JOB] := <1> 31.0239, <2> 17.8877, <3> 31.0123, <4> 15.7052, <5> 20.9394, <6> 25.7944, <7> 29.1567, <8> 21.155, <9> 26.1527, <10> 16.8166, <11> 27.1968, <12> 27.7422, <13> 21.1367, <14> 27.4654, <15> 31.5222, <16> 27.5113, <17> 26.5552, <18> 30.7125, <19> 21.7028, <20> 23.7055;
param capacity[MACHINE] := <1> 71.5564, <2> 71.5564, <3> 71.5564, <4> 71.5564, <5> 71.5564, <6> 71.5564, <7> 71.5564;

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
