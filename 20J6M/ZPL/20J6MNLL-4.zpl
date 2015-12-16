set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.7795, <2> 23.8581, <3> 20.8611, <4> 19.9259, <5> 30.081, <6> 18.0916, <7> 22.297, <8> 27.6272, <9> 22.9363, <10> 21.672, <11> 22.4403, <12> 27.17, <13> 23.187, <14> 22.5982, <15> 22.2622, <16> 22.9111, <17> 31.2933, <18> 28.193, <19> 22.834, <20> 21.5411;
param workload[JOB] := <1> 12.7795, <2> 23.8581, <3> 20.8611, <4> 19.9259, <5> 30.081, <6> 18.0916, <7> 22.297, <8> 27.6272, <9> 22.9363, <10> 21.672, <11> 22.4403, <12> 27.17, <13> 23.187, <14> 22.5982, <15> 22.2622, <16> 22.9111, <17> 31.2933, <18> 28.193, <19> 22.834, <20> 21.5411;
param capacity[MACHINE] := <1> 77.4266, <2> 77.4266, <3> 77.4266, <4> 77.4266, <5> 77.4266, <6> 77.4266;

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
