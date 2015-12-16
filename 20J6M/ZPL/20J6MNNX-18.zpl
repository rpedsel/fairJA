set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5442, <2> 19.5454, <3> 22.2993, <4> 23.7798, <5> 25.4282, <6> 20.2573, <7> 19.7581, <8> 28.8262, <9> 27.9052, <10> 24.1114, <11> 24.6576, <12> 26.8564, <13> 27.0129, <14> 18.6123, <15> 28.176, <16> 27.4471, <17> 26.0977, <18> 30.8615, <19> 21.4713, <20> 31.1556;
param workload[JOB] := <1> 4.8522, <2> 4.421, <3> 4.7222, <4> 4.8765, <5> 5.0426, <6> 4.5008, <7> 4.445, <8> 5.369, <9> 5.2825, <10> 4.9103, <11> 4.9656, <12> 5.1823, <13> 5.1974, <14> 4.3142, <15> 5.3081, <16> 5.239, <17> 5.1086, <18> 5.5553, <19> 4.6337, <20> 5.5817;
param capacity[MACHINE] := <1> 99.508, <2> 99.508, <3> 99.508, <4> 99.508, <5> 99.508, <6> 99.508;

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
