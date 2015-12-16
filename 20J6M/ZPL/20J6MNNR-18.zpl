set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4608, <2> 24.4203, <3> 24.274, <4> 27.4968, <5> 23.9857, <6> 24.3997, <7> 33.7541, <8> 27.8129, <9> 21.2001, <10> 23.2304, <11> 22.0954, <12> 18.4134, <13> 26.8269, <14> 25.5086, <15> 18.1666, <16> 21.5335, <17> 20.4585, <18> 21.021, <19> 22.8781, <20> 28.922;
param workload[JOB] := <1> 21.5242, <2> 11.631, <3> 15.4596, <4> 5.658, <5> 12.6485, <6> 5.1022, <7> 8.8773, <8> 7.3612, <9> 36.6306, <10> 28.2706, <11> 22.0652, <12> 26.4196, <13> 14.5826, <14> 7.8135, <15> 29.2119, <16> 16.6923, <17> 34.4563, <18> 12.1228, <19> 8.3811, <20> 12.6478;
param capacity[MACHINE] := <1> 337.5563, <2> 337.5563, <3> 337.5563, <4> 337.5563, <5> 337.5563, <6> 337.5563;

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
