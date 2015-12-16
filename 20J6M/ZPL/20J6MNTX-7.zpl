set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.6619, <2> 25.7679, <3> 20.9482, <4> 23.0405, <5> 32.8111, <6> 20.8887, <7> 31.6578, <8> 19.1116, <9> 23.9336, <10> 24.2997, <11> 43.7193, <12> 27.0087, <13> 18.0562, <14> 31.2095, <15> 29.9588, <16> 21.579, <17> 23.6569, <18> 30.753, <19> 22.0349, <20> 32.4474;
param workload[JOB] := <1> 5.6269, <2> 5.0762, <3> 4.5769, <4> 4.8001, <5> 5.7281, <6> 4.5704, <7> 5.6265, <8> 4.3717, <9> 4.8922, <10> 4.9295, <11> 6.6121, <12> 5.197, <13> 4.2493, <14> 5.5865, <15> 5.4735, <16> 4.6453, <17> 4.8638, <18> 5.5455, <19> 4.6941, <20> 5.6963;
param capacity[MACHINE] := <1> 12.8453, <2> 12.8453, <3> 12.8453, <4> 12.8453, <5> 12.8453, <6> 12.8453;

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
