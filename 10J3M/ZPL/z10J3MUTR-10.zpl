set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.7154, <2> 11.0305, <3> 37.3939, <4> 37.6801, <5> 11.6623, <6> 47.7198, <7> 45.7624, <8> 5.6953, <9> 31.7462, <10> 49.1174;
param workload[JOB] := <1> 26.4992, <2> 33.5858, <3> 37.1572, <4> 25.7475, <5> 22.5826, <6> 18.7381, <7> 18.8582, <8> 48.6423, <9> 38.6444, <10> 16.5723;
param capacity[MACHINE] := <1> 71.7569, <2> 71.7569, <3> 71.7569;

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
