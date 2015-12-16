set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.4484, <2> 27.9276, <3> 38.4709, <4> 35.6746, <5> 35.1749, <6> 9.2848, <7> 20.8724, <8> 25.8804, <9> 28.6165, <10> 28.3689, <11> 21.4992, <12> 35.6572, <13> 46.1483, <14> 19.4803, <15> 28.6739, <16> 42.0785, <17> 1.7196, <18> 19.7837, <19> 24.3291, <20> 22.528;
param workload[JOB] := <1> 4.0557, <2> 5.2847, <3> 6.2025, <4> 5.9728, <5> 5.9308, <6> 3.0471, <7> 4.5686, <8> 5.0873, <9> 5.3494, <10> 5.3262, <11> 4.6367, <12> 5.9714, <13> 6.7933, <14> 4.4136, <15> 5.3548, <16> 6.4868, <17> 1.3113, <18> 4.4479, <19> 4.9325, <20> 4.7464;
param capacity[MACHINE] := <1> 12.49, <2> 12.49, <3> 12.49, <4> 12.49, <5> 12.49, <6> 12.49;

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
