set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0387, <2> 29.908, <3> 25.1621, <4> 27.1267, <5> 21.3001, <6> 27.6242, <7> 20.3763, <8> 30.4677, <9> 20.6462, <10> 25.8358;
param workload[JOB] := <1> 843.2461, <2> 894.4885, <3> 633.1313, <4> 735.8579, <5> 453.6943, <6> 763.0964, <7> 415.1936, <8> 928.2807, <9> 426.2656, <10> 667.4886;
param capacity[MACHINE] := <1> 2253.581, <2> 2253.581, <3> 2253.581;

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
