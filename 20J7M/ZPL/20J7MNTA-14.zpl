set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0732, <2> 19.2051, <3> 22.211, <4> 18.4672, <5> 29.0027, <6> 23.5557, <7> 20.9179, <8> 24.5072, <9> 16.8468, <10> 24.9777, <11> 26.8765, <12> 26.4607, <13> 22.9145, <14> 24.5377, <15> 16.3301, <16> 25.1434, <17> 26.6803, <18> 32.6865, <19> 26.0065, <20> 30.3242;
param workload[JOB] := <1> 402.9334, <2> 368.8359, <3> 493.3285, <4> 341.0375, <5> 841.1566, <6> 554.871, <7> 437.5585, <8> 600.6029, <9> 283.8147, <10> 623.8855, <11> 722.3463, <12> 700.1686, <13> 525.0743, <14> 602.0987, <15> 266.6722, <16> 632.1906, <17> 711.8384, <18> 1068.4073, <19> 676.338, <20> 919.5571;
param capacity[MACHINE] := <1> 1261.3625, <2> 1261.3625, <3> 1261.3625, <4> 1261.3625, <5> 1261.3625, <6> 1261.3625, <7> 1261.3625;

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