set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9622, <2> 11.4409, <3> 8.663, <4> 34.5719, <5> 38.6228, <6> 46.8398, <7> 39.7247, <8> 18.7481, <9> 12.337, <10> 28.5735, <11> 1.0312, <12> 10.4751, <13> 38.8214, <14> 38.0528, <15> 49.7339, <16> 29.3151, <17> 6.0564, <18> 2.7853, <19> 19.4574, <20> 15.2972;
param workload[JOB] := <1> 27.9622, <2> 11.4409, <3> 8.663, <4> 34.5719, <5> 38.6228, <6> 46.8398, <7> 39.7247, <8> 18.7481, <9> 12.337, <10> 28.5735, <11> 1.0312, <12> 10.4751, <13> 38.8214, <14> 38.0528, <15> 49.7339, <16> 29.3151, <17> 6.0564, <18> 2.7853, <19> 19.4574, <20> 15.2972;
param capacity[MACHINE] := <1> 59.8137, <2> 59.8137, <3> 59.8137, <4> 59.8137, <5> 59.8137, <6> 59.8137;

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
