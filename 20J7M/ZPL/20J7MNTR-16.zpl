set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8855, <2> 26.3513, <3> 24.086, <4> 29.9179, <5> 25.9576, <6> 33.5658, <7> 16.7662, <8> 28.1639, <9> 20.0321, <10> 23.2782, <11> 28.821, <12> 34.5864, <13> 21.9852, <14> 20.3886, <15> 17.5101, <16> 25.1923, <17> 22.687, <18> 19.9202, <19> 27.4784, <20> 25.6547;
param workload[JOB] := <1> 36.9117, <2> 34.2919, <3> 33.0607, <4> 24.107, <5> 38.5269, <6> 5.342, <7> 16.3491, <8> 13.2369, <9> 21.8791, <10> 14.0479, <11> 49.8728, <12> 1.3278, <13> 32.8096, <14> 10.4998, <15> 23.8068, <16> 2.446, <17> 20.1204, <18> 8.6561, <19> 25.4845, <20> 0.823;
param capacity[MACHINE] := <1> 44.3143, <2> 44.3143, <3> 44.3143, <4> 44.3143, <5> 44.3143, <6> 44.3143, <7> 44.3143;

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
