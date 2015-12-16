set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5486, <2> 26.5294, <3> 26.4674, <4> 25.6751, <5> 27.4119, <6> 20.5615, <7> 32.6691, <8> 28.4129, <9> 22.6776, <10> 23.2562;
param workload[JOB] := <1> 18.5486, <2> 26.5294, <3> 26.4674, <4> 25.6751, <5> 27.4119, <6> 20.5615, <7> 32.6691, <8> 28.4129, <9> 22.6776, <10> 23.2562;
param capacity[MACHINE] := <1> 63.0524, <2> 63.0524, <3> 63.0524;

var x[JM] binary;
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
