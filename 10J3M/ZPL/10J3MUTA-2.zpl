set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.5648, <2> 2.3974, <3> 47.3548, <4> 45.2173, <5> 37.2315, <6> 4.8881, <7> 34.577, <8> 20.4272, <9> 4.2162, <10> 10.0886;
param workload[JOB] := <1> 2.4486, <2> 5.7475, <3> 2242.4771, <4> 2044.6042, <5> 1386.1846, <6> 23.8935, <7> 1195.5689, <8> 417.2705, <9> 17.7763, <10> 101.7798;
param capacity[MACHINE] := <1> 2912.4974, <2> 2912.4974, <3> 2912.4974;

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
