set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2353, <2> 28.9224, <3> 18.7388, <4> 21.6484, <5> 35.2688, <6> 27.3031, <7> 36.698, <8> 22.3662, <9> 23.1964, <10> 24.0305, <11> 18.8649, <12> 24.3895, <13> 18.379, <14> 22.5983, <15> 32.7622, <16> 17.8571, <17> 29.5638, <18> 21.3005, <19> 20.7513, <20> 24.4699;
param workload[JOB] := <1> 47.3356, <2> 31.5579, <3> 27.817, <4> 33.8751, <5> 5.1731, <6> 6.55, <7> 28.0318, <8> 21.2435, <9> 15.9763, <10> 4.403, <11> 20.3545, <12> 15.4517, <13> 22.4847, <14> 35.2328, <15> 12.3452, <16> 23.3998, <17> 7.8079, <18> 3.4553, <19> 9.1892, <20> 34.4388;
param capacity[MACHINE] := <1> 50.7654, <2> 50.7654, <3> 50.7654, <4> 50.7654, <5> 50.7654, <6> 50.7654;

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
